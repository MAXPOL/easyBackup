#!/bin/bash

#Backup script for Linux family OS

####USER PART####

#dbNameIN="--all-databases" #Name you database in system or parameters export. If you want to backup database.
#dbNameOUT="all-databases" #Name you databases export .sql
#sqlDump="mysqldump" #Program for create sql dump file. Example pg_dump or mysqldump
#Attention: For correct work script comment line "dbName" and "sqlDump" if you create not sql backup.
#Attention: For correct work script uncomment line "dbName" and "sqlDump" if you create sql backup.

whatCopy="/var/www" # What copy. Commetn if use backup database

wherePath="/backup/" # Wehre copy. The end of the line must be /
backupProgram="tar" #Chooice program for create archive with backup files. Example: 7za or tar.
nameArchive="_bppkInfoAllDatabases" #Name you archev with backup
typeRecord="-cvzf" #Key record for create archive Example: for 7za key = a or for tar key = -cvzf
date=`date +%d-%m-%y` #Data create backup
formatArchive=".tar.gz" #Format create archive Example: for 7za key = .7za or for tar ket = .tar.gz

####SYSTEM PART####

cd $wherePath

if [[ $sqlDump && $dbNameIN && $dbNameOUT ]] 
then 
 $sqlDump $dbNameIN > $dbNameOUT.sql
 archive=$date$nameArchive$formatArchive
 $backupProgram $typeRecord $archive $dbNameOUT.sql
 rm -rf $dbNameOUT.sql
fi

if [[ $whatCopy ]]
then
 archive=$date$nameArchive$formatArchive
 $backupProgram $typeRecord $archive $whatCopy
fi

####END####
