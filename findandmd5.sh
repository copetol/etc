#!/bin/bash


# scan $1 and $2 directories recursivelly for ordinary files, calculate their md5 sums, output filenames with the same md5 sums

ALLFN=md5sums.all
SAMEFN=md5sums.same

(find $1 -type f -print0 ;find $2 -type f -print0 ) | xargs -0  md5sum | sort | tee $ALLFN | awk '{print $1}' | uniq -d > $SAMEFN
grep -F -f $SAMEFN $ALLFN