#!/bin/bash
#Load configuration
source /path/to/your/config/backup.conf

# Check if the last backup was successful
tail -n 1 "${LOG_FILE}" | grep " Backup completed" > /dev/null
 
 if [$? -ne 0 ]; then
   echo "Backup failed at $(date +"%Y-%m-%d_%H-%M-%S")" | mail -s "Backup Failed Notification" xyz@gmail.com
 fi
 