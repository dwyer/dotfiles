# pnpm
PNPM_HOME="${HOME}/.local/share/pnpm"
if [ -e "${PNPM_HOME}" ]; then
    export PNPM_HOME
    case ":${PATH}:" in
        *":${PNPM_HOME}:"*) ;;
        *) export PATH="${PNPM_HOME}:$PATH" ;;
    esac
fi
# pnpm end
