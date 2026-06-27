#!/usr/bin/env bash
#
# Bootstrap da config do Neovim em uma máquina recém-formatada.
# Detecta o sistema operacional e carrega os comandos específicos de
# bootstrap/<os>.sh. A lógica comum (runtimes, language servers, clone,
# sync) fica aqui. Idempotente: pode rodar várias vezes sem quebrar nada.
#
# Uso:
#   ./bootstrap.sh            # instala tudo
#   ./bootstrap.sh --no-sync  # não roda o sync headless do Lazy no final
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_DIR="$HOME/.config/nvim"
REPO_URL="https://github.com/khayo/khayo-vim.git"
RUN_SYNC=1

# Versões fixadas dos runtimes (compartilhadas por todos os SOs)
NODE_VERSION="20.14.0"
PYTHON_VERSION="3.13.0"
RUST_VERSION="1.84.0"
LUA_VERSION="5.1.5"

for arg in "$@"; do
  case "$arg" in
    --no-sync) RUN_SYNC=0 ;;
  esac
done

# ---------------------------------------------------------------------------
# Helpers (usados também pelos arquivos de cada SO)
# ---------------------------------------------------------------------------
b() { printf "\033[1;34m==>\033[0m %s\n" "$*"; }
ok() { printf "\033[1;32m  ok\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m  !!\033[0m %s\n" "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

# ---------------------------------------------------------------------------
# Detecção de SO -> carrega bootstrap/<os>.sh
# ---------------------------------------------------------------------------
detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if [ -r /etc/os-release ]; then
        # shellcheck disable=SC1091
        . /etc/os-release
        case "${ID:-}:${ID_LIKE:-}" in
          *arch*) echo "arch" ;;
          *debian*|*ubuntu*) echo "ubuntu" ;;
          *) echo "unknown" ;;
        esac
      else
        echo "unknown"
      fi
      ;;
    *) echo "unknown" ;;
  esac
}

OS="$(detect_os)"
OS_FILE="$SCRIPT_DIR/bootstrap/${OS}.sh"

if [ "$OS" = "unknown" ] || [ ! -f "$OS_FILE" ]; then
  warn "Sistema operacional não suportado automaticamente (detectado: $OS)."
  warn "Suportados: macos, ubuntu/debian, arch. Veja bootstrap/ para adaptar."
  exit 1
fi

b "Sistema detectado: $OS"
# shellcheck disable=SC1090
. "$OS_FILE"

# ---------------------------------------------------------------------------
# Passos específicos do SO (definidos em bootstrap/<os>.sh)
# ---------------------------------------------------------------------------
os_prepare          # gerenciador de pacotes / repos
os_install_base     # nvim, fd, ripgrep, lazygit, tmux, git, build tools
os_install_nerdfont # Nerd Font

# ---------------------------------------------------------------------------
# Passos comuns a todos os SOs
# ---------------------------------------------------------------------------
setup_runtimes() {
  b "Runtimes (asdf)"
  if ! have asdf; then
    warn "asdf não encontrado no PATH — usando Node/Python/Rust do sistema."
    return
  fi
  asdf_add() { asdf plugin list 2>/dev/null | grep -qx "$1" || asdf plugin add "$1"; }
  local plugin version
  for pair in "nodejs:$NODE_VERSION" "python:$PYTHON_VERSION" "rust:$RUST_VERSION"; do
    plugin="${pair%%:*}"; version="${pair##*:}"
    asdf_add "$plugin"
    asdf install "$plugin" "$version" || true
    asdf set -u "$plugin" "$version" 2>/dev/null || asdf global "$plugin" "$version" || true
  done
}

setup_lua() {
  b "Lua 5.1 (luaver)"
  if ! have luaver; then
    warn "luaver não encontrado — instale Lua 5.1 manualmente se algum plugin exigir."
    return
  fi
  luaver install "$LUA_VERSION" || true
  luaver use "$LUA_VERSION" || true
  luaver set-default "$LUA_VERSION" || true
}

setup_npm_globals() {
  b "Pacotes NPM globais (language servers)"
  if ! have npm; then
    warn "npm não disponível — pulei os language servers do Node."
    return
  fi
  npm i -g \
    vscode-css-languageservice \
    cssmodules-language-server \
    typescript-language-server \
    some-sass-language-server \
    vscode-langservers-extracted \
    @angular/language-server \
    typescript \
    tree-sitter-cli \
    neovim
}

setup_pip_packages() {
  b "Pacotes Python (pynvim + nginx LS)"
  if ! have pip3; then
    warn "pip3 não disponível — instale pynvim manualmente."
    return
  fi
  pip3 install -U --break-system-packages nginx-language-server pynvim 2>/dev/null \
    || pip3 install -U nginx-language-server pynvim
}

clone_config() {
  b "Config do Neovim"
  if [ -d "$NVIM_DIR/.git" ]; then
    ok "repo já presente em $NVIM_DIR"
  elif [ -d "$NVIM_DIR" ] && [ -n "$(ls -A "$NVIM_DIR" 2>/dev/null)" ]; then
    warn "$NVIM_DIR existe mas não é um repo git — não vou sobrescrever."
  else
    git clone "$REPO_URL" "$NVIM_DIR"
  fi
}

sync_plugins() {
  [ "$RUN_SYNC" -eq 1 ] || return 0
  b "Sincronizando plugins (Lazy)"
  nvim --headless "+Lazy! sync" +qa || warn "Lazy sync falhou — abra o nvim e rode :Lazy sync"
}

setup_runtimes
setup_lua
setup_npm_globals
setup_pip_packages
clone_config
sync_plugins

# ---------------------------------------------------------------------------
# Próximos passos (cada SO pode acrescentar dicas via os_post_notes)
# ---------------------------------------------------------------------------
b "Pronto!"
cat <<'EOF'

Próximos passos manuais:
  1. Abra o Neovim e rode:  :checkhealth
  2. Instale o emmet LS:    :MasonInstall emmet-language-server
  3. (opcional) tmux-sessionizer p/ o atalho <C-f>:
       https://github.com/ThePrimeagen/tmux-sessionizer
  4. Selecione uma Nerd Font nas preferências do seu terminal.

Aliases úteis (adicione ao ~/.bashrc ou ~/.zshrc):
  alias nup='~/.config/nvim/update.sh'
  alias cnv='cd ~/.config/nvim/'
EOF

if declare -f os_post_notes >/dev/null; then
  os_post_notes
fi
