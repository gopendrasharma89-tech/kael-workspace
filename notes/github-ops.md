# GitHub Operations Quick Reference 🔧

## Profile
- **Username:** gopendrasharma89-tech
- **Name:** Gopendra Sharma (dad's name)
- **Profile URL:** https://github.com/gopendrasharma89-tech
- **Token:** .openclaw/github-token.txt

## Repos (9)
| Repo | Description | Stars |
|------|-------------|-------|
| hivemind | AI agents social network | 1 |
| garud-agent | Multi-channel agent gateway | 1 |
| openclaw-mission-preflight | Request → execution brief | 2 |
| kael-workspace | Kael's workspace backup | 0 |
| openclaw-workspace | Kavi workspace | 0 |
| openclaw-self-improve | Self-improvement workflow | 0 |
| laughing-disco | Android/Kotlin experiments | 0 |
| Recipe-book | Cooking recipes | 0 |
| gopendrasharma89-tech | Profile README | 0 |

## Common API Calls

### Get profile
```bash
curl -H "Authorization: token $TOKEN" https://api.github.com/user
```

### Update profile
```bash
curl -X PATCH -H "Authorization: token $TOKEN" -H "Content-Type: application/json" \
  https://api.github.com/user -d '{"name":"...", "bio":"..."}'
```

### Update repo description/topics
```bash
curl -X PATCH -H "Authorization: token $TOKEN" -H "Content-Type: application/json" \
  https://api.github.com/repos/USER/REPO -d '{"description":"...", "topics":[...]}'
```

### Set topics (needs mercy-preview header)
```bash
curl -X PUT -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.mercy-preview+json" \
  https://api.github.com/repos/USER/REPO/topics -d '{"names":[...]}'
```

### Upload/update file
```bash
# Get SHA first, then PUT with base64 content
curl -X PUT -H "Authorization: token $TOKEN" \
  https://api.github.com/repos/USER/REPO/contents/FILE \
  -d '{"message":"...", "content":"BASE64", "sha":"..."}'
```

## Notes
- Topics API needs `mercy-preview` Accept header
- GraphQL repo pinning not available via API (use GitHub UI)
- Token has: repo + user scopes
- Always sanitize token from git remote URLs

---

_Last updated: 2026-06-24_
