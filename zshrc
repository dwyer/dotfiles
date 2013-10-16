source ~/.profile # load options shared between bash and zsh

autoload -Uz compinit; compinit
autoload -Uz promptinit; promptinit
autoload -Uz vcs_info

setopt bash_autolist
setopt histignorealldups 
setopt prompt_subst
setopt sharehistory

# Key bindings.
bindkey -e      # Use emacs keybindings even if our EDITOR is set to vi.
bindkey ';5C' emacs-forward-word        # alt+right in Gnome terminal.
bindkey ';5D' emacs-backward-word       # alt+left in Gnome terminal.
bindkey ';9C' emacs-forward-word        # option+right in iTerm2.
bindkey ';9D' emacs-backward-word       # option+left in iTerm2.
bindkey '[C' emacs-forward-word
bindkey '[D' emacs-backward-word
bindkey '^U' backward-kill-line         # delete everything to the left.

HISTSIZE=1000
SAVEHIST=1000

# Prompt.
zstyle ':vcs_info:*' actionformats '[%s(%b|%a)] '
zstyle ':vcs_info:*' formats       '[%s(%b)] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
precmd () { vcs_info }
PROMPT='%n@%m %3~ ${vcs_info_msg_0_}%# '
RPROMPT='[%D %*]'
