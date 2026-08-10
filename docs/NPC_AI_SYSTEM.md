# NPC, CPC & AI Companion System

## Strategic Role

AI characters are intended to be one of Homeland Hunt's primary differentiators. They should participate in the hunt rather than merely dispense scripted quests.

## Character Classes

- **Artist Mentor** — contextual guidance and artist-themed quests.
- **Clue Giver** — provides clues with variable directness.
- **Quest Master** — creates or administers multi-stage objectives.
- **Rival** — competes, challenges or pressures the player.
- **Merchant** — trades maps/tools/assets.
- **Saboteur / Unreliable Character** — may misdirect within clearly defined game rules.
- **Lore Keeper** — unlocks world history and Easter eggs.
- **Regional Guide** — understands a specific zone.
- **Event Host** — drives live tournament presentation.
- **Companion** — persistent player-side agent.

## From NPC to Co-Playable Character

The NVIDIA ACE / CPC direction is relevant because Homeland Hunt benefits from characters that can:

- perceive game/world context;
- remember prior interactions;
- reason over quest state;
- use tools;
- coordinate with other agents;
- respond conversationally;
- participate in gameplay.

The important product principle is bounded agency: the character may improvise within approved game rules but cannot reveal protected answers, alter prize outcomes, or invent authoritative state.

## Real Artist Integration

Real artists can become licensed game characters with:

- approved voice/likeness;
- custom dialogue boundaries;
- song/album-themed quests;
- exclusive clues;
- event appearances;
- original music drops;
- branded collectibles.

All persona, voice, likeness and music rights should be explicit.

## AI Companion Objects

### Shield / Guardian

Threat awareness, defensive recommendations and protection-state explanation.

### Helmet / Analyst

Clue comparison, lyric/audio pattern analysis and evidence highlighting.

### Anchor / Pathfinder

Route memory, checkpoint history, map knowledge and navigation assistance.

### Timepiece / Strategist

Timer awareness, route-risk analysis, event-window reasoning and strategic timing recommendations.

## Agent Safety / Fairness

For prize events:

- all players in a given competitive tier should have access to functionally equivalent AI capability;
- agent responses must not expose hidden server answers;
- the server remains authoritative;
- prize-relevant actions must be logged;
- prompts/models should be versioned per tournament;
- random or adaptive NPC behavior must operate inside published fairness constraints.

## Suggested Architecture

Player Client → Agent Gateway → Character Policy → Retrieval/Memory → Tool Calls → Authoritative Game Services → Response

Memory should distinguish:

- player profile memory;
- quest/session memory;
- character lore memory;
- global game state;
- protected answer state.

Protected answer state should never be directly available to generative dialogue models.
