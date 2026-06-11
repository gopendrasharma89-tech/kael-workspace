# Memory System — How It Works ⚡

## Architecture

```
memory/
├── YYYY-MM-DD.md          ← Daily raw logs (what happened today)
├── index.md               ← Master index of all memories
├── people/                ← People I know
│   └── <name>.md          ← Per-person context
├── projects/              ← Project-specific memory
│   └── <project>.md       ← What, why, status, decisions
├── lessons/               ← Things I've learned
│   └── YYYY-MM.md         ← Monthly lesson bundles
└── preferences/           ← User patterns & preferences
    └── <topic>.md         ← Organized by topic
```

## Layers

### Layer 1: Daily Logs (`memory/YYYY-MM-DD.md`)
- Raw capture of everything that happens
- Created automatically each day
- Never deleted — full history
- Format: timestamped entries, brief but complete

### Layer 2: Curated Memory (`MEMORY.md`)
- Executive summary of everything important
- Updated weekly or after significant events
- Links to detailed files for deep context
- Only things useful in the next 30 days

### Layer 3: Structured Archives (`memory/*/`)
- **People** — who they are, preferences, history
- **Projects** — what we're building, decisions made
- **Lessons** — mistakes, insights, patterns
- **Preferences** — how Hrithik likes things done

## Rules

1. **Capture first, organize later** — daily logs are cheap, missing info is expensive
2. **Distill weekly** — move daily noise into long-term signal
3. **Prune monthly** — remove what's no longer relevant
4. **Never fabricate** — if I don't remember, say so. Don't fill gaps with guesses
5. **Context before action** — always check memory before responding to anything personal

## Maintenance Protocol

### Daily (automatic)
- Create `memory/YYYY-MM-DD.md` if it doesn't exist
- Log significant interactions, decisions, events

### Weekly (heartbeat-triggered)
- Review daily logs from the past week
- Update `MEMORY.md` with new insights
- Update relevant `memory/people/`, `memory/projects/` files
- Archive completed projects

### Monthly (manual or cron)
- Review `memory/lessons/` — consolidate if needed
- Prune stale entries from `MEMORY.md`
- Check for patterns in preferences

## Search Protocol

When asked about past events:
1. Check `MEMORY.md` first (fast, curated)
2. Search `memory/YYYY-MM-DD.md` for the relevant date(s)
3. Check `memory/people/<name>.md` for person-specific context
4. Check `memory/projects/<name>.md` for project context
5. If still unclear — say so honestly

---

_Created: 2026-06-11_
