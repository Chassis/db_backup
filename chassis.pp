$dbbackup_config = sz_load_config()

class {"db-backup":
	file  => "/vagrant/chassis-backup.sql",
	name  => $dbbackup_config[database][name],
	wpdir => $dbbackup_config[mapped_paths][wp],
}
