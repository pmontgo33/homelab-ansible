#!/bin/sh

echo "================================================="
echo "Running Scheduled Backup ($(date '+%m/%d/%Y %H:%M:%S'))"
echo "================================================="
echo "-"

echo "STARTING rsync server01 backup to latest folder on external..."
rsync -avhqr --delete --delete-excluded --log-file=/mnt/external/backups/logs/backup.log --files-from=backup_include.dat --exclude-from=backup_exclude.dat / /mnt/external/backups/latest/server01

echo "rsync server01 backup to latest folder COMPLETE!"
echo "-"

echo "STARTING rsync server02 backup to latest folder..."
rsync -avhq --delete --delete-excluded --log-file=/mnt/external/backups/logs/server_secondary.log pi@192.168.86.102:/opt/server_secondary/ /mnt/external/backups/latest/server02

echo "rsync from server02 COMPLETE"
echo "-"

echo "STARTING restic backup to external repo..."
sudo restic --password-file /mnt/external/backups/server_restic/.secret -r /mnt/external/backups/server_restic backup --tag SCRIPT --files-from /home/pi/backup_script/restic_include.dat --exclude-file /home/pi/backup_script/restic_exclude.dat

echo "restic server backup to repo COMPLETE!"
echo "-"

echo "STARTING restic snapshot prune..."
sudo restic forget --password-file /mnt/external/backups/server_restic/.secret -r /mnt/external/backups/server_restic --verbose --prune --keep-daily 7 --keep-weekly 4 --keep-monthly 3

echo "restic snapshot prune COMPLETE"
echo "-"

echo "STARTING rclone backup to cloud..."
sudo docker compose -f /opt/server/docker-compose.yml exec rclone rclone sync /external/backups/server_restic gdrive:Backups/server --exclude-from /backup_script/cloud_backup_exclude.dat

echo "rclone backup to cloud COMPLETE!"
echo "-"

dt=$(date '+%m/%d/%Y %H:%M:%S');
sudo echo $dt > /mnt/external/scripts/backups/last_backup.log

echo "================================================="
echo "Scheduled Backup is Complete ($(date '+%m/%d/%Y %H:%M:%S'))"
echo "================================================="