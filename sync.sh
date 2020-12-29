#!/bin/bash

# Syncs from S3 to local directory (Pull)
AWS_PROFILE=personalsync aws s3 sync s3://thebrain /path/to/local

# Syncs local directory to S3 (Push)
AWS_PROFILE=personalsync aws s3 sync /path/to/local s3://thebrain --exclude '.DS_STORE' --exclude '.git' --exclude '.obsidian'
