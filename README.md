# khayo-vim
Repositório para armazenar minhas configurações do neovim

Está versão utiliza o lazy como gerenciador de pacotes

Para resolver o problema do tresitter no checkhealth
```bash
npm i -g tree-sitter-cli
```

# Comandos úteis:

## Instalação Lua
asdf plugin add lua
asdf install lua 5.1
asdf global lua 5.1

ou

asdf install lua latest
asdf global lua latest

## Instalação node

asdf plugin add nodejs
asdf install nodejs 20.14.0
asdf global nodejs 20.14.0

## Pacotes node
npm i -g tree-sitter-cli
npm i -g neovim

## Pacotes APT
sudo apt install fd-find
sudo apt install ripgrep

## Lazygit
https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation

# Falta resolver
Ainda não consegui resolver as questões do clipboard que não funciona corretamente
em máquinas remotas e WSL

Também preciso aprender a usar o tmux de forma a útilizar todo seu potencial

# Erro windows 
`requires vim compiled with python`

```bash
 pip3 install pynvim
```
