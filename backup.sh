#!/bin/bash

#Backup script for Linux family OS

####USER PART####

#dbName="test" #Name you data base in system. If you want to backup database.
#sqlDump="pg_dump" #Program for create sql dump file. Example pg_dump or mysqldump
#Attention: For correct work script comment line "dbName" and "sqlDump" if you create not sql backup.
#Attention: For correct work script uncomment line "dbName" and "sqlDump" if you create sql backup.

whatCopy="/var/www" # What copy

wherePath="/" # Wehre copy. The end of the line must be /
backupProgram="tar" #Chooice program for create archive with backup files. Example: 7za or tar.
nameArchive="_www" #Name you archev with backup
typeRecord="-cvzf" #Key record for create archive Example: for 7za key = a or for tar key = -cvzf
date=`date +%d-%m-%y` #Data create backup
formatArchive=".7z" #Format create archive Example: for 7za key = .7za or for tar ket = .tar.gz

####SYSTEM PART####
cd $wherePath

if [ -v $sqlDump && -v $dbName] 
then 
 $sqlDump $dbName > $dbName.sql
 archive=$date$nameArchive$formatArchive
 $backupProgram $typeRecord $archive $dbName.sql
 rm -rf $dbName.sql
else 
 archive=$date$nameArchive$formatArchive
 $backupProgram $typeRecord $archive $whatCopy
fi

####END####
