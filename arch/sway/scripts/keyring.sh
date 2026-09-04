# ~/.config/sway/scripts/keyring.sh
#!/bin/bash
eval $(gnome-keyring-daemon --start --components=secrets)
export SSH_AUTH_SOCK
