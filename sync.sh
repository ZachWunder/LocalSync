#!/bin/bash

# $1 = Local Directory 
# $2 = S3 Bucket (don't include s3://)

# Watch local dir
inotifywait -e close_write,moved_to,create -m $1 |
while read -r directory ; do
  # Syncs from S3 to local directory (Pull)
  AWS_PROFILE=personalsync aws s3 sync s3://$2 $1

  # Syncs local directory to S3 (Push)
  AWS_PROFILE=personalsync aws s3 sync $1 s3://$2 --exclude '.DS_STORE' --exclude '.git' --exclude '.obsidian'
done

