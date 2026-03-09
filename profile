# colors
export CLICOLOR=1
export TERM=xterm-256color
#export LS_COLORS='di=38;5;108:fi=00:ln=38;5;116:ex=38;5;186'

# editor
export EDITOR=vim

# pager
export PAGER=less
export LESSHISTFILE=/dev/null

if [ -d "$HOME/.profile.d" ]; then
    for filename in "$HOME"/.profile.d/*.sh; do
        source "$filename"
    done
    unset filename
fi

if [ -f "$HOME/.profile.local" ]; then
    source "$HOME/.profile.local"
fi

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
