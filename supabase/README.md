# Supabase Implementation Notes

This directory establishes the starter backend domain model for Homeland Hunt.

## Use Supabase For

- Auth: player identity and session management.
- Postgres: game, tournament, inventory and economy state.
- Realtime: leaderboard and broadcast-safe live updates.
- Edge Functions: authoritative actions and third-party integrations.
- Storage: maps, images, clips, NPC assets, audio, playlist visuals and gateway media cards.

## Required Before Production

1. Enable RLS on exposed tables.
2. Create player/admin/service-role policies.
3. Move clue-answer validation into server-only functions.
4. Add idempotency to purchases, rewards and minting calls.
5. Add immutable audit/event logs for prize-relevant actions.
6. Add jurisdiction/age eligibility controls.
7. Separate public broadcast state from private competitive state.
8. Add anti-cheat telemetry and rate limiting.
9. Version NPC prompts/models/tool policies per event.
10. Integrate payment/mint providers through adapters rather than hard-coding them into game logic.

## Suggested Edge Functions

- `enter-event`
- `validate-clue`
- `activate-item`
- `calculate-leaderboard`
- `calculate-season-qualification`
- `issue-reward`
- `mint-hai-asset`
- `agent-tool-gateway`
- `broadcast-state`

## Important

The current SQL is a product architecture seed, not a production migration. Canonical object effects and final tournament rules are intentionally left configurable because the conversation has not locked every mechanic.
