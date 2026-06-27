#!/usr/bin/env bash
# Comandos específicos de Ubuntu/Debian (apt). Carregado por ../bootstrap.sh.
# Usa os helpers b/ok/warn/have definidos no script principal.

_ARCH="$(uname -m)"

os_prepare() {
  b "apt update"
  sudo apt update
}

os_install_base() {
  b "Pacotes apt"
  sudo apt install -y \
    git curl unzip build-essential \
    fd-find ripgrep \
    libreadline-dev \
    tmux \
    python3 python3-pip python3-venv

  # fd no Ubuntu se chama `fdfind`; cria alias `fd` em ~/.local/bin
  mkdir -p "$HOME/.local/bin"
  if ! have fd && have fdfind; then
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
    ok "symlink fd -> fdfind criado em ~/.local/bin"
  fi
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) : ;;
    *) export PATH="$HOME/.local/bin:$PATH"
       warn "adicione ~/.local/bin ao PATH no seu ~/.bashrc/~/.zshrc" ;;
  esac

  _install_neovim
  _install_lazygit
  _install_asdf
  _install_luaver
}

# Neovim via release oficial (o apt costuma trazer versão antiga; precisamos >= 0.11)
_install_neovim() {
  b "Neovim (release oficial)"
  if have nvim; then
    local ver major minor
    ver="$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+')"
    major="${ver%%.*}"; minor="${ver##*.}"
    if [ "$major" -gt 0 ] || [ "$minor" -ge 11 ]; then
      ok "nvim $ver já atende (>= 0.11)"
      return
    fi
    warn "nvim $ver é antigo — esta config exige >= 0.11"
  fi
  local tgz
  case "$_ARCH" in
    x86_64)  tgz="nvim-linux-x86_64.tar.gz" ;;
    aarch64) tgz="nvim-linux-arm64.tar.gz" ;;
    *) warn "arquitetura $_ARCH desconhecida — instale o Neovim manualmente"; return ;;
  esac
  local tmp; tmp="$(mktemp -d)"
  curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/$tgz" -o "$tmp/nvim.tar.gz"
  sudo rm -rf /opt/nvim
  sudo mkdir -p /opt/nvim
  sudo tar -xzf "$tmp/nvim.tar.gz" -C /opt/nvim --strip-components=1
  sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
  rm -rf "$tmp"
  ok "Neovim instalado em /opt/nvim"
}

_install_lazygit() {
  b "lazygit"
  if have lazygit; then ok "já instalado"; return; fi
  local ver arch
  ver="$(curl -s 'https://api.github.com/repos/jesseduffield/lazygit/releases/latest' | grep -Po '"tag_name": *"v\K[^"]*')"
  case "$_ARCH" in
    x86_64)  arch="Linux_x86_64" ;;
    aarch64) arch="Linux_arm64" ;;
    *) warn "arquitetura $_ARCH sem binário lazygit — instale manualmente"; return ;;
  esac
  local tmp; tmp="$(mktemp -d)"
  curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${ver}/lazygit_${ver}_${arch}.tar.gz" -o "$tmp/lazygit.tar.gz"
  tar -xzf "$tmp/lazygit.tar.gz" -C "$tmp" lazygit
  sudo install "$tmp/lazygit" -D -t /usr/local/bin/
  rm -rf "$tmp"
  ok "lazygit $ver instalado"
}

_install_asdf() {
  b "asdf"
  if have asdf; then ok "já instalado"; return; fi
  if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.14.0
  fi
  # shellcheck disable=SC1091
  . "$HOME/.asdf/asdf.sh"
  warn 'adicione  . "$HOME/.asdf/asdf.sh"  ao seu ~/.bashrc/~/.zshrc'
}

_install_luaver() {
  if have luaver; then return; fi
  if [ ! -d "$HOME/.luaver" ]; then
    git clone https://github.com/DhavalKapil/luaver.git "$HOME/.luaver" || true
  fi
  # shellcheck disable=SC1091
  [ -f "$HOME/.luaver/luaver" ] && . "$HOME/.luaver/luaver"
  warn 'adicione  . "$HOME/.luaver/luaver"  ao seu ~/.bashrc/~/.zshrc'
}

os_install_nerdfont() {
  b "Nerd Font"
  local font_dir="$HOME/.local/share/fonts"
  if ls "$font_dir" 2>/dev/null | grep -qi "nerd"; then
    ok "Nerd Font já presente"
    return
  fi
  mkdir -p "$font_dir"
  local tmp; tmp="$(mktemp -d)"
  curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -o "$tmp/JetBrainsMono.zip"
  unzip -oq "$tmp/JetBrainsMono.zip" -d "$font_dir"
  rm -rf "$tmp"
  fc-cache -f >/dev/null 2>&1 || true
  warn "Lembre de selecionar a JetBrainsMono Nerd Font no seu terminal."
}

os_post_notes() {
  printf "\n  Obs Ubuntu: reinicie o shell (ou \`source ~/.bashrc\`) p/ carregar asdf/luaver/PATH.\n"
}
