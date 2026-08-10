-- Homeland Hunt starter schema
-- Concept architecture: review RLS, compliance and production constraints before deployment.

create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  handle text unique,
  display_name text,
  legacy_status boolean not null default false,
  xp bigint not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  event_type text not null default 'monthly',
  starts_at timestamptz not null,
  ends_at timestamptz not null,
  status text not null default 'draft',
  prize_pool_cents bigint,
  created_at timestamptz not null default now()
);

create table if not exists public.event_entries (
  id uuid primary key default gen_random_uuid(),
  event_id uuid not null references public.events(id) on delete cascade,
  player_id uuid not null references public.profiles(id) on delete cascade,
  tier_cents integer not null,
  entered_at timestamptz not null default now(),
  unique(event_id, player_id)
);

create table if not exists public.regions (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.clues (
  id uuid primary key default gen_random_uuid(),
  event_id uuid references public.events(id) on delete cascade,
  region_id uuid references public.regions(id) on delete set null,
  clue_type text not null,
  public_prompt text not null,
  answer_hash text not null,
  difficulty integer not null default 1,
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.player_clue_state (
  id uuid primary key default gen_random_uuid(),
  player_id uuid not null references public.profiles(id) on delete cascade,
  clue_id uuid not null references public.clues(id) on delete cascade,
  status text not null default 'locked',
  solved_at timestamptz,
  attempts integer not null default 0,
  unique(player_id, clue_id)
);

create table if not exists public.item_definitions (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  item_type text not null,
  archetype text,
  rarity text not null default 'common',
  effect_config jsonb not null default '{}'::jsonb,
  transferable boolean not null default false,
  nft_eligible boolean not null default false
);

create table if not exists public.inventory_items (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references public.profiles(id) on delete cascade,
  item_definition_id uuid not null references public.item_definitions(id),
  token_reference text,
  charges integer,
  acquired_at timestamptz not null default now(),
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists public.item_activations (
  id uuid primary key default gen_random_uuid(),
  event_id uuid not null references public.events(id) on delete cascade,
  player_id uuid not null references public.profiles(id) on delete cascade,
  inventory_item_id uuid not null references public.inventory_items(id),
  activated_at timestamptz not null default now(),
  result jsonb not null default '{}'::jsonb
);

create table if not exists public.npcs (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  npc_role text not null,
  persona_policy jsonb not null default '{}'::jsonb,
  tool_permissions jsonb not null default '[]'::jsonb,
  active boolean not null default true
);

create table if not exists public.npc_sessions (
  id uuid primary key default gen_random_uuid(),
  npc_id uuid not null references public.npcs(id),
  player_id uuid not null references public.profiles(id),
  event_id uuid references public.events(id),
  state jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.leaderboard_entries (
  event_id uuid not null references public.events(id) on delete cascade,
  player_id uuid not null references public.profiles(id) on delete cascade,
  score numeric not null default 0,
  completion_ms bigint,
  rank integer,
  updated_at timestamptz not null default now(),
  primary key(event_id, player_id)
);

create table if not exists public.reward_records (
  id uuid primary key default gen_random_uuid(),
  event_id uuid references public.events(id),
  player_id uuid not null references public.profiles(id),
  reward_type text not null,
  amount_cents bigint,
  item_id uuid references public.inventory_items(id),
  status text not null default 'pending',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

-- Seed canonical object definitions without locking final effects.
insert into public.item_definitions (slug, name, item_type, archetype, rarity, nft_eligible)
values
  ('shield', 'Shield', 'tool', 'guardian', 'common', true),
  ('helmet', 'Helmet', 'tool', 'analyst', 'common', true),
  ('anchor', 'Anchor', 'tool', 'pathfinder', 'common', true),
  ('timepiece', 'Timepiece', 'tool', 'strategist', 'common', true)
on conflict (slug) do nothing;

-- Production requirement: enable and define Row Level Security policies before exposing tables to clients.
