# Autocomplete.
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# setopt menu_complete # start completing right away
setopt nolistbeep # don't beep while completing

# History.
# setopt histignorealldups
# setopt sharehistory
# History stays in memory for the session and is never written to disk: with
# HISTFILE unset zsh has nowhere to save it, and SAVEHIST=0 keeps it that way
# should anything restore HISTFILE later. These are shell parameters, not
# environment; exporting them leaks into subshells that read the same names.
unset HISTFILE
HISTSIZE=1000
SAVEHIST=0

# Prompt.
# autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz vcs_info && precmd () { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr     '+'
zstyle ':vcs_info:*' unstagedstr   '*'
zstyle ':vcs_info:*' actionformats '[%s(%b|%a)] '
zstyle ':vcs_info:*' formats       '[%s(%b%m%u%c)] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
PROMPT='\
%{$fg[cyan]%}%n@%M%{$reset_color%}\
:\
%{$fg[blue]%}%~%{$reset_color%} \
%{$fg[none]%}${vcs_info_msg_0_}%{$reset_color%}\
%# '
RPROMPT='[%D %*]'

# <c-x><c-e> to edit command line (like in bash)
autoload -Uz edit-command-line \
    && zle -N edit-command-line \
    && bindkey '\C-x\C-e' edit-command-line

for filename in .aliases .shrc .zshrc.local; do
    if [ -f ~/$filename ]; then
        source ~/$filename
    fi
done
