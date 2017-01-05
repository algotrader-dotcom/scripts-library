#!/bin/bash

USER="root"
PASSWORD="root"
OUTPUT="/root/backup"
DATE=$(date +%d-%m-%Y_%H-%M-%S)
MBD="$OUTPUT/$DATE"

find $OUTPUT -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;

[ ! -d $MBD ] && mkdir -p $MBD || :

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]]; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $db |gzip > $MBD/$db.gz
    fi
done
