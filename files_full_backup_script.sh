#!/bin/bash

#Parent Direcotry
date=$(date +"%y-%m-%d")
bucket_name=s3://abc-bucket

#Backup file store location
parent_dir=/var/backup/full/files_backup

#folder naming
folder_name="full_backup_$date"

#backup director = /var/backup/full/files_backup/full_backup_$date

backup_dir="${parent_dir}/${folder_name}/"

mkdir -p "${backup_dir}"

time=$(date +"%y-%m-%d-%H%M%S")

file_name="full_backup_$time.tar.gz"

echo "Backup File Name: $file_name"

echo "S3 Bucket Backup: $bucket_name"

s3cmd sync -rp ${bucket_name} ${backup_dir}

cd "${parent_dir}"

tar czvf "$file_name" ${folder_name}

echo "Removing Folder $folder_name" 

rm -rf ${folder_name}

echo "BUCKET $bucket_name FULL BACKUP SUCCESSFULLY COMPLETED"
