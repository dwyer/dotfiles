# colors
export TERM=xterm-256color
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'

export EDITOR=vim
export BROWSER=google-chrome

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# overrides
alias apt-get='aptitude'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias ls='ls --color=auto'
alias mv='mv -i'

# shortcuts
alias cx='chmod +x'
alias ipy='ipython -pylab -noconfirm_exit'
alias l='ls'
alias la='ls -A'
alias lc='wc -l'
alias ll='ls -lh'
alias lla='ls -Alh'
alias p='mpc toggle'
alias pa='ps -A'
alias pp='echo hehehe'
alias py='python'
alias sl='ls'

# shortcuts
alias eclipse=/usr/local/eclipse/eclipse
alias irb=/usr/bin/irb1.9.1
alias ruby=/usr/bin/ruby1.9.1
alias sublime=/usr/local/sublime/sublime_text
alias appserver=/usr/local/google_appengine/dev_appserver.py
alias appcfg=/usr/local/google_appengine/appcfg.py

# stfu
alias eog='stfu eog'
alias evince='stfu evince'
alias lyx='stfu lyx'
