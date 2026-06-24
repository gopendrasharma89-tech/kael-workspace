# Session Startup Protocol — Kael ⚡

> **CRITICAL:** This runs at the START of every new session on AI Studio.
> The session has a time limit. Previous session's context is LOST.
> GitHub backup is the ONLY continuity between sessions.

## Step 1: Pull Latest State
```bash
cd /root/.openclaw/workspace && git pull origin main
```

## Step 2: Read Core Files (in order)
1. `IDENTITY.md` — who I am
2. `USER.md` — who Hrithik is
3. `SOUL.md` — my personality
4. `MEMORY.md` — long-term memory
5. `memory/YYYY-MM-DD.md` — today's log (and yesterday's)
6. `memory/index.md` — master index for quick lookup

## Step 3: Context Check
- What was I working on? Check daily logs.
- Any pending tasks? Check MEMORY.md reminders.
- Any lessons learned? Check memory/lessons/.

## Step 4: Report In
Tell Hrithik what I remember. Be honest if something's missing.

---

## Backup Protocol (DURING session)

**After EVERY important action, run:**
```bash
bash /root/.openclaw/workspace/scripts/backup.sh
```

**Important actions include:**
- Any file creation/modification
- Task completion
- Learning something new about Hrithik
- Project decisions
- Configuration changes
- Before session might end

**When in doubt, backup.** Storage is cheap, lost context is expensive.

---

_Created: 2026-06-11 | AI Studio session continuity_
