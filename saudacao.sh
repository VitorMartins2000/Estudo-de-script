#!/bin/bash

#Script: saudacao.sh
#Autor: Vitor Martins
# Este script irá saudar o user e também irá mostrar
# a data no padrão americano (ano, mes e dia).

DATA=$(date '+%Y-%m-%d')

saudacao() {
        echo "Olá, $(whoami)"
        echo "Hoje é $DATA"
}
saudacao
