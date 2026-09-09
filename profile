# editor
export EDITOR=vim

# pager
export PAGER=less
export LESSHISTFILE=/dev/null

# Prepend a directory to PATH, skipping it if missing or already present.
path_prepend() {
    [ -d "$1" ] || return 0
    case ":${PATH}:" in
        *":$1:"*) ;;
        *) PATH="$1:${PATH}" ;;
    esac
}

for filename in "$HOME"/.profile.d/*.sh; do
    [ -e "$filename" ] || continue
    . "$filename"
done
unset filename

if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"
export PATH
unset -f path_prepend
