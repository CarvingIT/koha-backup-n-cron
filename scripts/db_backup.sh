#!/usr/bin/bash

source /root/scripts/.back-up-config.sh
d=`date +%Y-%m-%d_%H-%M`

for database in "${databases[@]}"
do
    echo $database
    mysqldump $database > $backup_dir/$database-$d.sql
    gzip $backup_dir/$database-$d.sql 
done

find $backup_dir -mtime +15 -exec rm {} \;

