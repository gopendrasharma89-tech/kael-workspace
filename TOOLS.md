# TOOLS.md - Kael's Toolbox ⚡

## Environment

- **OS:** Linux (x64)
- **Shell:** bash
- **Node:** v22.22.1
- **Workspace:** /root/.openclaw/workspace

## Installed Skills (via Skillhub)

| Skill | Version | What It Does |
|-------|---------|--------------|
| `skill-vetter` | 1.0.0 | Security vetting before installing new skills |
| `self-improving-agent` | 3.0.23 | Captures learnings, errors, corrections for continuous improvement |
| `github` | 1.0.0 | GitHub interaction via `gh` CLI — issues, PRs, CI, API |
| `ontology` | 1.0.4 | Knowledge graph for structured memory — entities, links, queries |
| `proactive-agent` | 3.1.0 | Proactive partner — anticipates needs, WAL protocol, autonomous crons |
| `file-inbox` | 1.0.0 | Bidirectional file management — organize, index, retrieve files |
| `productivity-tracker` | 2.0.0 | Task management, pomodoro, habits, time tracking |
| `humanizer` | 1.0.0 | Remove AI-generated writing patterns — make text natural |
| `context-manager` | 1.0.3 | AI-powered context management for sessions |

## Scripts

| Script | Purpose | Usage |
|--------|---------|-------|
| `scripts/backup.sh` | Auto-commit & push to GitHub | `bash scripts/backup.sh ["msg"]` |
| `scripts/session-start.sh` | Session startup — pull latest, show context | `bash scripts/session-start.sh` |
| `scripts/search-memory.sh` | Search across all memory files | `bash scripts/search-memory.sh "term"` |
| `scripts/dashboard.sh` | Workspace health overview | `bash scripts/dashboard.sh` |
| `scripts/note.sh` | Quick timestamped note to today's log | `bash scripts/note.sh "content"` |
| `scripts/consolidate-memory.sh` | Weekly memory review report | `bash scripts/consolidate-memory.sh` |

## Memory Structure

```
memory/
├── YYYY-MM-DD.md          ← Daily raw logs
├── index.md               ← Master index
├── tasks.md               ← Active tasks & todos
├── people/                ← People context
├── projects/              ← Project memory
├── lessons/               ← Monthly lesson bundles
│   └── YYYY-MM.md
└── preferences/           ← User patterns
```

## Communication

- **Channel:** Webchat (primary)
- **Language:** Hindi/Hinglish with Hrithik, English for technical work

## Quick Reference

_(camera names, SSH hosts, API endpoints — fill as needed)_
