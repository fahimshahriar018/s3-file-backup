date=$(date +"%Y-%m-%d %H:%M:%S")
year_dir=$(date +"%Y")
month_dir=$(date +"%m")
day_dir=$(date +"%d")
#Parent backup directory
parent_dir="/var/backup/db_backup"

#MySQL Settings
host="192.168.1.2"
mysql_user="admin"
mysql_password="1234"
db=$1

backup_dir="$parent_dir/$year_dir/$month_dir/$day_dir"
if [ ! -d $backup_dir ]; then
	echo "Creating Backup Directory"
	mkdir -p $backup_dir
fi

chmod 0777 -R $backup_dir
time=$(date +"%H%M%S")

mysqldump -v  --databases ${db} --single-transaction --host=${host} --user=${mysql_user} --password='1234' --port=3306 | gzip > ${backup_dir}/${db}_${time}.gz


