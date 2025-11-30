#!/bin/bash

# Autor: Vitor Martins
# script: backup-vitor.sh
# Esse script ira fazer um backup do meu "/home" e coloca na extensão tar, ou seja, compacta o arquivo de backup, 
# ele também mostra e adiciona ao nome do arquivo gerado as informações do comando "date" depois do backup.

mkdir -p vitor-home-backup

DATA=$(date '+%Y-%m-%d)
BACKUP_DIR="/vitor-home-backup"
ORIGINAL_DIR="/home/vm-co-vitor/"

echo "Começando backup..."
tar -czf "$BACKUP_DIR/backup_$DATA.tar.gz" "$ORIGINAL_DIR"
echo "Backup conclúido: backup_$DATA.tar.gz"
