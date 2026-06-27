#!/usr/bin/env bash
# Comandos específicos de macOS (Homebrew). Carregado por ../bootstrap.sh.
# Usa os helpers b/ok/warn/have definidos no script principal.

os_prepare() {
  b "Homebrew"
  if have brew; then
    ok "já instalado ($(brew --version | head -1))"
    return
  fi
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  [ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
}

os_install_base() {
  b "Pacotes Homebrew"
  # neovim do brew já vem >= 0.11
  local pkgs=(neovim git fd ripgrep lazygit tmux asdf luaver)
  local pkg
  for pkg in "${pkgs[@]}"; do
    if brew list --formula "$pkg" >/dev/null 2>&1; then
      ok "$pkg"
    else
      brew install "$pkg"
    fi
  done
}

os_install_nerdfont() {
  b "Nerd Font"
  if ls "$HOME/Library/Fonts" 2>/dev/null | grep -qi "nerd"; then
    ok "Nerd Font já presente"
    return
  fi
  brew install --cask font-jetbrains-mono-nerd-font
  warn "Lembre de selecionar a Nerd Font no seu terminal."
}
