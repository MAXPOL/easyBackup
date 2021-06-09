#!/bin/bash

####USER BLOCK####

#Enter path on file or folder for backup:
dbName="test" #Name you data base in system. If you want to backup database.
whatCopy="/var/www" # What copy
wherePath="/mount/hdd_storage/backup/1C/" # Wehre copy. The end of the line must be /
backupProgram="7za" #Chooice program for create archive with backup files. Example: 7za or tar.
nameArchive="1C_SQL_backup_" #Name you archev with backup
typeRecord="a" #Key record for create archive
date=`date +%d-%m-%y` #Data create backup
formatArchive=".7z" #Format create archive

####SYSTEM BLOCK####

archive=$nameArchive$date$formatArchive
cd $wherePath
pg_dump $dbName > temp_$dbName.sql
$backupProgram $typeRecord $archive temp_$dbName.sql
rm -rf temp_$dbName.sql

####END####
