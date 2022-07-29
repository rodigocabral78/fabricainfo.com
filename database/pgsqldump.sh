#!/usr/bin/env bash

# docker-compose down --rmi local --volumes --remove-orphans
# docker-compose down --rmi all --volumes --remove-orphans

# set -xv
targetDir=$(pwd)
targetDir=./initial_data
day=`date +%Y%m%d`

mkdir -p ${targetDir}

# Delete old files?
# deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec ls -l {} \;`
deleteOldfiles=`find ${targetDir} -type f -mtime +60 -exec rm -rf {} \;`
echo $deleteOldfiles
# rm -rf ${targetDir}/* 2>&1

export $(egrep -v '^#' .env | xargs)

host=${HOSTNAME}
# host=docker
port=5432
db=${POSTGRES_DB}
user=${POSTGRES_USER}
password=${POSTGRES_PASSWORD}
url="postgresql://${user}:${password}@${host}:${port}/${db}?serverVersion=14&charset=utf8"
echo ${url}

echo
echo Backup Data: ${db}-${host}-99-data.sql
# PGPASSWORD=${password} pg_dump  --verbose --host=${host} --port=${port} --username=${user} --encoding=UTF8 --format=plain --enable-row-security --serializable-deferrable --strict-names --dbname=${db} --role=${db} --data-only --on-conflict-do-nothing --inserts --column-inserts --file=${targetDir}/${day}-${db}-${host}-99-data.sql
PGPASSWORD=${password} pg_dump  --verbose --host=${host} --port=${port} --username=${user} --encoding=UTF8 --format=plain --enable-row-security --serializable-deferrable --strict-names --dbname=${db} --data-only --on-conflict-do-nothing --inserts --column-inserts --file=${targetDir}/${day}-${db}-${host}-99-data.sql

echo
echo Backup Structure: ${db}-${host}-00-structure.sql
# PGPASSWORD=${password} pg_dump  --verbose --host=${host} --port=${port} --username=${user} --encoding=UTF8 --format=plain --enable-row-security --serializable-deferrable --strict-names --dbname=${db} --role=${db} --schema-only --blobs --clean --create --if-exists --file=${targetDir}/${day}-${db}-${host}-00-structure.sql
PGPASSWORD=${password} pg_dump  --verbose --host=${host} --port=${port} --username=${user} --encoding=UTF8 --format=plain --enable-row-security --serializable-deferrable --strict-names --dbname=${db} --schema-only --blobs --clean --create --if-exists --file=${targetDir}/${day}-${db}-${host}-00-structure.sql

PGPASSWORD=${password} psql --host=${host} --port=${port} --username=${user} --dbname=${db} --echo-all --command='VACUUM FULL VERBOSE ANALYZE;'
# set +xv

# exit 0
