#!/usr/bin/env bash
# Comandos específicos de Arch Linux e derivados (pacman). Carregado por ../bootstrap.sh.
# Usa os helpers b/ok/warn/have definidos no script principal.

os_prepare() {
  b "pacman -Syu"
  sudo pacman -Syu --noconfirm
}

os_install_base() {
  b "Pacotes pacman"
  # No Arch o repo é rolling, então neovim/lazygit/fonte já vêm atuais
  sudo pacman -S --needed --noconfirm \
    base-devel git curl unzip \
    neovim \
    fd ripgrep \
    readline \
    tmux \
    lazygit \
    python python-pip

  _install_asdf
  _install_luaver
}

_install_asdf() {
  b "asdf"
  if have asdf; then ok "já instalado"; return; fi
  if pacman -Si asdf-vm >/dev/null 2>&1; then
    sudo pacman -S --needed --noconfirm asdf-vm || true
  fi
  if ! have asdf && [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.14.0
    # shellcheck disable=SC1091
    . "$HOME/.asdf/asdf.sh"
    warn 'adicione  . "$HOME/.asdf/asdf.sh"  ao seu ~/.bashrc/~/.zshrc'
  fi
  [ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh" || true
}

_install_luaver() {
  if have luaver; then return; fi
  if [ ! -d "$HOME/.luaver" ]; then
    git clone https://github.com/DhavalKapil/luaver.git "$HOME/.luaver" || true
  fi
  # shellcheck disable=SC1091
  [ -f "$HOME/.luaver/luaver" ] && . "$HOME/.luaver/luaver"
  warn 'luaver carregado — alternativa: sudo pacman -S lua51'
}

os_install_nerdfont() {
  b "Nerd Font"
  if pacman -Qi ttf-jetbrains-mono-nerd >/dev/null 2>&1; then
    ok "ttf-jetbrains-mono-nerd já instalada"
    return
  fi
  sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd
  warn "Lembre de selecionar a JetBrainsMono Nerd Font no seu terminal."
}

os_post_notes() {
  printf "\n  Obs Arch: reinicie o shell (ou \`source ~/.bashrc\`) p/ carregar asdf/luaver.\n"
}
