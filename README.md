# khayo-vim
Repositório para armazenar minhas configurações do neovim

# Atalhos

O leader desta configuração é `Espaço`.

## Arquivos e sessão

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>w` | Normal | Salvar arquivo |
| `<leader>q` | Normal | Fechar janela/buffer atual |
| `<leader>q2` | Normal | Fechar sem salvar |
| `<leader>qa` | Normal | Fechar tudo sem salvar |
| `<leader>x` | Normal | Tornar o arquivo atual executável |

## Edição e navegação básica

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<A-j>` | Visual | Mover seleção para baixo |
| `<A-k>` | Visual | Mover seleção para cima |
| `<C-d>` | Normal | Descer meia página e centralizar cursor |
| `<C-u>` | Normal | Subir meia página e centralizar cursor |
| `n` | Normal | Próximo resultado de busca e centralizar |
| `N` | Normal | Resultado anterior de busca e centralizar |
| `<leader>p` | Visual | Colar sem sobrescrever o registro |
| `<leader>y` | Normal/Visual | Copiar para clipboard do sistema |
| `<leader>Y` | Normal | Copiar linha para clipboard do sistema |
| `<leader>d` | Normal/Visual | Deletar sem copiar para registro |
| `<leader>s` | Normal | Substituir palavra sob o cursor no arquivo |
| `gcc` | Normal | Comentar/descomentar linha |

