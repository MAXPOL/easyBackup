#!/bin/bash

####USER BLOCK####

#Enter path on file or folder for backup:

whatCopy="/var/www" # What copy
wherePath="/" # Wehre copy. The end of the line must be /
nameArchive="_www" #Name you archev with backup
typeRecord="-cvzf" #Key record for create archive
date=`date +%d-%m-%y` #Data create backup
formatArchive=".tar.gz" #Format create archive

####SYSTEM BLOCK####

archive=$date$nameArchive$formatArchive
cd $wherePath
tar $typeRecord $archive $whatCopy

####END####
