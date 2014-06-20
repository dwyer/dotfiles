# colors
export TERM=xterm-256color
#export LS_COLORS='di=38;5;108:fi=00:ln=38;5;116:ex=38;5;186'

# editor
export EDITOR=vi

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

# dev tools
export ANDROIDPATH=/usr/local/android-sdk
export APPENGINEPATH=/usr/local/google_appengine
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

export PATH

# overrides
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias mkdir='mkdir -p'
alias mv='mv -i'

# if we're using BSD userland, change ls alias
ls >/dev/null 2>/dev/null
if [ $? != 0 ]; then
    alias ls='ls -G'
fi

# shortcuts
# alias appcfg.py='appcfg.py --oath2'
alias cx='chmod +x'
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gc='git commit'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep'
alias gi='git init'
alias gl='git log'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gls='git ls-files'
alias gm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gr='git reset'
alias grh='git reset --hard'
alias gs='git status'
alias gss='git status -s'
alias gt='git log --oneline --graph --all'
alias ip='curl ifconfig.me'
alias ipy='ipython --pylab --no-confirm-exit'
alias ka='killall'
alias l='ls'
alias la='ls -A'
alias lc='wc -l'
alias ll='ls -lh'
alias lla='ls -Alh'
alias li='rl li'
alias md='mkdir'
alias p='mpc toggle'
alias pa='ps -A'
alias pag='ps -A | grep'
alias pp='echo hehehe'
alias py='python'
alias rl='rlwrap'
alias src='source'
alias sl='ls' # this typo happens a lot
alias t='tmux'
#alias ta='tmux a'
alias tls='tmux ls'
alias tx='tar xzf'
alias vim='echo Did you mean vi\?'

ta() {
    if [ $# -gt 0 ]; then
        tmux attach -t $@
    else
        tmux attach
    fi
}

# platform specific
UNAME=`uname`
if [ $UNAME = 'Darwin' ]; then
    export PAGER='col -b | vim -MR -'
    # export GITPAGER='col -b | vim -MR -c "setf diff" -'
    export MANPAGER='col -b | vim -MR -c "setf man" -'
    alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
    alias md5sum='md5 -r'
elif [ $UNAME = 'Linux' ]; then
    alias ac='apt-cache'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    # stfu: force certain processes to run silently in the background
    stfu() {
        exec "$@" 1>/dev/null 2>/dev/null &
    }
    alias eog='stfu eog'
    alias evince='stfu evince'
    alias gimp='stfu gimp'
    alias lyx='stfu lyx'
    alias nautilus='stfu nautilus'
    alias parole='stfu parole'
    alias picard='stfu picard'
    alias ristretto='stfu ristretto'
    alias totem='stfu totem'
fi

# Local profile (if present) is loaded last so things can be overridden.
LOCALPROFILE=$HOME/.profile.local

if [ -e $LOCALPROFILE ]; then
    source $LOCALPROFILE
fi

rate() {
    if [ $# -eq 2 ]; then
        i=$1
        j=$2
        while [ $i -gt 0 ]; do
            echo -n "\xe2\x98\x85"
            i=$(expr $i - 1)
            j=$(expr $j - 1)
        done
        while [ $j -gt 0 ]; do
            echo -n "\xe2\x98\x86"
            j=$(expr $j - 1)
        done
        echo
    else
        echo usage: rate N P
    fi
}
