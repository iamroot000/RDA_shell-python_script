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
 mkdir /saswork/work/DIR_LIST_$dt
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
 desc="List Server Disk Utilization details and Directory listing of BASEL data folders"

 while [ $tx -lt $max ]
 do
	 dttm="`date +'%y%m%d'`_$tx"
	 cd /saswork/work/DIR_LIST_$dt
	 mkdir DIR_LIST_$dttm
	 df -gt >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/disk_util.txt
	 ls -lR /sasdata/${lev}/CARMART >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/CARMART.txt
	 ls -lR /sasdata/${lev}/CRMS >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/CRMS.txt
	 ls -lR /sasdata/${lev}/COPY >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/COPY.txt
	 ls -lR /sasdata/${lev}/STAGING >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/STAGING.txt
	 ls -lR /sasdata/${lev}/ADMIN >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/ADMIN.txt
	 ls -lR /sasdata/${lev}/STAGING2 >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/STAGING2.txt
	 ls -lR /sasdata/${lev}/MISMART >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/MISMART.txt
	 ls -lR /sasdata/${lev}/BACKUP >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/BACKUP.txt
	 ls -lR /sasdds/${lev}/ >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/DDS.txt
	 ls -lR /sasdata/${lev}/XFILES >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/XFILES.txt
	 ls -lR /sasdata/${lev}/XFILES/ARCHIVE >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/XFILES_ARCHIVE.txt
	 ls -lR /sasdata/${lev}/Data >/saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm/DATA.txt
 
 	scp -r /saswork/work/DIR_LIST_$dt/DIR_LIST_$dttm scpid@133.100.205.213:/cygdrive/v/basel/BASEL_UTIL/
 
	sleep 600
	tx=`date +'%H%M%S'`
 done 
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
 desc="Deletion of files in /tmp directory"
 cd /saswork/work
 rm -R /saswork/work/DIR_LIST_$dt
 rcode=$?
 logrc
}


#main script

drv=/sasprog/joblog
batchname=BATCH_DIR_LIST
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
tx=`date +'%H%M%S'`
max=235000
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

exit $rcode