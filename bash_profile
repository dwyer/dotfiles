# Bash reads this instead of ~/.profile for login shells, so that login and
# non-login shells get identical setup. Everything lives in ~/.bashrc.
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
