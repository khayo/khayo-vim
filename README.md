# khayo-vim
Repositório para armazenar minhas configurações do neovim

# Linux
clonar na pasta `.config/nvim`

# Windows
Clonar na pasta `/c/users/SEU_USER/AppData/local/nvim`
# Comandos úteis:

## Instalação Lua
```bash
asdf plugin add lua
asdf install lua 5.1
asdf global lua 5.1
```
### Em caso de erro na instalação
```bash
sudo apt-get install libreadline-dev
```

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

## Instalação node
```bash
asdf plugin add nodejs
asdf install nodejs 20.14.0
asdf global nodejs 20.14.0
```

## Dependências Ubuntu
```bash
sudo apt install fd-find
sudo apt install ripgrep
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
```
winget install -e --id=JesseDuffield.lazygit
```
## Linux
### ubuntu/termux
```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```
### Manjaro
```bash
sudo pacman -S lazygit
```

## NGINX lsp
```bash
pip install -U nginx-language-server
```

# Dotnet
## Instalação debugger

# Falta resolver
Ainda não consegui resolver as questões do clipboard que não funciona corretamente
em máquinas remotas e WSL

Também preciso aprender a usar o tmux de forma a útilizar todo seu potencial

# Erro windows 
`requires vim compiled with python`

```bash
 pip3 install pynvim
```

# Pacotes NPM para instalar
npm i -g vscode-css-languageservice cssmodules-language-server typescript-language-server some-sass-language-server vscode-langservers-extracted @angular/language-server typescript tree-sitter-cli neovim

# updater
adicione ao .bashrc ou .zshrc o alias a seguir
```bash
alias nup=/c/users/CHANGE_FOR_THE_CORRECT_USER/appdata/local/nvim/./update.sh
```
# config
adicione esse alias para facilitar a configuração do repositório
```bash
alias cnv='cd /c/users/CHANGE_FOR_THE_CORRECT_USER/appdata/local/nvim/'
```

# Health check
Use o comando  `:checkhealth`
