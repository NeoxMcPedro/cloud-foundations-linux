#!/bin/bash

# =====================================================================
# SCRIPT DE AUTOMAÇÃO DE BACKUP LOCAL
# Autor: neoxpepismo
# Objetivo: Compactar arquivos de uma pasta de origem e salvar em uma
#           pasta de destino usando nomenclatura dinâmica com data e hora.
# =====================================================================

# 1. DEFINIÇÃO DE VARIÁVEIS (Diretórios de Origem e Destino)
# Usamos variáveis para evitar a repetição de caminhos absolutos no código.
ORIGEM="/home/neoxpepismo/projeto_backup/meus_documentos"
DESTINO="/home/neoxpepismo/projeto_backup/backups"

# 2. CRIAÇÃO DO NOME DO ARQUIVO DINÂMICO
# O comando 'date' captura o tempo exato da execução.
# %Y = Ano, %m = Mês, %d = Dia, %H = Hora, %M = Minuto, %S = Segundo.
# Isso garante que um backup nunca substitua (sobrescreva) o outro.
DATA=$(date +%Y-%m-%d_%H-%M-%S)
NOME_ARQUIVO="backup_$DATA.tar.gz"

# 3. MENSAGEM DE INÍCIO
# Exibe no terminal o status atual da operação.
echo "--------------------------------------------------"
echo "Iniciando o processo de backup..."
echo "Origem dos dados: $ORIGEM"

# 4. EXECUÇÃO DA COMPACTAÇÃO (O comando principal)
# tar: utilitário de arquivamento do Linux.
# -c: cria um novo arquivo.
# -z: compacta usando o algoritmo gzip (deixa o arquivo mais leve).
# -f: define o nome do arquivo final que será gerado.
# -C: muda para o diretório de origem antes de compactar (evita salvar caminhos absolutos dentro do zip).
tar -czf "$DESTINO/$NOME_ARQUIVO" -C "$ORIGEM" .

# 5. MENSAGEM DE SUCESSO
# Confirma visualmente que o arquivo foi gerado no destino correto.
echo "Backup concluído com sucesso!"
echo "Arquivo gerado: $DESTINO/$NOME_ARQUIVO"
echo "--------------------------------------------------"
