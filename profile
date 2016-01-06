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

# overrides
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias mv='mv -i'
alias tx='tar xzf'

# shortcuts
# alias appcfg.py='appcfg.py --oath2'
alias cx='chmod +x'
alias k9='kill -9'
alias ka='killall'
alias l='ls'
alias la='ls -A'
alias lc='wc -l'
alias ll='ls -lh'
alias lla='ls -Alh'
alias md='mkdir'
alias pa='ps -A'
alias pag='ps -A | grep'
alias pp='echo hehehe'
alias py='python'
alias src='source'
alias sl='ls' # this typo happens a lot

which git &>/dev/null
if [ $? = 0 ]; then
    alias g='git'
    alias ga='git add'
    alias gap='git add -p'
    alias gb='git branch'
    alias gba='git branch -a'
    alias gbd='git branch -D'
    alias gc='git commit -s'
    alias gcl='git clone'
    alias gcm='git commit -s -m'
    alias gco='git checkout'
    alias gd='git diff'
    alias gdc='git diff --cached'
    alias gg='git grep'
    alias gi='git init'
    alias gl='git log'
    alias glo='git log --oneline'
    alias glog='git log --oneline --graph'
    alias gls='git ls-files'
    alias gm='git commit -s -m'
    alias gp='git push'
    alias gpl='git pull'
    alias gr='git reset'
    alias grh='git reset --hard'
    alias gs='git status'
    alias gss='git status -s'
    alias gt='git log --oneline --graph --all'
fi

which mpc &>/dev/null
if [ $? = 0 ]; then
    alias p='mpc toggle'
fi

which tmux &>/dev/null
if [ $? = 0 ]; then
    alias t='tmux'
    # alias ta='tmux a'
    alias tls='tmux ls'
    ta() {
        if [ $# -gt 0 ]; then
            tmux attach -t $@
        else
            tmux attach
        fi
    }
fi


# platform specific
UNAME=`uname`
if [ $UNAME = 'Darwin' ]; then
    # export PAGER='col -b | vim -MR -'
    # export GITPAGER='col -b | vim -MR -c "setf diff" -'
    # export MANPAGER='col -b | vim -MR -c "setf man" -'
    alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
    alias md5sum='md5 -r'
elif [ $UNAME = 'Linux' ]; then
    alias ls='ls -F'
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
