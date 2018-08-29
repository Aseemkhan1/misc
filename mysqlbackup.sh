#!/bin/bash

BACK_DIR="/disk2/backup/sql/"
sudo mkdir /disk2/backup/sql/
DATE=$(date +%Y%m%d)

sudo chmod 777 -R /disk2/backup/sql/

mysqldump -h hcprodmysql1 -u opsriver_prod --single-transaction opsriver_prod -popsriver | gzip > $BACK_DIR/opsriver_prod_backup_$DATE.sql.gz


aws s3 cp $BACK_DIR/opsriver_prod_backup_$DATE.sql.gz s3://opsriver-logs/mysqldump/`hostname`/$DATE/

sudo rm -rf $BACK_DIR

