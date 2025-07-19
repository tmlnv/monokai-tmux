#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @monokai-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @monokai-tmux_transparent)"

case $SELECTED_THEME in
"spectrum")
  declare -A THEME=(
    ["background"]="#222222"
    ["foreground"]="#F8F8F2"
    ["black"]="#363537"
    ["blue"]="#FC9867"
    ["cyan"]="#78DCE8"
    ["green"]="#A9DC76"
    ["magenta"]="#AB9DF2"
    ["red"]="#FF6188"
    ["white"]="#F8F8F2"
    ["yellow"]="#FFD866"

    ["bblack"]="#727072"
    ["bblue"]="#FC9867"
    ["bcyan"]="#78DCE8"
    ["bgreen"]="#A9DC76"
    ["bmagenta"]="#AB9DF2"
    ["bred"]="#FF6188"
    ["bwhite"]="#FCFCFA"
    ["byellow"]="#FFD866"
  )
  ;;

"pro")
  declare -A THEME=(
    ["background"]="#2D2A2E"
    ["foreground"]="#FCFCFA"
    ["black"]="#403E41"
    ["blue"]="#78DCE8"
    ["cyan"]="#78DCE8"
    ["green"]="#A9DC76"
    ["magenta"]="#AB9DF2"
    ["red"]="#FF6188"
    ["white"]="#FCFCFA"
    ["yellow"]="#FFD866"

    ["bblack"]="#727072"
    ["bblue"]="#78DCE8"
    ["bcyan"]="#78DCE8"
    ["bgreen"]="#A9DC76"
    ["bmagenta"]="#AB9DF2"
    ["bred"]="#FF6188"
    ["bwhite"]="#FCFCFA"
    ["byellow"]="#FFD866"
  )
  ;;

*)
  # Default to classic Monokai theme
  declare -A THEME=(
    ["background"]="#272822"
    ["foreground"]="#F8F8F2"
    ["black"]="#49483E"
    ["blue"]="#66D9EF"
    ["cyan"]="#66D9EF"
    ["green"]="#A6E22E"
    ["magenta"]="#AE81FF"
    ["red"]="#F92672"
    ["white"]="#F8F8F2"
    ["yellow"]="#E6DB74"

    ["bblack"]="#75715E"
    ["bblue"]="#66D9EF"
    ["bcyan"]="#66D9EF"
    ["bgreen"]="#A6E22E"
    ["bmagenta"]="#AE81FF"
    ["bred"]="#F92672"
    ["bwhite"]="#F8F8F2"
    ["byellow"]="#E6DB74"
  )
  ;;
esac

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

THEME['ghgreen']="#A6E22E"
THEME['ghmagenta']="#AE81FF"
THEME['ghred']="#F92672"
THEME['ghyellow']="#E6DB74"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
