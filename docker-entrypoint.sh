#!/bin/bash

newbase=$1 # a base nova
sql_file=$2
db_user="postgres"
db_name="postgres" # usando a base do sistema para executar comandos administrativos

# Instala o extension unnaccent
psql -h localhost -U $db_user -c "CREATE EXTENSION unaccent"

# Recria a base e depois roda o dump nela
psql -h localhost -U $db_user -d $db_name -c "DROP DATABASE $newbase"
psql -U $db_user -d $db_name -c "CREATE DATABASE $newbase"
psql -d $newbase -U $db_user -f $sql_file

#echo "Removendo o arquivo $sql_file"
#rm $sql_file
