#!/bin/bash
#Load configuration
source /path/to/your/config/backup.conf

#Create a timestamp
TIMESTAMP =$(date +"%Y-%m-%d_%H-%M-%S")
 
#Create a new backup directory with the timestamp
mkdir -p "${BACKUP_DIR}/${TIMESTAMP}"
# Rsync to the local backup directory
rsys -av --delete "${SOURCE_DIR}/" "{BACKUP_DIR}/${TIMESTAMP}/" >> "${LOG_FILE}" 2>&1
# Rsync to the remote server
rsys -av --delete "${SOURCE_DIR}/" "{REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/${TIMESTAMP}/" >> "${LOG_FILE}" 2>&1

#Log complation
echo "Backup complated at ${TIMESTAMP}/" >> "${LOG_FILE}" 