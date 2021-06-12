#!/bin/bash

#Backup script for Linux family OS

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
sqlDump="pg_dump" #Program for create sql dump file. Example pg_dump or mysqldump
#Attention: For correct work script comment line "sqlDump" if you create not sql backup.

####SYSTEM BLOCK####

if [ -v $sqlDump ] then 
  $sqlDump $dbName > temp_$dbName.sql
fi

archive=$nameArchive$date$formatArchive
cd $wherePath
$backupProgram $typeRecord $archive temp_$dbName.sql

if [ -v $sqlDump ] then 
  rm -rf temp_$dbName.sql
fi
####END####
