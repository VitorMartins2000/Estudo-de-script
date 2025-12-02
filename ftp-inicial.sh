#!/bin/bash

# Autor: Vitor Martins
# Nome do script: ftp-inicial.sh
# Descrisão: Este script irá baixar um servidor FTP utilizando a
# biblioteca vstpd, também será feito um backup dos arquivos
# configurações ao acessar ele, depois disso iremos realizar a
# configura básica de alguns parâmetros do vsftpda

echo "Instalando vsftpd..."
yum install vsftpd -y

echo ""
echo "Criando backup das configurações."

# Criar diretório de backup se não existir
mkdir -p /home/vm-co-vitor/backups-teste

# Fazer backup
cp /etc/vsftpd/vsftpd.conf /home/vm-co-vitor/backups-teste/vsftpd.conf.original
echo "Backup criado: /home/vm-co-vitor/backups-teste/vsftpd.conf.original"

echo ""
echo "Aplicando configurações básicas para usuários locais..."

# LIMPAR e criar NOVO arquivo de configuração
echo "# Configuração inicial" > /etc/vsftpd/vsftpd.conf
echo "" >> /etc/vsftpd/vsftpd.conf

echo "# Tirando usuários anônimos" >> /etc/vsftpd/vsftpd.conf
echo "anonymous_enable=NO" >> /etc/vsftpd/vsftpd.conf
echo "" >> /etc/vsftpd/vsftpd.conf

echo "# Possibilitando acesso a usuários locais" >> /etc/vsftpd/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "" >> /etc/vsftpd/vsftpd.conf

echo "# Permite que quem possa entrar no servidor possa realizar" >> /etc/vsftpd/vsftpd.conf
echo "# operações como criação, upload e manipulação de arquivos" >> /etc/vsftpd/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "" >> /etc/vsftpd/vsftpd.conf

echo "# O umask controla as permissões dos arquivos/diretórios criados" >> /etc/vsftpd/vsftpd.conf
echo "# 022 significa: diretórios 755 (rwxr-xr-x) e arquivos 644 (rw-r--r--)" >> /etc/vsftpd/vsftpd.conf
echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf

echo ""
echo "Configuração aplicada. Iniciando serviço..."

systemctl enable vsftpd
systemctl start vsftpd
