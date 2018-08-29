#!/bin/bash

readonly S3BUCKET=s3://xxxxxxxx/
readonly ROOT_PROVISIONING_DIR=/opt/provisioning
readonly GITLAB_S3_BACKUP_DIR="$ROOT_PROVISIONING_DIR/gitlab-backups"
readonly GITLAB_DOCKER_BACKUP_DIR="/opt/docker/gitlab/backups/"

sudo rsync -avzh --delete-before $GITLAB_DOCKER_BACKUP_DIR $GITLAB_S3_BACKUP_DIR

sudo s3cmd sync --delete-removed $ROOT_PROVISIONING_DIR/ $S3BUCKET
