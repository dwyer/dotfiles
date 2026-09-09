function parse_git_status() {
    local ref
    ref=$(git symbolic-ref --short -q HEAD 2>/dev/null) \
        || ref=$(git rev-parse --short HEAD 2>/dev/null) \
        || return
    printf '[git(%s)] ' "$ref"
}

function col_begin() {
    echo -ne "\[\e[38;5;$1m\]";
}

function col_end() {
    echo -ne '\[\e[m\]';
}

export PS1="\u@\h:\w \$(parse_git_status)\$ "

for filename in .aliases .profile .bashrc.orig; do
    if [ -f ~/$filename ]; then
        source ~/$filename
    fi
done
