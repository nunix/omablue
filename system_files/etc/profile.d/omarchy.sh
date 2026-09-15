# /etc/profile.d/omarchy.sh - Omarchy Environment Configuration

export OMARCHY_PATH="/usr/share/omarchy"

# Add user bin and mise shims to PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"
fi

# Source Omarchy env bootstrap if available
if [ -r /usr/share/omarchy/default/bash/env-bootstrap ]; then
    . /usr/share/omarchy/default/bash/env-bootstrap
fi

# Shell integrations for interactive sessions
if [ -n "$PS1" ] || [[ $- == *i* ]]; then
    # Mise activate
    if command -v mise &> /dev/null; then
        eval "$(mise activate bash)"
    fi

    # Starship prompt
    if command -v starship &> /dev/null; then
        eval "$(starship init bash)"
    fi

    # Fastfetch welcome banner
    if command -v fastfetch &> /dev/null; then
        fastfetch
    fi
fi
