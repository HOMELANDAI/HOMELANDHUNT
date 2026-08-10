# HOMELAND HUNT by HAI

Homeland Hunt is a multiplayer, music-driven scavenger hunt and competitive entertainment platform developed by HomelandAI (HAI). Players decipher clues hidden in lyrics and music, navigate a game world using maps and tools, interact with AI-powered characters, complete timed challenges, compete on leaderboards, and pursue cash, access, and collectible rewards.

The project combines game design, AI NPC/CPC systems, XR/AR potential, livestream entertainment, prize tournaments, and an HAI-owned NFT economy.

## Core Gameplay Loop

1. Enter a monthly or special event.
2. Receive or discover lyrical/music clues.
3. Decode clues to identify destinations, objects, NPCs, or actions.
4. Navigate the world using found or purchased maps.
5. Equip or acquire tools such as Shields, Helmets, Anchors, and Timepieces.
6. Interact with NPCs/CPCs for guidance, misinformation, quests, lore, or commerce.
7. Complete objectives against the clock.
8. Earn leaderboard position, cash prizes, access rewards, and NFT assets.
9. Return for monthly contests, seasonal events, and grand-prize qualification.

## Defining Pillars

- **Music as game logic:** clues can be embedded in lyrics, rhythms, song structures, audio patterns, or original music.
- **Persistent AI characters:** real artists and original HAI characters can function as mentors, rivals, merchants, guides, lore keepers, and dynamic quest agents.
- **Strategic tools:** gameplay objects change navigation, protection, clue interpretation, and time management.
- **Prize economy:** recurring monthly contests, February/December high-payout events, Legacy perks, leaderboards, and annual championship/retreat concepts.
- **HAI NFT economy:** direct first-sale monetization, collectible and functional assets, access tokens, and secondary-sale royalties.
- **Livestream-native design:** Twitch for broad live discovery and interaction; Maestro.tv for premium interactive viewing, Mixcast experiences, replays, and member access.
- **XR expansion:** NVIDIA XR AI / ACE-style agent systems can extend NPCs and companion tools into context-aware spatial interactions through AR/XR devices.

## Core Objects

### Shield
A defensive object. It can protect against sabotage, penalties, hostile mechanics, or selected competitive effects. Higher-rarity versions can provide event-specific or persistent protection.

### Helmet
An intelligence/perception object. It can reveal hidden lyrical clues, filter noise or misleading information, expose visual layers, or assist with puzzle interpretation.

### Anchor
A stability/navigation object. It can secure progress, preserve a checkpoint, freeze or stabilize a state, protect positioning, or support route/navigation mechanics.

### Timepiece
A time-control/strategy object. It can add time, pause or modify timers, permit replay/recovery mechanics, or become an AI strategist that advises when to move, wait, or change routes.

These objects can exist as normal game inventory, earned prizes, limited editions, access assets, or HAI-minted NFTs.

## Tournament Structure

The current source document defines:

- 12 monthly contests.
- Tiered buy-ins: $19.99 / $29.99 / $49.99.
- Tiered monthly prize distribution.
- Cash winners plus consolation giveaways/promotional media access.
- Leaderboard status connected to eligibility for a grand-prize game / Mixcast View.
- Special February and December contests with additional winners and sponsor potential.
- Yearly Homeland Retreat concepts.
- Legacy early-bird status at $99.99 with possible creative bonuses.
- Grand-prize eligibility by participation tier:
  - Level 1: enter 10 of 12 contests.
  - Level 2: enter 7 of 12 contests.
  - Level 3: enter 4 of 12 contests.
- Loyalty rewards or leaderboard position as possible tiebreakers.

See `docs/PRIZE_SYSTEM.md` for the normalized project interpretation.

## Repository Map

- `docs/GAME_BIBLE.md` — complete conversation-derived game structure.
- `docs/GAMEPLAY.md` — player loop, progression, maps, tools, puzzles, Easter eggs.
- `docs/NPC_AI_SYSTEM.md` — artist NPCs, CPCs, ACE/XR AI direction, companion concepts.
- `docs/NFT_ECONOMY.md` — first sales, functional NFTs, access, secondary sales, royalties.
- `docs/PRIZE_SYSTEM.md` — recurring tournament and Legacy structure.
- `docs/STREAMING.md` — Twitch and Maestro.tv content strategy.
- `docs/XR_AR.md` — AR/XR glasses and spatial AI roadmap.
- `docs/TECH_ARCHITECTURE.md` — recommended Supabase-centered backend architecture.
- `docs/ROADMAP.md` — phased prototype-to-platform development plan.
- `docs/CONTENT_QUALITY.md` — viewer-interest and platform-fit evaluation.
- `config/game.example.json` — structured game configuration example.
- `supabase/schema.sql` — starter relational schema for core systems.
- `supabase/README.md` — backend implementation notes.

## Backend Direction

HAI standard backend stack:

- Supabase Database
- Supabase Auth
- Supabase Edge Functions
- Supabase Realtime
- Supabase Storage

Supabase Storage can hold images, clips, NPC assets, playlist/lyric visuals, maps, gateway media cards, and event content.

## Status

Concept / architecture repository. This repository converts the Homeland Hunt design conversation into an implementation-ready product structure. Numerical NFT projections discussed during concept development are scenario models, not guarantees of demand, liquidity, resale value, or player income.
