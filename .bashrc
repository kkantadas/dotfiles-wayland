# .bashrc

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export XDG_RUNTIME_DIR=/run/user/$UID

case $- in
    *i*) ;;
      *) return;;
esac

[[ $- != *i* ]] && return

if [ -n "$SSH_CONNECTION" ]; then
    export PS1="\u@\h: \w \$ "
else
    export PS1="\w \$ "
fi

source /usr/share/fzf/completion.bash && source /usr/share/fzf/key-bindings.bash
#PS1=' [\u@\h \W]\$ '
#PS1='(Goura \W)\$ '
#PS1='(\W)\$ '

#for (( i=1; i<=$LINES; i++ )); do echo; done; clear;

# Simple prompt
#if [ -n "$SSH_CONNECTION" ]; then
#        export PS1="\u@\h: \w \$ "
#else
#        export PS1="\w \$ "
#fi
#
export PS2="> "
export PATH=~/bin:$PATH
export TERM=xterm-256color
export LESSOPEN='|/usr/bin/lesspipe.sh %s'
export LESS='-R'
export EDITOR=nvim


#export PAGER=/usr/bin/vimpager
#alias less=$PAGER
#
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern
#  used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
echo -e -n "\x1b[\x33 q" # changes to blinking underline

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

##[ -n "$XTERM_VERSION" ] && transset-df .70 -a >/dev/null

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

    #https://github.com/garabik/grc
    #Color in the terminal -- cp -r  /etc/profile.d/grc.sh /etc/ 
    GRC_ALIASES=true
    [[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh
    alias dir='dir --color=auto'
    alias feh='feh --image-bg black --scale-down'
    alias urxvt2='urxvt & sleep .3s && transset-df -a 0.93'
    alias ls='ls --color=auto --group-directories-first'
    alias Mount='sudo mount -o gid=users,fmask=113,dmask=002'
    alias MountMac='sudo mount -t hfsplus -o force,rw'
    alias umount='sudo umount'
    alias grep='grep --color=auto'
    alias Vedagrep='cd ~/Vedatxt/ && grep -nr'
    #alias Vedagrep='cd ~/Vedatxt/ && grep --color=auto -nr'
    alias sudo='sudo '
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias reboot='sudo reboot'
    alias poweroff='sudo poweroff'
    alias du-fs='du -h --max-depth=0 $1' #fs=foldersize -requires ONE input
    alias mp='mplayer -vf crop=1010:99'
    alias CachRem='rm -rfv ~/{.cache/{/chromium/Default/,common-lisp/,gstreamer-1.0/,vimb/WebKitCache},.cache/yay/,.local/share/webkitgtk,.pki/}'
    alias shred='shred -fuv'
    alias weather='curl wttr.in/Krishnanagar'
    alias ..git='/usr/bin/git --git-dir=$HOME/.gitBareDot/ --work-tree=$HOME' 
    alias dh='df -h'
    alias pt='pstree -p'
    alias du-ds='du -sh */'
    alias tmux-attach="tmux attach"
    alias phone="jmtpfs --help ; echo '.....jmtpfs ~/Folder....'"
    alias vi="nvim"
    alias vim="nvim"
    alias Emacs="emacsclient -cn -a="" $*"
    alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
    alias PacRemove="sudo pacman -Sc"
    alias fbreader="FBReader"
    alias Snap-make="snapper -c root create -c timeline --description "
    alias Snap-list="snapper -c root list"
    alias Snap-remove="snapper remove"
    alias cp="cp -r"
    alias dmenu="dmenu-wl"
    alias dmenu_run="dmenu-wl_run"
    #remove all other packages from cache

# some more ls aliases
    alias ll='ls -lh'
    alias lla='ls -lah'
    alias la='ls -A'
    alias l='ls -CF'
# some more ls aliases
    #alias l='exa -G --no-icons  --group-directories-first'
    #alias la='exa -G -a --icons --group-directories-first'
    #alias ls='exa --icons --group-directories-first'
    #alias ll='exa -l -g --icons --group-directories-first'
    #alias lla='exa -l -a -g --icons --group-directories-first'
    #alias tree='exa --tree --icons'  
    #alias snapgui='snapper-gui'

# Alias definitions.

#alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell/alias

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


docview () {
    if [[ -f $1 ]] ; then
        case $1 in
            *.pdf)       mupdf     "$1" ;;
            *.ps)        oowriter "$1" ;;
            *.odt)       oowriter "$1" ;;
            *.txt)       urxvt -e vim  "$1" ;;
            *.doc)       urxvt -e catdoc "$1" | less ;;
            *)           printf "don't know how to extract '%s'..." "$1" >&2; return 1 ;;
        esac
    else
        printf "'%s' is not a valid file!\n" "$1" >&2
        return 1;
    fi
}

note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

list () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.list ]]; then
        touch "$HOME/.list"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.list"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        > "$HOME/.list"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.list"
    fi

}

# Enter directory and list contents
wda () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.wda ]]; then
        touch "$HOME/.wda"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.wda"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        > "$HOME/.wda"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.wda"
    fi

}


# Back up a file. Usage "backupthis <filename>"
backupthis() {
        cp -riv $1 ${1}-$(date +%Y%m%d%H%M).backup;
}



man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

supertouch() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

Find() { /usr/bin/find / -name "*$1*" 2>/dev/null; }

#https://linuxopsys.com/topics/colors-for-ls-mean-change-colors-for-ls-in-bash
LS_COLORS=$LS_COLORS:"*.pdf=0;33":"*.txt=01;37":"*.mobi=0;35"
# 30	Black   || 00	Default color
# 31	Red     || 01	Bold font
# 32	Green   || 04	Underlined
# 33	Orange  || 05	Flashing text
# 34	Blue    || 07	Reversev
# 35	Purple  || 08	Concealed
# 36	Cyan    || 
# 37	Grey    || 


export BEMENU_OPTS="-l 10\
  --fn 15\
  -i\
  -B 1\
  -R 8\
  -c\
  --bdr '#BBCCDD'\
  -W .3\
  --counter always\
  --fixed-height" 
