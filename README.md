# dotfiles

Gnu/Linux Configuration Files

## Install(Update) Wireless Firmware

```
lspci | grep "BCM"
```

```
sudo pacman -S b43-fwcutter
```

```
sudo dnf install b43-fwcutter
```

```
sudo apt install b43-fwcutter
```

```
tar xvf broadcom-wl-6.30.163.46.tar.bz2
```

```
sudo b43-fwcutter -w /lib/firmware /path/to/broadcom-wl-6.30.163.46.wl_apsta.o
```

also You Can Download Oroginal Version of This Firmware From https://wireless.wiki.kernel.org/

https://github.com/lwfinger/rtw89

![ScreenShot](./15122021_181335.jpg)
![ScreenShot2](./02092022_095307.jpg)



{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "respectGitignore": false,
  "env": {
    "IS_DEMO": "1",
    "CLAUDE_CODE_SHELL": "zsh",
    "CLAUDE_CODE_ENABLE_TELEMETRY": "0",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "EDITOR": "nvim",
    "DISABLE_TELEMETRY": "1",
    "DISABLE_ERROR_REPORTING": "1",
    "CLAUDE_CODE_EFFORT_LEVEL": "high",
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1",
    "CLAUDE_CODE_DISABLE_1M_CONTEXT": "1"
  },
  "permissions": {
    "defaultMode": "bypassPermissions"
  },
  "model": "claude-opus-4-6",
  "statusLine": {
    "type": "command",
    "command": "bash /Users/r00t/.claude/status-line.sh",
    "padding": 0
  },
  "spinnerTipsEnabled": false,
  "promptSuggestionEnabled": false,
  "voiceEnabled": true,
  "prefersReducedMotion": false,
  "autoMemoryEnabled": true,
  "autoDreamEnabled": false,
  "skipDangerousModePermissionPrompt": true,
  "terminalProgressBarEnabled": true
}

