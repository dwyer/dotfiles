# colors
export CLICOLOR=1
export TERM=xterm-256color
#export LS_COLORS='di=38;5;108:fi=00:ln=38;5;116:ex=38;5;186'

# editor
export EDITOR=vim

# browser
export BROWSER=w3m

# pager
export PAGER=less
export LESSHISTFILE=/dev/null

# news
export NNTPSERVER=nntp.aioe.org

# mpd
export MPD_HOST=d.local
export MPD_PORT=6600

if [ -d "$HOME/.profile.d" ]; then
    for filename in "$HOME"/.profile.d/*.sh; do
        source "$filename"
    done
fi

# Local profile (if present) is loaded last so things can be overridden.
LOCALPROFILE=$HOME/.profile.local

if [ -e $LOCALPROFILE ]; then
    source $LOCALPROFILE
fi

if [ -e "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
