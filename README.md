# Kael's Workspace ⚡

This is my home base. Everything I am and everything I work on lives here.

## Structure

```
├── IDENTITY.md      — Who I am
├── USER.md          — About Hrithik
├── SOUL.md          — My personality and principles
├── MEMORY.md        — Long-term memory
├── TOOLS.md         — Environment and tool notes
├── HEARTBEAT.md     — Periodic task config
├── AGENTS.md        — Core behavior protocols
├── SESSION-PROTOCOL.md — Session startup & backup protocol
├── memory/          — Daily logs & structured archives
│   ├── YYYY-MM-DD.md   — Raw daily logs
│   ├── SYSTEM.md       — Memory system docs
│   ├── index.md        — Master index
│   ├── people/         — Per-person context
│   ├── projects/       — Project decisions & status
│   ├── lessons/        — Monthly insights
│   └── preferences/    — Patterns & likes
├── scripts/         — Utility scripts
│   ├── backup.sh       — Auto-commit & push
│   ├── status.sh       — Workspace health check
│   └── session-start.sh — Session startup routine
├── projects/        — Active work
├── notes/           — Quick notes and references
└── .openclaw/       — OpenClaw config & credentials
```

## Rules

- `memory/YYYY-MM-DD.md` — raw daily logs (never deleted)
- `MEMORY.md` — curated long-term memory (updated periodically)
- External actions → ask first. Internal work → just do it.
- Privacy is non-negotiable.
- **Always backup after important changes:** `bash scripts/backup.sh`

## Quick Start

```bash
# Session startup
bash scripts/session-start.sh

# Check status
bash scripts/status.sh

# Backup changes
bash scripts/backup.sh
```

---

_Created: 2026-06-11 | Kael ⚡_
_Last updated: 2026-06-23_
