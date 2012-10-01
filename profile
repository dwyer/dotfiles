# colors
export TERM=xterm-256color
export LS_COLORS='di=38;5;108:fi=00:ln=38;5;116:ex=38;5;186'

# browser
export BROWSER=w3m

# editor
export EDITOR=vim

# pager
export PAGER=less
export LESSHISTFILE=/dev/null

export ANDROIDPATH=/usr/local/android-sdk-linux
export APPENGINEPATH=/usr/local/google_appengine
export GSUTILPATH=/usr/local/gsutil
export HOMEBIN=$HOME/bin

# Add ~/bin to path
if [ -e $HOMEBIN ]; then
    PATH=$HOMEBIN:$PATH
fi

# Add Android SDK to path.
if [ -e $ANDROIDPATH ]; then
    PATH=$ANDROIDPATH/platform-tools:$PATH
    PATH=$ANDROIDPATH/tools:$PATH
    alias sqlite3=/usr/bin/sqlite3
fi

# Add App Engine SDK to path
if [ -e $APPENGINEPATH ]; then
    PATH=$APPENGINEPATH:$PATH
fi

# Add gsutil to path
if [ -e $GSUTILPATH ]; then
    PATH=$GSUTILPATH:$PATH
fi

export PATH

# overrides
alias apt-get='aptitude'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias ls='ls --color=auto'
alias mkdir='mkdir -p'
alias mv='mv -i'

# if we're using BSD userland, change ls alias
ls >/dev/null 2>/dev/null
if [ $? != 0 ]; then
    alias ls='ls -G'
fi

# shortcuts
alias ac='apt-cache'
alias cx='chmod +x'
alias ipy='ipython -pylab -noconfirm_exit'
alias ka='killall'
alias l='ls'
alias la='ls -A'
alias lc='wc -l'
alias ll='ls -lh'
alias lla='ls -Alh'
alias md='mkdir'
alias p='mpc toggle'
alias pa='ps -A'
alias pag='ps -A | grep'
alias pp='echo hehehe'
alias py='python'
alias src='source'
alias sl='ls' # this typo happens a lot
alias t='tmux'
alias ta='tmux a'

# stfu
alias eog='stfu eog'
alias evince='stfu evince'
alias gimp='stfu gimp'
alias lyx='stfu lyx'
alias parole='stfu parole'
alias picard='stfu picard'
alias ristretto='stfu ristretto'
alias totem='stfu totem'
