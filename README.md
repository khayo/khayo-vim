# khayo-vim
Repositório para armazenar minhas configurações do neovim

# Ubuntu
clonar na pasta `.config/nvim`

```bash
sudo apt install fd-find ripgrep libreadline-dev
```

## Instalação Lua
```bash
asdf plugin add lua
asdf install lua 5.1
asdf global lua 5.1
```

## Instalação Node
```bash
asdf plugin add nodejs
asdf install nodejs 20.14.0
asdf global nodejs 20.14.0
```

## Instalação Python
```bash
asdf plugin add python
asdf install python 3.13.0
asdf global python 3.13.0
```

## Instalação Rust
```bash
asadf plugin add rust
asdf install rust 1.84.0
asdf global python 1.84.0
```

## Lazygit
```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```

# Pacotes
## python
```bash
pip install -U nginx-language-server pynvim
```
## NPM
npm i -g vscode-css-languageservice cssmodules-language-server typescript-language-server some-sass-language-server vscode-langservers-extracted @angular/language-server typescript tree-sitter-cli neovim


# Aliases
Adicione ao .bashrc ou .zshrc o alias a seguir para facilitar a configuração e atualização
```bash
alias nup='~/.config/nvim/./update.sh'
alias cnv='cd ~/.config/nvim/'
```

# Health check
`:checkhealth`

# Windows
Clonar na pasta `/c/users/SEU_USER/AppData/local/nvim`
# Comandos úteis:

### Em caso de erro na instalação

## Lua windows
```bash
https://github.com/rjpcomputing/luaforwindows/releases
```
### Lua Rocks
```bash
https://github.com/luarocks/luarocks/wiki/Download
```

#### Instruções Lua Rocks
```bash
https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows
```

## dependências Windows
```bash
choco install fd
choco install ripgrep
```

# Lazygit
## Windows
### Chocolatey
```powershell
choco install lazygit
```
### Winget
```powershell
winget install -e --id=JesseDuffield.lazygit
```
## Linux
### Manjaro
```bash
sudo pacman -S lazygit
```


# Dotnet
## Instalação debugger

# Falta resolver
Ainda não consegui resolver as questões do clipboard que não funciona corretamente
em máquinas remotas e WSL

Também preciso aprender a usar o tmux de forma a útilizar todo seu potencial

# updater
Adicione ao .bashrc ou .zshrc o alias a seguir
```bash
alias nup=/c/users/CHANGE_FOR_THE_CORRECT_USER/appdata/local/nvim/./update.sh
```
# config
Adicione esse alias para facilitar a configuração do repositório
```bash
alias cnv='cd /c/users/CHANGE_FOR_THE_CORRECT_USER/appdata/local/nvim/'
```

# Health check
Use o comando  `:checkhealth`
