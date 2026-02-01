#!/bin/bash

# Este script prepara os temas para uso local ou empacotamento.
# Ele copia os ícones da pasta global 'icons/' para cada tema em 'themes/'.

REPO_ROOT=$(dirname "$(dirname "$(readlink -f "$0")")")
THEMES_DIR="$REPO_ROOT/themes"
ICONS_DIR="$REPO_ROOT/icons"
DIST_DIR="$REPO_ROOT/dist"

echo "Iniciando preparação dos temas..."

mkdir -p "$DIST_DIR"

for theme_path in "$THEMES_DIR"/*; do
    if [ -d "$theme_path" ]; then
        theme_name=$(basename "$theme_path")
        echo "Processando tema: $theme_name"
        
        # Cria pasta de ícones se não existir
        mkdir -p "$theme_path/icons"
        
        # Copia ícones (evita erro se a pasta de ícones estiver vazia, embora não devesse estar)
        cp -r "$ICONS_DIR"/* "$theme_path/icons/"
        
        echo "Tema '$theme_name' preparado com ícones."
    fi
done

echo "Concluído!"
