#!/bin/bash
#Load configuration
source /path/to/your/config/backup.conf

# Remove  local older than the retention period
find "${BACKUP_DIR}" -type d -mtime +${RETENTION_DAYS} -exec rm -rf {} \; >> "${LOG_FILE}" 2>&1
 
# Remove remte backups older than the retention period
  ssh ${REMOTE_USER}@${REMOTE_HOST}find "${REMOTE_DIR}" -type d -mtime +${RETENTION_DAYS} -exec rm -rf {} \; >> "${LOG_FILE}" 2>&1
 
# Log cleanup
echo " Cleanup complated at $(date +"%Y-%m-%d_%H-%M-%S")" >> "${LOG_FILE}"