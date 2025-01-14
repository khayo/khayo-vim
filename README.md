# khayo-vim
Repositório para armazenar minhas configurações do neovim

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
### Lua windows
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

## Pacotes node
```bash
npm i -g tree-sitter-cli
npm i -g neovim
```

## Pacotes APT
```bash
sudo apt install fd-find
sudo apt install ripgrep
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
apt install lazygit
```
### Manjaro
```bash
sudo pacman -S lazygit
```

## Angular lsp
```bash
npm install -g typescript-language-server typescript                           
npm install -g @angular/language-server                                        
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
npm i -g vscode-css-language-server cssmodules-language-server typescript-language-server some-sass-language-server vscode-langservers-extracted @angular/language-server typescript tree-sitter-cli neovim

# updater
adicione ao .bashrc ou .zshrc o alias a seguir
```bash
alias nup=/c/users/khayo/appdata/local/nvim/./update.sh
```
