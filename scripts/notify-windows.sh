#!/bin/bash
# Windows toast notification when Claude needs attention
# Requires BurntToast PowerShell module: Install-Module -Name BurntToast

INPUT=$(cat)
TYPE=$(echo "$INPUT" | jq -r '.type // "notification"')

case "$TYPE" in
  permission_prompt)
    MSG="Claude is requesting permission"
    ;;
  idle_prompt)
    MSG="Claude is waiting for your input"
    ;;
  *)
    MSG="Claude Code needs attention"
    ;;
esac

# Try BurntToast first, fall back to console beep
if powershell -Command "Get-Module -ListAvailable BurntToast" &>/dev/null 2>&1; then
  powershell -ExecutionPolicy RemoteSigned -Command "Import-Module BurntToast; New-BurntToastNotification -Text 'Claude Code', '$MSG' -Sound Default" &
else
  powershell -Command "[console]::beep(800,300)" &
fi

exit 0
