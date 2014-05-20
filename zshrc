source ~/.profile # load options shared between bash and zsh

# Autocomplete.
autoload -Uz compinit && compinit
# setopt menu_complete # start completing right away
setopt nolistbeep # don't beep while completing

# History.
# setopt histignorealldups 
# setopt sharehistory
export HISTFILE=~/.history
export HISTSIZE=1000
# export SAVEHIST=$HISTSIZE

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

# Modify arrow keys to navigate words.
# TODO: learn emacs bindings and delete these.
bindkey -e      # Use emacs keybindings even if our EDITOR is set to vi.
bindkey ';5C' emacs-forward-word        # alt+right in Gnome terminal.
bindkey ';5D' emacs-backward-word       # alt+left in Gnome terminal.
bindkey ';9C' emacs-forward-word        # option+right in iTerm2.
bindkey ';9D' emacs-backward-word       # option+left in iTerm2.
bindkey '[C' emacs-forward-word
bindkey '[D' emacs-backward-word
bindkey '^U' backward-kill-line         # delete everything to the left.

# <c-x><c-e> to edit command line (like in bash)
autoload -Uz edit-command-line \
    && zle -N edit-command-line \
    && bindkey '\C-x\C-e' edit-command-line
