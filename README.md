# Database Backup Extension for Chassis

This Chassis extension backs up your database when you destroy your Vagrant box, and restores it when you recreate the machine.

Since WordPress stores all data in MySQL (except uploads, which are stored in a shared folder), this allows you to safely destroy Chassis machines when you're not using them, without losing any data.

## Installation

Clone this repository into your Chassis `extensions` directory:

```sh
$ cd extensions
$ git clone https://github.com/Chassis/db-backup
```

## Using

Simply destroy your box as usual, and answer yes when prompted to back up:

```
$ vagrant destroy
    default: Do you want to backup the database before destroying? [Y/n] y
==> default: stdin is not a tty
==> default: Backup saved to chassis-backup.sql
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Forcing shutdown of VM...
==> default: Destroying VM and associated drives...
```

**Important note:** If you do not see "Backup saved to chassis-backup.sql", your database has not been backed up. Ensure you are using a version of Chassis published after 2016-11-25.

When you recreate the machine later, your backup will be automatically restored:

```
$ vagrant up
[...]
==> default: Notice: /Stage[main]/Main/Chassis::Wp[vagrant.local]/Chassis::Site[vagrant.local]/Mysql::Db[wordpress]/Database[wordpress]/ensure: created
==> default: Notice: /Stage[main]/Main/Chassis::Wp[vagrant.local]/Chassis::Site[vagrant.local]/Mysql::Db[wordpress]/Database_user[wordpress@localhost]/ensure: created
==> default: Notice: /Stage[main]/Main/Chassis::Wp[vagrant.local]/Chassis::Site[vagrant.local]/Mysql::Db[wordpress]/Database_grant[wordpress@localhost/wordpress]/privileges: privileges changed '' to 'all'
==> default: Notice: /Stage[main]/Db-backup/Exec[wordpress-import]/returns: executed successfully
[...]
```
