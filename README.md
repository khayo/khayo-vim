# khayo-vim
Repositório para armazenar minhas configurações do neovim


# Comandos úteis:

## Instalação Lua
```bash
asdf plugin add lua
asdf install lua 5.1
asdf global lua 5.1
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
