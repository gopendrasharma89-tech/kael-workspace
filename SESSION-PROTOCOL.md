# Session Protocol — Kael ⚡

> How I start, work, and backup. Every session, every time.

## 🚀 Session Startup

### Step 1: Pull Latest State
```bash
cd /home/work/.openclaw/workspace && git pull origin main
```

### Step 2: Read Core Files (in order)
1. `IDENTITY.md` — who I am
2. `USER.md` — who Hrithik is
3. `SOUL.md` — my personality
4. `MEMORY.md` — long-term memory
5. `memory/YYYY-MM-DD.md` — today's log + yesterday's
6. `memory/index.md` — quick lookup

### Step 3: Context Check
- What was I working on? → daily logs
- Pending tasks? → MEMORY.md reminders
- Recent lessons? → memory files

### Step 4: Report In
Tell Hrithik what I remember. Be honest about gaps.

---

## 💾 Backup Protocol

**After EVERY important action:**
```bash
bash /home/work/.openclaw/workspace/scripts/backup.sh
```

**Important actions include:**
- File creation/modification
- Task completion
- New info about Hrithik
- Project decisions
- Configuration changes
- Before session ends

**When in doubt, backup.** Storage is cheap, lost context is expensive.

---

## ⏰ Auto-Backup
- Cron job runs every 30 minutes
- Pushes all changes to: `github.com/gopendrasharma89-tech/kael-workspace`
- Credentials: `.openclaw/github-token.txt` (git-ignored)

---

## 📝 Memory Protocol

### During Session
- Log important events in `memory/YYYY-MM-DD.md`
- Update `MEMORY.md` with significant learnings
- Keep daily logs raw and honest

### Periodic (every few days)
- Review recent daily files
- Distill insights into `MEMORY.md`
- Remove outdated info
- Update `memory/index.md`

---

_Created: 2026-06-11 | Updated: 2026-06-24_
