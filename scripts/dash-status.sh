#!/bin/bash
# Writes per-event status file consumed by Claude Code Dash.
# Called by Claude Code hooks; reads JSON on stdin.

set -euo pipefail

exec python3 -c '
import json, os, random, sys, time
from datetime import datetime, timezone
from pathlib import Path

dash_dir = Path.home() / ".claude" / "dash" / "events"
dash_dir.mkdir(parents=True, exist_ok=True)

try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(0)

event = data.get("hook_event_name") or ""
sid = data.get("session_id") or ""
cwd = data.get("cwd") or ""

if not sid or not event:
    sys.exit(0)

if event in ("SessionStart", "UserPromptSubmit", "PreToolUse", "PostToolUse"):
    state = "working"
elif event in ("Notification", "Stop", "SubagentStop"):
    state = "ready"
elif event == "SessionEnd":
    state = "removed"
else:
    sys.exit(0)

ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
uniq = f"{int(time.time())}{random.randint(0, 32767)}{os.getpid()}"
out_path = dash_dir / f"{sid}-{uniq}.json"

payload = {"session_id": sid, "cwd": cwd, "state": state, "ts": ts}
spawn_id = os.environ.get("CLAUDE_DASH_SPAWN_ID", "")
if spawn_id:
    payload["dash_spawn_id"] = spawn_id

with open(out_path, "w", encoding="utf-8") as f:
    json.dump(payload, f)
'
