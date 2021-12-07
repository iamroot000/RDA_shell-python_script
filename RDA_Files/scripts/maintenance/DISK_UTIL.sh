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
 mkdir /tmp/util_$dt
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
 desc="List Server Disk Utilization details and copy BASEL Table logs"

 df -gt >/tmp/util_$dt/disk_util.txt
 cp -p /sas9/SASCreditRiskManagement/4.2/groups/main/master/logs/job_log.sas7bdat /tmp/util_$dt
 cp -p /sasdata/${lev}/ADMIN/admin_table_log.sas7bdat /tmp/util_$dt

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
 ls -lR /sasdata/${lev}/CARMART >/tmp/util_$dt/CARMART.txt
 ls -lR /sasdata/${lev}/CRMS >/tmp/util_$dt/CRMS.txt
 ls -lR /sasdata/${lev}/COPY >/tmp/util_$dt/COPY.txt
 ls -lR /sasdata/${lev}/STAGING >/tmp/util_$dt/STAGING.txt
 ls -lR /sasdata/${lev}/ADMIN >/tmp/util_$dt/ADMIN.txt
 ls -lR /sasdata/${lev}/STAGING2 >/tmp/util_$dt/STAGING2.txt
 ls -lR /sasdata/${lev}/MISMART >/tmp/util_$dt/MISMART.txt
 ls -lR /sasdata/${lev}/BACKUP >/tmp/util_$dt/BACKUP.txt
 ls -lR /sasdds/${lev}/ >/tmp/util_$dt/DDS.txt
 ls -lR /sasdata/${lev}/XFILES >/tmp/util_$dt/XFILES.txt
 ls -lR /sasdata/${lev}/XFILES/ARCHIVE >/tmp/util_$dt/XFILES_ARCHIVE.txt
 ls -lR /sasdata/${lev}/Data >/tmp/util_$dt/DATA.txt
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
 desc="Stageout of generated text files and SAS Table logs"
 scp -r /tmp/util_$dt scpid@133.100.205.213:/cygdrive/v/basel/BASEL_UTIL/
 rcode=$?
 logrc
}


function step05
{
 step=step05
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Deletion of files in /tmp directory"
 rm -R /tmp/util_$dt
 rcode=$?
 logrc
}


#main script

drv=/sasprog/joblog
batchname=DISK_UTIL
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

exit $rcode