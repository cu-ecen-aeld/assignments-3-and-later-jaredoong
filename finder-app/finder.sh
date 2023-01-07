#!/bin/sh
if [ $# -ne 2 ] 
then
    echo "ERROR: Invalid number of arguments provided!"
    exit 1
fi
filesdir=$1
searchstr=$2

if [ -d $filesdir ]
then
    numfiles=$( ls -1 $filesdir | wc -l ) 
    numlines=$( grep -r $searchstr $filesdir | wc -l )
    echo "The number of files are $numfiles and the number of matching lines are $numlines"
    exit 0
else
    echo "$filesdir is not a directory!"
    exit 1
fi
