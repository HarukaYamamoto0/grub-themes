#!/bin/bash

# Script para preparar temas para teste ou distribuição local.
# Uso: ./scripts/prepare.sh [nome-do-tema]

REPO_ROOT=$(dirname "$(dirname "$(readlink -f "$0")")")
THEMES_DIR="$REPO_ROOT/themes"
ICONS_DIR="$REPO_ROOT/icons"
TEST_DIR="$REPO_ROOT/__tests__"

prepare_theme() {
    local theme_name=$1
    local target_dir=$2
    
    echo "Preparando tema: $theme_name em $target_dir"
    
    mkdir -p "$target_dir"
    cp -r "$THEMES_DIR/$theme_name"/* "$target_dir/"
    
    mkdir -p "$target_dir/icons"
    cp -r "$ICONS_DIR"/* "$target_dir/icons/"
}

if [ -n "$1" ]; then
    # Prepara um tema específico para a pasta de testes
    if [ -d "$THEMES_DIR/$1" ]; then
        prepare_theme "$1" "$TEST_DIR/$1"
    else
        echo "Erro: Tema '$1' não encontrado em $THEMES_DIR"
        exit 1
    fi
else
    # Se nenhum tema for especificado, pergunta ou avisa
    echo "Nenhum tema especificado. Uso: ./scripts/prepare.sh <nome-do-tema>"
    echo "Temas disponíveis:"
    ls "$THEMES_DIR"
fi
