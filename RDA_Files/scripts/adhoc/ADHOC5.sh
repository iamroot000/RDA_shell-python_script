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
 dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`

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
desc="Delete log files from OLAPServer"

cd /saslogs/OLAPServer
find . -mtime +90 -type f -exec rm -f \{\} \;

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
desc="Delete log files from ShareServer"

cd /saslogs/ShareServer
find . -mtime +90 -type f -exec rm -f \{\} \;

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
desc="Delete log files from WorkspaceServer"

cd /saslogs/WorkspaceServer
find . -mtime +90 -type f -exec rm -f \{\} \;

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
desc="Delete backup files from BACKUP COPY"

cd /sasdata/${lev}/BACKUP/COPY
find . -mtime +90 -type f -exec rm -f \{\} \;

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
desc="Zip files from /sas9"

cd /sas9/SAS913/install/admin/backups
gzip *

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
desc="Delete ADHOC5"

 cd /sasprog/scripts/adhoc
 rm ADHOC5.sh

rcode=$?
logrc
}


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=ADHOC5
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
dt=`date +'%y%m%d'`
rrstep=""
bpsw=0
ut=U_ADHOC5.txt
st=S_ADHOC5.txt
if [ "$1" != "" ] && [ "$1" != "step00" ]
then
   echo Job Restarted at $1 $dtx >> $drv/$batchname".log"
   rrstep=$1
else
   echo Job Started $dtx > $drv/$batchname".log"
   rrstep=""
fi

step00
#step01
#step02
#step03
step04
step05
step06

exit $rcode

#end of script


