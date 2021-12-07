#!/bin/sh
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 
function logrc
{
 if [ -f $drv/$batchname".err" ]
 then
    cat $drv/$batchname".err"|grep 0
    rcode=$?
 fi

 echo $step $rcode $dtx $bpsw $desc >> $drv/$batchname".log"

 if [ $bpsw != 1 ]
 then
   if [ $rcode -gt 1 ]
   then
     echo  >> $drv/$batchname".log"
     echo "Job Failed at "$step"." >> $drv/$batchname".log"
     echo "Recovery Procedure:" >> $drv/$batchname".log"
     if [ -f $rdrv/$batchname".rpm" ]
     then
        cat $rdrv/$batchname".rpm" >> $drv/$batchname".log"
     else
        echo "No Recovery Procedure." >> $drv/$batchname".log"
     fi
     exit $rcode
   fi
 fi
 return $rcode
}


function step00
{
 step=step00
 desc="Dummy Step"

 echo date
 rcode=$?
 logrc
}

function step01
{
 step=step01
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Cleanup OPICS Hand-off"

 mkdir /saswork/work/OPICS
 ls -lrt /sasdata/QLTYCNT > /saswork/work/OPICS/BEFORE_QLTYCNT.txt
 ls -lrt /sasdata/${lev}/COPY > /saswork/work/OPICS/BEFORE_COPY.txt
 ls -lrt /saswork/work/receive > /saswork/work/OPICS/BEFORE_SASWORK.txt

 rm -f /sasdata/QLTYCNT/*.txt
 rm -f /sasdata/QLTYCNT/dummy_*.TXT
 rm -f /sasdata/QLTYCNT/ls
 rm -f /sasdata/${lev}/COPY/*.csv
 rm -f /saswork/work/receive/*.CSV
 rm -f /saswork/work/receive/*.txt

 ls -lrt /sasdata/QLTYCNT > /saswork/work/OPICS/AFTER_QLTYCNT.txt
 ls -lrt /sasdata/${lev}/COPY > /saswork/work/OPICS/AFTER_COPY.txt
 ls -lrt /saswork/work/receive > /saswork/work/OPICS/AFTER_SASWORK.txt

 scp -r /saswork/work/OPICS scpid@133.100.205.213:/cygdrive/v/basel/BASEL_OPICS/

 rcode=$?
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=ADHOC1
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
if [ "$1" != "" ] && [ "$1" != "step00" ]
then
   echo Job Restarted at $1 $dtx >> $drv/$batchname".log"
   rrstep=$1
else
   echo Job Started $dtx > $drv/$batchname".log"
   rrstep=""
fi

step00
step01

exit $rcode

#end of script
