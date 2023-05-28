# ~/.bash_profile
#if [ -f ~/.bashrc ]; then . ~/.bashrc; fi


[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ "$(tty)" = "/dev/tty1" ] ; then
    # Your environment variables
    export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export IBSEAT_BACKEND=logind
    export XKB_DEFAULT_OPTIONS=caps:escape
    export EDITOR=nvim
    exec Hyprland
    #exec dbus-run-session sway

else

    if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty2 ]]; then
    . startx
    logout
    fi
fi
