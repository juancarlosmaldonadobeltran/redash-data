#!/bin/bash
#
# This script restore the current Redash dashboards backup file.
#
# Prerequisites: Copy of the current redash_backup.gz into th new server in folder: /home/ubuntu/
#
# References:
#
# https://redash.io/help-onpremise/misc/backup-your-redash-database-and-restore-it-on-a-different-server.html

restore_redash_backup_file() {

	sudo -u postgres -i
	psql -c "ALTER ROLE postgres WITH PASSWORD 'postgres';"
	psql -c "ALTER DATABASE redash CONNECTION LIMIT 1;"
	psql -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'redash';"
	psql -c "DROP DATABASE redash;"
	createdb -T template0 redash
	gunzip -c /home/ubuntu/redash_backup.gz | psql redash
}

restore_redash_backup_file