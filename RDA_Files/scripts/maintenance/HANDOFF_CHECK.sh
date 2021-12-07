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
 desc="Creation of folder"

 if [ -d /saswork/work/BASEL_HANDOFF_CHECK_$dt ]
 then
     rm -R /saswork/work/BASEL_HANDOFF_CHECK_$dt
 fi

 mkdir /saswork/work/BASEL_HANDOFF_CHECK_$dt

 rcode=$?
 logrc
}


function step02
{
 step=step02
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="List Server Disk Utilization details"

 df -gt > /saswork/work/BASEL_HANDOFF_CHECK_$dt/disk_util.txt

 rcode=$?
 logrc
}


function step03
{
 step=step03
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Directory listing of BASEL data folders"

 ls -lR /sasdata/${lev}/COPY > /saswork/work/BASEL_HANDOFF_CHECK_$dt/COPY.txt
 ls -lR /sasdata/${lev}/XFILES > /saswork/work/BASEL_HANDOFF_CHECK_$dt/XFILES.txt
 ls -lR /sasdata/QLTYCNT > /saswork/work/BASEL_HANDOFF_CHECK_$dt/QLTY.txt

 rcode=$?
 logrc
}


function step04
{
 step=step04

 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Count of Hand-off files from ALFES and PMS from /sasdata/${lev}/COPY"

 echo "/sasdata/${lev}/COPY\n" > /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 echo "PMS Hand-off count: " >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 cd /saswork/work/BASEL_HANDOFF_CHECK_$dt
 grep -i txt COPY.txt | grep -v .gz | grep -i txn | wc -l >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 echo "\nALFES Hand-off count: " >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 grep -E "COPY_ASSETYPE.TXT|COPY_CR_|COPY_DEALER.TXT|COPY_LEA_|COPY_LOS_APP_|COPY_MAKE.TXT|COPY_MANUF.TXT|COPY_MODEL.TXT|COPY_NBFC_" COPY.txt | grep -i txt | grep -v .gz | grep -vi txn | wc -l >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt

 rcode=$?
 logrc
}


function step05
{
 step=step05
 ctr1=0
 sum=0
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Count of Hand-off files from ALFES and PMS from /sasdata/QLTYCNT"
 
 echo "\n/sasdata/QLTYCNT\n" >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 echo "PMS Hand-off count: " >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 cd /saswork/work/BASEL_HANDOFF_CHECK_$dt
 grep -i txt QLTY.txt | grep -v .gz | grep -i txn | wc -l >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 echo "\nALFES Hand-off count: " >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt
 grep -E "ASSETYPE.TXT|CR_|DEALER.TXT|LEA_|LOS_APP_|MAKE.TXT|MANUF.TXT|MODEL.TXT|NBFC_" QLTY.txt | grep -i txt | grep -v .gz | grep -vi txn | wc -l >> /saswork/work/BASEL_HANDOFF_CHECK_$dt/BASEL_HANDOFF_CHECK.txt 
 rcode=$?
 logrc
}


function step06
{
 step=step06
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Stageout of generated text files and SAS Table logs"

 scp -r /saswork/work/BASEL_HANDOFF_CHECK_* scpid@133.100.205.213:/cygdrive/v/basel/

 rcode=$?
 logrc
}


function step07
{
 step=step07
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Deletion of files in /tmp directory"

 cd /saswork/work
 rm -R /saswork/work/BASEL_HANDOFF_CHECK_$dt
 rcode=$?
 logrc
}


#main script

drv=/sasprog/joblog
batchname=HANDOFF_CHECK
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
dt=`date +'%y%m%d'`
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
step02
step03
step04
step05
step06
step07

exit $rcode