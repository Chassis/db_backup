module DBBackup
	class Plugin < Vagrant.plugin("2")
		name "MySQL Import"

		include Vagrant::Action
		include Chassis

		action_hook(:trigger, :machine_action_destroy) do |hook|
			builder = Builder.new.tap do |b|
				b.use Builtin::Call, BackupConfirm do |env, b2|
					DBBackup.backup(env[:machine]) if env[:result]
				end
			end

			hook.prepend builder
		end

		config = Chassis::load_config

		if config['db-backup'] and config['db-backup'].has_key? 'halt'
			action_hook(:trigger, :machine_action_halt ) do |hook|
				builder = Builder.new.tap do |b|
					b.use Builtin::Call, BackupConfirm do |env, b2|
						DBBackup.backup(env[:machine]) if env[:result]
					end
				end

				hook.prepend builder
			end
		end

		if config['db-backup'] and config['db-backup'].has_key? 'suspend'
			action_hook(:trigger, :machine_action_suspend ) do |hook|
				builder = Builder.new.tap do |b|
					b.use Builtin::Call, BackupConfirm do |env, b2|
						DBBackup.backup(env[:machine]) if env[:result]
					end
				end

				hook.prepend builder
			end
		end
	end
end
