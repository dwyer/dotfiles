source ~/.profile

function parse_git_status() {
    git branch 2>/dev/null | sed 's/\* \(.*\)/[git(\1)] /'
}

function col_begin() {
    echo -ne "\[\e[38;5;$1m\]";
}

function col_end() {
    echo -ne '\[\e[m\]';
}

export PS1="\u@\h:\w \$(parse_git_status)\$ "
