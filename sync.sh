#!/bin/bash

# $1 = Local Directory
# $2 = S3 Bucket (don"t include s3://)
# $3 = AWS Profile Name

# Watch local dir
fswatch -d $1 |
while read -r directory ; do
  # Syncs from S3 to local directory (Pull)
  AWS_PROFILE=$3 aws s3 sync s3://$2 $1 --exclude "*.DS_Store" --exclude ".git/*" --exclude ".obsidian/*"
  
  # Syncs local directory to S3 (Push)
  AWS_PROFILE=$3 aws s3 sync $1 s3://$2 --exclude "*.DS_Store" --exclude ".git/*" --exclude ".obsidian/*"
done