## Janelas, splits e buffers

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<C-h>` | Normal | Ir para janela da esquerda |
| `<C-j>` | Normal | Ir para janela de baixo |
| `<C-k>` | Normal | Ir para janela de cima |
| `<C-l>` | Normal | Ir para janela da direita |
| `<leader>vs` | Normal | Abrir split vertical |
| `<leader>vh` | Normal | Abrir split horizontal |
| `<leader>bb` | Normal | Buffer anterior |
| `<leader>bn` | Normal | Próximo buffer |
| `<leader>bd` | Normal | Fechar buffer atual |
| `<leader>ba` | Normal | Fechar todos os buffers |

## Listas, diagnostics e quickfix

| Atalho | Modo | Ação |
| --- | --- | --- |
| `]d` | Normal | Próximo diagnostic |
| `[d` | Normal | Diagnostic anterior |
| `gl` | Normal | Abrir diagnostic em float |
| `<leader>mm` | Normal | Próximo diagnostic |
| `<leader>yy` | Normal | Diagnostic anterior |
| `]q` | Normal | Próximo item da quickfix |
| `[q` | Normal | Item anterior da quickfix |
| `<leader>co` | Normal | Abrir quickfix |
| `<leader>cc` | Normal | Fechar quickfix |
| `]l` | Normal | Próximo item da location list |
| `[l` | Normal | Item anterior da location list |

## LSP

| Atalho | Modo | Ação |
| --- | --- | --- |
| `K` | Normal | Hover/documentação |
| `gd` | Normal | Ir para definição |
| `gD` | Normal | Ir para declaração |
| `gi` | Normal | Ir para implementação |
| `go` | Normal | Ir para definição de tipo |
| `gr` | Normal | Listar referências |
| `gs` | Normal | Signature help |
| `<F2>` | Normal | Renomear símbolo |
| `<F3>` | Normal/Visual | Formatar com LSP |
| `<F13>` | Normal/Visual | Formatar com LSP |
| `<F14>` | Normal | Code action |
| `<leader>f` | Normal | Formatar com LSP |
| `<leader>ca` | Normal | Code action |

## Telescope

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>ff` | Normal | Procurar arquivos |
| `<C-p>` | Normal | Procurar arquivos do Git |
| `<leader>fs` | Normal | Buscar palavra sob o cursor |
| `<leader>fg` | Normal | Live grep |
| `<leader>fb` | Normal | Listar buffers |
| `<leader>fh` | Normal | Help tags |
| `<leader>km` | Normal | Listar atalhos customizados |

## Treesitter

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>vv` | Normal | Iniciar seleção incremental |
| `+` | Visual/Seleção | Expandir seleção para próximo node |
| `_` | Visual/Seleção | Reduzir seleção para node anterior |
| `af` | Visual/Operator | Selecionar função externa |
| `if` | Visual/Operator | Selecionar interior da função |
| `ac` | Visual/Operator | Selecionar classe externa |
| `ic` | Visual/Operator | Selecionar interior da classe |
| `ai` | Visual/Operator | Selecionar bloco condicional externo |
| `ii` | Visual/Operator | Selecionar interior do bloco condicional |
| `al` | Visual/Operator | Selecionar loop externo |
| `il` | Visual/Operator | Selecionar interior do loop |
| `ap` | Visual/Operator | Selecionar parametro externo |
| `ip` | Visual/Operator | Selecionar interior do parametro |
| `[f` | Normal | Ir para função anterior |
| `]f` | Normal | Ir para próxima função |
| `[c` | Normal | Ir para classe anterior |
| `]c` | Normal | Ir para próxima classe |
| `[p` | Normal | Ir para parametro anterior |
| `]p` | Normal | Ir para próximo parametro |
| `<leader>a` | Normal | Trocar parametro com o próximo |
| `<leader>A` | Normal | Trocar parametro com o anterior |

## Autocomplete

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<Tab>` | Insert | Aceitar sugestão do Blink |

## Plugins e ferramentas

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>e` | Normal | Abrir/fechar NvimTree |
| `<leader>M` | Normal | Abrir Mason |
| `<leader>L` | Normal | Abrir Lazy |
| `<leader>gg` | Normal | Abrir LazyGit |
| `<leader>u` | Normal | Abrir/fechar Undotree |
| `<leader>gb` | Normal | Alternar Git Blame |
| `<leader>db` | Normal | Abrir Dadbod UI |
| `<C-\>` | Normal | Abrir/fechar ToggleTerm |
| `<Esc>` | Terminal | Sair do modo terminal |
| `<C-f>` | Normal | Abrir `tmux-sessionizer` em nova janela do tmux |

## Harpoon

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>aa` | Normal | Adicionar arquivo ao Harpoon |
| `<C-e>` | Normal | Abrir menu do Harpoon |
| `<leader><leader>1` | Normal | Abrir arquivo 1 do Harpoon |
| `<leader><leader>2` | Normal | Abrir arquivo 2 do Harpoon |
| `<leader><leader>3` | Normal | Abrir arquivo 3 do Harpoon |
| `<leader><leader>4` | Normal | Abrir arquivo 4 do Harpoon |
| `<leader><leader>5` | Normal | Abrir arquivo 5 do Harpoon |
| `<leader><leader>6` | Normal | Abrir arquivo 6 do Harpoon |
| `<leader><leader>7` | Normal | Abrir arquivo 7 do Harpoon |
| `<leader><leader>8` | Normal | Abrir arquivo 8 do Harpoon |

## Angular

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>at` | Normal | Ir para template do componente |
| `<leader>ac` | Normal | Ir para componente a partir do template |
| `<leader>aT` | Normal | Abrir template type-check block |

## Icon Picker

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader><leader>i` | Normal | Abrir seletor de icones |
| `<leader><leader>y` | Normal | Copiar icone selecionado |
| `<C-y>` | Insert | Inserir icone selecionado |

## Compiler e tarefas

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader><F6>` | Normal | Abrir Compiler |
| `<leader><F7>` | Normal | Parar tarefas e refazer ultima seleção |
| `<F7>` | Normal | Abrir/fechar resultados do Compiler |

## Debug com Vimspector

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>di` | Normal/Visual | Avaliar valor sob cursor/seleção |
| `<leader><F11>` | Normal | Subir stack frame |
| `<leader><F12>` | Normal | Descer stack frame |
| `<leader>B` | Normal | Gerenciar breakpoints |
| `<leader>D` | Normal | Desassemblar código |
| `<leader><F3>` | Normal | Resetar Vimspector |

# Setup rápido (macOS, Ubuntu/Debian e Arch)

Numa máquina recém-formatada, clone o repo e rode o `bootstrap.sh`. Ele detecta o
sistema operacional automaticamente e usa o gerenciador de pacotes certo (Homebrew,
apt ou pacman). É idempotente — pode rodar de novo sem quebrar nada — e instala
Neovim, fd, ripgrep, lazygit, tmux, runtimes (Node/Python/Rust via asdf, Lua 5.1 via
luaver), a Nerd Font e todos os language servers.

```bash
git clone https://github.com/khayo/khayo-vim.git ~/.config/nvim
cd ~/.config/nvim
./bootstrap.sh
```

Opções:

- `./bootstrap.sh --no-sync` — não roda o `:Lazy sync` headless no final.

Depois do script: abra o Neovim, rode `:checkhealth` e `:MasonInstall emmet-language-server`.

## Como o bootstrap é organizado

- `bootstrap.sh` — detecta o SO e contém a lógica comum (runtimes, language servers,
  clone da config, sync de plugins). As versões fixadas dos runtimes ficam no topo do arquivo.
- `bootstrap/macos.sh`, `bootstrap/ubuntu.sh`, `bootstrap/arch.sh` — apenas os comandos
  específicos de cada sistema (instalar pacotes base, Neovim, lazygit, Nerd Font).

Para adicionar suporte a outra distro, crie um `bootstrap/<os>.sh` definindo as funções
`os_prepare`, `os_install_base` e `os_install_nerdfont` (e, opcionalmente, `os_post_notes`).

---

As instruções manuais abaixo continuam servindo de referência caso prefira instalar passo a passo.

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
asdf plugin add rust
asdf install rust 1.84.0
asdf global rust 1.84.0
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
```bash
npm i -g vscode-css-languageservice cssmodules-language-server typescript-language-server some-sass-language-server vscode-langservers-extracted @angular/language-server typescript tree-sitter-cli neovim
```

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

# Adicionar usando Mason
Expansor de HTML
https://github.com/olrtg/emmet-language-server
```nvim
:MasonInstall emmet-language-server
```
# Health check
Use o comando  `:checkhealth`
