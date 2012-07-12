# colors
export TERM=xterm-256color
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'

export BROWSER=google-chrome
export EDITOR=vim
export PAGER=less

export LESSHISTFILE=/dev/null

export ANDROIDPATH=/usr/local/android-sdk-linux
export APPENGINEPATH=/usr/local/google_appengine
export GSUTILPATH=/usr/local/gsutil

# Add ~/bin to path
if [ -e $HOME/bin ]; then
    PATH=$HOME/bin:$PATH
fi

# Add Android SDK to path.
if [ -e $ANDROIDPATH ]; then
    PATH=$ANDROIDPATH/platform-tools:$PATH
    PATH=$ANDROIDPATH/tools:$PATH
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
alias mv='mv -i'

# shortcuts
alias ac='apt-cache'
alias cx='chmod +x'
alias gc='stfu google-chrome'
alias ipy='ipython -pylab -noconfirm_exit'
alias ka='killall'
alias l='ls'
alias la='ls -A'
alias lc='wc -l'
alias ll='ls -lh'
alias lla='ls -Alh'
alias md='mkdir -p'
alias p='mpc toggle'
alias pa='ps -A'
alias pag='ps -A | grep'
alias pp='echo hehehe'
alias py='python'
alias s='source'
alias sc='screen -r'
alias sl='ls'
alias t='tmux'
alias ta='tmux a'

# shortcuts
alias irb=/usr/bin/irb1.9.1
alias ruby=/usr/bin/ruby1.9.1
alias appserver=/usr/local/google_appengine/dev_appserver.py
alias appcfg=/usr/local/google_appengine/appcfg.py

# stfu
alias eog='stfu eog'
alias evince='stfu evince'
alias gimp='stfu gimp'
alias lyx='stfu lyx'
alias parole='stfu parole'
alias picard='stfu picard'
alias ristretto='stfu ristretto'
alias totem='stfu totem'
