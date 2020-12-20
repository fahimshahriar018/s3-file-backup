#!/bin/bash

date=$(date +"%y-%m-%d")
month_dir=$(date +"%m")
year_dir=$(date +"%Y")
day=$(date +"%d")
bucket_name=s3://abc-bucket

backup_dir="${month_dir}-${year_dir}"
#Backup file store location
parent_dir=/var/backup/incremental/files_backup/$backup_dir/

	if [ ! -d $parent_dir ]; then
		mkdir -p parent_dir
	fi

echo "Backup Starting........"

s3cmd sync -rp --skip-existing ${bucket_name} ${parent_dir}

echo "BUCKET $bucket_name INCREMENTAL BACKUP SUCCESSFULLY COMPLETED"
