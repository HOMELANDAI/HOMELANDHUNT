# Technical Architecture

## Backend

HomelandAI standard stack:

- Supabase Database
- Supabase Auth
- Supabase Edge Functions
- Supabase Realtime
- Supabase Storage

## Service Domains

### Identity

Profiles, age/region eligibility, Legacy status, entitlements.

### Tournament

Events, entry tiers, qualification, timers, leaderboard, results, prize state.

### World

Regions, maps, locations, routes, clue chains, Easter eggs.

### Inventory

Tools, object instances, ownership, activation, cooldowns, loadouts.

### NPC / Agent

Characters, persona policies, quest bindings, memory references, conversation sessions and tool permissions.

### Economy

Catalog, purchases, entitlements, mint references, marketplace/royalty records where applicable.

### Broadcast

Viewer-safe game state, POV metadata, overlay events and replay markers.

## Authority Model

The backend—not the client or generative model—must be authoritative for:

- timer state;
- clue completion;
- tool activation;
- inventory;
- leaderboard ranking;
- event eligibility;
- prize outcomes.

## Realtime

Supabase Realtime can distribute:

- leaderboard updates;
- player/team status;
- event countdowns;
- public NPC/event messages;
- object activation events;
- broadcast overlay state.

## Storage

Supabase Storage can hold:

- map imagery;
- NPC visual/audio assets;
- approved artist assets;
- game clips;
- replay markers/media;
- lyric/puzzle visual assets;
- event artwork;
- HAI gateway media cards.

## Edge Functions

Recommended responsibilities:

- event-entry validation;
- prize-eligibility calculation;
- secure clue validation;
- tool activation;
- NFT/mint orchestration adapters;
- AI agent tool gateway;
- broadcast-safe state projection;
- anti-cheat event logging.

## AI Boundary

AI agents should receive only the minimum state necessary. Correct answers, prize-control secrets and privileged admin state must remain outside model context.
