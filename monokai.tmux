#!/usr/bin/env bash
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Monokai                                                  +
# version    1.0.0                                                    +
# repository https://github.com/tmlnv/monokai-tmux                    +
# author     tmlnv                                                    +
# email      -                                                        +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_PATH="$CURRENT_DIR/src"

source $SCRIPTS_PATH/themes.sh

tmux set -g status-left-length 80
tmux set -g status-right-length 150

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
# Highlight colors
tmux set -g mode-style "fg=${THEME[bgreen]},bg=${THEME[bblack]}"

tmux set -g message-style "bg=${THEME[blue]},fg=${THEME[background]}"
tmux set -g message-command-style "fg=${THEME[white]},bg=${THEME[black]}"

tmux set -g pane-border-style "fg=${THEME[bblack]}"
tmux set -g pane-active-border-style "fg=${THEME[blue]}"
tmux set -g pane-border-status off

tmux set -g status-style bg="${THEME[background]}"

TMUX_VARS="$(tmux show -g)"

default_window_id_style="digital"
default_pane_id_style="hsquare"
default_zoom_id_style="dsquare"

default_terminal_icon=""
default_active_terminal_icon=""

window_id_style="$(echo "$TMUX_VARS" | grep '@monokai-tmux_window_id_style' | cut -d" " -f2)"
pane_id_style="$(echo "$TMUX_VARS" | grep '@monokai-tmux_pane_id_style' | cut -d" " -f2)"
zoom_id_style="$(echo "$TMUX_VARS" | grep '@monokai-tmux_zoom_id_style' | cut -d" " -f2)"
terminal_icon="$(echo "$TMUX_VARS" | grep '@monokai-tmux_terminal_icon' | cut -d" " -f2)"
active_terminal_icon="$(echo "$TMUX_VARS" | grep '@monokai-tmux_active_terminal_icon' | cut -d" " -f2)"
window_tidy="$(echo "$TMUX_VARS" | grep '@monokai-tmux_window_tidy_icons' | cut -d" " -f2)"

window_id_style="${window_id_style:-$default_window_id_style}"
pane_id_style="${pane_id_style:-$default_pane_id_style}"
zoom_id_style="${zoom_id_style:-$default_zoom_id_style}"
terminal_icon="${terminal_icon:-$default_terminal_icon}"
active_terminal_icon="${active_terminal_icon:-$default_active_terminal_icon}"
window_space="${window_tidy:-0}"

window_space=$([[ $window_tidy == "0" ]] && echo " " || echo "")

netspeed="#($SCRIPTS_PATH/netspeed.sh)"
cmus_status="#($SCRIPTS_PATH/music-tmux-statusbar.sh)"
git_status="#($SCRIPTS_PATH/git-status.sh #{pane_current_path})"
wb_git_status="#($SCRIPTS_PATH/wb-git-status.sh #{pane_current_path} &)"
window_number="#($SCRIPTS_PATH/custom-number.sh #I $window_id_style)"
custom_pane="#($SCRIPTS_PATH/custom-number.sh #P $pane_id_style)"
zoom_number="#($SCRIPTS_PATH/custom-number.sh #P $zoom_id_style)"
date_and_time="$($SCRIPTS_PATH/datetime-widget.sh)"
current_path="#($SCRIPTS_PATH/path-widget.sh #{pane_current_path})"
battery_status="#($SCRIPTS_PATH/battery-widget.sh)"
hostname="#($SCRIPTS_PATH/hostname-widget.sh)"

#+--- Bars LEFT ---+
# Session name
tmux set -g status-left "#[fg=${THEME[bblack]},bg=${THEME[blue]},bold] #{?client_prefix,󰠠 ,#[dim]󰤂 }#[bold,nodim]#S$hostname "

#+--- Windows ---+
# Focus
tmux set -g window-status-current-format "$RESET#[fg=${THEME[green]},bg=${THEME[bblack]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,$active_terminal_icon $window_space}#[fg=${THEME[foreground]},bold,nodim]$window_number#W#[nobold]#{?window_zoomed_flag, $zoom_number, $custom_pane}#{?window_last_flag, , }"
# Unfocused
tmux set -g window-status-format "$RESET#[fg=${THEME[foreground]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,$terminal_icon $window_space}${RESET}$window_number#W#[nobold,dim]#{?window_zoomed_flag, $zoom_number, $custom_pane}#[fg=${THEME[yellow]}]#{?window_last_flag,󰁯  , }"

#+--- Bars RIGHT ---+
tmux set -g status-right "$battery_status$current_path$cmus_status$netspeed$git_status$wb_git_status$date_and_time"
tmux set -g window-status-separator ""
