#!/bin/bash
set -e

DATABASE=$1
mysqldump $DATABASE > /vagrant/chassis-backup.sql

echo "Backup saved to chassis-backup.sql"
