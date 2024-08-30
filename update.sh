#!/bin/bash

# Armazena o diretório atual
current_dir=$(pwd)

# Define os diretórios dos repositórios Git para Windows e Linux
windows_repo_dir="$HOME/AppData/Local/nvim"
linux_repo_dir="$HOME/.config/nvim"

# Detecta o sistema operacional
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    repo_dir="$linux_repo_dir"
elif [[ "$OSTYPE" == "msys" ]]; then
    repo_dir="$windows_repo_dir"
else
    echo "Sistema operacional não suportado."
    exit 1
fi

# Verifica se o diretório do repositório existe
if [ ! -d "$repo_dir" ]; then
  echo "O diretório $repo_dir não existe."
  exit 1
fi

# Navega para o diretório do repositório
cd "$repo_dir"

# Verifica se o diretório é um repositório Git
if [ ! -d ".git" ]; then
  echo "O diretório $repo_dir não é um repositório Git."
  cd "$current_dir"
  exit 1
fi

# Executa o git pull
git pull

# Volta para o diretório original
cd "$current_dir"
