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

PS1="\u@\h:\w \$(parse_git_status)\$ "

for filename in .aliases .profile .bashrc.local; do
    if [ -f ~/$filename ]; then
        source ~/$filename
    fi
done
