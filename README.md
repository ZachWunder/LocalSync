# Sync Folder to S3
This script will sync a local folder to S3 when anything in the directory is changed. It will first sync from S3 to the local folder (pull), then sync from the local folder to S3 (push).

## Prerequisites:
1. Install fswatch
  - `brew install fswatch` on mac
  - `sudo apt-get install fswatch -y` on ubuntu
2. Install AWS CLI
3. An S3 bucket
4. Local AWS profile with access to the S3 bucket. [Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

## Install
1. Clone sync.sh
2. Create cron rule 
  - `@reboot /path/to/sync.sh /path/to/local/folder s3BucketName awsProfileName &`
 
## Start Manually
`./sync.sh /path/to/local/folder s3BucketName awsProfileName &`

## Built with
1. [fswatch](https://github.com/emcrisostomo/fswatch)
2. [AWS CLI](https://github.com/aws/aws-cli)

## Answers
**Deleting a file locally doesn't work.**
S3 is the source of truth. If you delete a file locally, that file will be immediately downloaded from S3. To permanently delete a file, delete it in S3.

**Some files aren't syncing.**
.git, .DS_Store, and .obsidian files are excluded by default. Add / remove these with `--exclude` in the script.
