module DBBackup
	module Errors
		class CommandFailed < Vagrant::Errors::VagrantError
			error_namespace("chassis.dbbackup")
			error_message("Backup command failed")
		end
	end
end
