module DBBackup
	class Plugin < Vagrant.plugin("2")
		name "MySQL Import"

		include Vagrant::Action

		action_hook(:trigger, :machine_action_destroy) do |hook|
			builder = Builder.new.tap do |b|
				b.use Builtin::Call, BackupConfirm do |env, b2|
					DBBackup.backup(env[:machine]) if env[:result]
				end
			end

			hook.prepend builder
		end

		action_hook(:trigger, :machine_action_halt ) do |hook|
			builder = Builder.new.tap do |b|
				b.use Builtin::Call, BackupConfirm do |env, b2|
					DBBackup.backup(env[:machine]) if env[:result]
				end
			end

			hook.prepend builder
		end
	end
end
