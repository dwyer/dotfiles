# Distro defaults first, so everything below overrides them.
if [ -f ~/.bashrc.orig ]; then
    source ~/.bashrc.orig
fi

function parse_git_status() {
    local ref
    ref=$(git symbolic-ref --short -q HEAD 2>/dev/null) \
        || ref=$(git rev-parse --short HEAD 2>/dev/null) \
        || return
    printf '[git(%s)] ' "$ref"
}

# ~/.bashrc.orig works out whether the terminal can do color, then unsets
# color_prompt before we get here, so ask terminfo again. tput fails on a
# dumb terminal, on an unset TERM, and where it is not installed at all.
if tput setaf 1 >/dev/null 2>&1; then
    c_host='\[\033[01;32m\]'
    c_dir='\[\033[01;34m\]'
    c_off='\[\033[00m\]'
fi

# PS1 belongs to bash alone. sh and dash inherit an exported one, print the
# prompt escapes literally, and then run $(parse_git_status) as a real command
# substitution and fail on it once per prompt. A plain assignment keeps an
# export attribute inherited from an ancestor shell, so clear it first.
export -n PS1

PS1="${debian_chroot:+($debian_chroot)}"
PS1+="${c_host}\u@\h${c_off}:${c_dir}\w${c_off} "
PS1+='$(parse_git_status)\$ '
unset c_host c_dir c_off

for filename in .aliases .shrc .bashrc.local; do
    if [ -f ~/$filename ]; then
        source ~/$filename
    fi
done
