#!/usr/bin/env bash
#fail on error
set -e
####################################
# NOTE:
# grep and locate 'error' if there is no match...ugh. so i got to do '|| true' for those
####################################

type="$1"
operation="$2"
searchString="$3"
optGrepString="$4"

if [ "$type" == "f" ]
then
    fileTypeName="file"
elif [ "$type" == "d" ]
then
    fileTypeName="dir"
else
    echo "illegal type '$type' passed to hgloballocate" 1>&2
    exit -1
fi

PS3="Choose a ${fileTypeName}: "

excludelist="usr|bk|\.bak|backups.+|\.git|\.java|\.svn"

#locate will give a failure code if it finds nothing..wtf
#doesn't work on mac osx...filelist=$(locate --basename $(basename $searchString) || true);

#WAS DEVELOPED ORIGINALLY ON LINUX, BUT WILL COMMENT OUT SUPPORT FOR NON MACS FOR NOW.
#if [ ! -n "$ON_MAC" ]
#then
#filelist=$(mdFind -name $(basename $searchString) || true);
#else
##doesn't work on mac osx...
filelist=$(locate --basename $(basename $searchString) || true);
#fi

#i want search string to be either at front or end of filename
filelist=$(echo "$filelist" | egrep "${searchString}$|^${searchString}" || true)
filelist=$(echo "$filelist" | egrep -v "$excludelist" || true)
if [ "$H_EXCLUDE" != "" ]
then
    filelist=$(echo "$filelist" | egrep -v "$H_EXCLUDE" || true)
fi

#they can supply a second arg and i will make sure that is in the path of the answers

if [ "${optGrepString}" != "" ]
then
    filelist=$(echo "$filelist" | egrep "${optGrepString}")
fi

filteredfilelist=""
#lets also filter out any files which aren't of the correct file type!
for file in $(echo $filelist)
do
    if [ "$type" == "d" ]
    then
	#make sure it's a directory!
	if [ -d "$file" ]
	then
	    filteredfilelist=$(echo $file $filteredfilelist)
	fi
    fi

    if [ "$type" == "f" ]
    then
	#make sure it's a directory!
	if [ -f "$file" ]
	then
	    filteredfilelist=$(echo $file $filteredfilelist)
	fi
    fi
done

#echo "unfiltered file list is: $filelist" 1>&2
#echo "filtered file list is: $filteredfilelist" 1>&2
filelist=$filteredfilelist

wcoutput=$(echo "$filelist" | wc -w | tr -d " ")

if [ "$wcoutput" == "1" ]
then
     #echo "hcd.f: just 1 match; will cd to '$filelist'" 1>&2
    echo "$operation $filelist"
    exit
fi

if [ "$wcoutput" == "0" ]
then
    #no matches. 
    echo "0 Matches Found" 1>&2
    exit
fi

select opt in $filelist quit
do
        if [[ $opt = "quit" ]]
        then
            break
        fi
        echo "$operation $opt"
	break
done






