$dbbackup_config = sz_load_config()

class {"db_backup":
	file   => "/vagrant/chassis-backup.sql",
	name   => $dbbackup_config[database][name],
	prefix => $dbbackup_config[database][prefix],
	wpdir  => $dbbackup_config[mapped_paths][wp],
}
