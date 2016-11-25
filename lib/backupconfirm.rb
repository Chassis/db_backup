module DBBackup
	class BackupConfirm < Confirm
		def initialize(app, env)
			force_key = :backup_before_destroy_confirm
			message = "Do you want to backup the database before destroying? [Y/n] "
			super(app, env, message, force_key, allowed: ["y", "n", "Y", "N"])
		end
	end
end
