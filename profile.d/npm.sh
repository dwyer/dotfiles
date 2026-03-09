NPM_PACKAGES="${HOME}/.npm-packages"

if [ -e "${NPM_PACKAGES}" ]; then
    PATH="${NPM_PACKAGES}/bin:${PATH}"
    NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"
    export NPM_PACKAGES
fi
