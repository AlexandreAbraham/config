if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

#showing git branches in bash prompt
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
   
function proml {
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local      YELLOW="\[\033[0;33m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    local LIGHT_PURPLE="\[\033[1;34m\]"
    case $TERM in
        xterm*)
            TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
        *)
        TITLEBAR=""
        ;;
    esac
		     
    PS1="${TITLEBAR}\
    $LIGHT_PURPLE\w$YELLOW\$(parse_git_branch)\
    \n$LIGHT_GRAY\$ "
    PS2='> '
    PS4='+ '
}
proml

# VIRTUAL_ENV_DISABLE_PROMPT=1 source ~/canopy/appdata/canopy-1.1.0.1371.rh5-x86_64/lib/python2.7/venv/scripts/posix/activate
