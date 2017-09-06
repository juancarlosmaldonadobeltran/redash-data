#!/bin/bash
#
# This script creates a current Redash dashboards backup file.
#
# Prerequisites: must be executed from current backup instance in order to create a backup file from its dashboards database.
#
# References:
# https://redash.io/help-onpremise/misc/backup-your-redash-database-and-restore-it-on-a-different-server.html

create_redash_backup_file() {
	sudo -u redash pg_dump redash | gzip > redash_backup.gz
}

create_redash_backup_file