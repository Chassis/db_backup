# Create our backup class.
class db_backup (
	$file,
	$prefix,
	$wpdir
) {
	exec { "${name}-import":
		command     => "/usr/bin/mysql ${name} < ${file}",
		logoutput   => true,
		environment => "HOME=${::root_home}",
		onlyif      => "/usr/bin/test -f ${file}",
		unless      => "/usr/bin/mysql -e 'DESCRIBE ${prefix}posts' ${name} > /dev/null",
		require     => Mysql::Db[$name],
		before      => Wp::Site[$wpdir]
	}
}
