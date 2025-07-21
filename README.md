# Monokai Tmux

A Tmux theme based on the Monokai color scheme.
Features three variants: Classic, Pro, and Spectrum.

Forked from [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux)
and adapted to use Monokai color palettes.

## Requirements

- [Patched Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) (v3 or higher)
- Bash 4.2 or newer

## Recommended Dependencies

- Noto Sans Symbols 2
- bc
- jq
- gh/glab
- playerctl (Linux) or nowplaying-cli (macOS)

## Installation

### Using TPM (Tmux Plugin Manager)

Add the plugin to your `.tmux.conf`:

```tmux
set -g @plugin "tmlnv/monokai-tmux"
```

Then press `prefix + I` to fetch the plugin.

## Configuration

### Theme Variants

```tmux
set -g @monokai-tmux_theme 'classic'    # Options: classic, pro, spectrum
set -g @monokai-tmux_transparent 1    # Enable transparent background
```

### Number Styles

```tmux
set -g @monokai-tmux_window_id_style digital
set -g @monokai-tmux_pane_id_style hsquare
set -g @monokai-tmux_zoom_id_style dsquare
```

### Widgets

```tmux
set -g @monokai-tmux_show_datetime 1
set -g @monokai-tmux_show_music 1
set -g @monokai-tmux_show_netspeed 1
set -g @monokai-tmux_show_path 1
set -g @monokai-tmux_show_battery_widget 1
set -g @monokai-tmux_show_hostname 1
```

## Features

- Local and web-based git stats
- Remote branch sync indicator
- Terminal icons
- Prefix highlight
- Now Playing status bar
