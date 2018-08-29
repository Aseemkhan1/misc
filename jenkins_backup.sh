#!/bin/bash -xe

readonly BACKUP_DIRECTORY_NAME="/opt/provisioning/jenkins-backups"

exec &>> $BACKUP_DIRECTORY_NAME/logs/backup_`date +%Y%m%d%H%M`.log

readonly JENKINS_HOME="/opt/docker/jenkins"
readonly FILE_NAME=backup_`date +"%Y%m%d%H%M"`.tar.gz
readonly DEST_FILE="$BACKUP_DIRECTORY_NAME/$FILE_NAME"
readonly REMOVE_BACKUPS_OLDER_THAN=7

cd $JENKINS_HOME

sudo tar -zcvf $DEST_FILE * -X $BACKUP_DIRECTORY_NAME/bin/backupignore.txt

sudo find $BACKUP_DIRECTORY_NAME/backup_* -mtime +$REMOVE_BACKUPS_OLDER_THAN -delete

sudo find $BACKUP_DIRECTORY_NAME/logs/backup_* -mtime +$REMOVE_BACKUPS_OLDER_THAN -delete
