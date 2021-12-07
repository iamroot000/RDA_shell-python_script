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
 desc="ZIP /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314/mis_fct_final.sas7bdat to /sasdata/${lev}/Data/BACKUP"
 cd /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314
 gzip -c /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314/mis_fct_final.sas7bdat > /sasdata/${lev}/Data/BACKUP/mis_fct_final.sas7bdat.gz
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
 desc="Delete /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314/mis_fct_final.sas7bdat table"
 rm /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314/mis_fct_final.sas7bdat
 rrstep=""
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
 desc="Move /sasdata/${lev}/Data/BACKUP/mis_fct_final.sas7bdat.gz to /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314"
 mv /sasdata/${lev}/Data/BACKUP/mis_fct_final.sas7bdat.gz /sasdata/${lev}/BACKUP/MIS_FCT_FNAL_0314
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
batchname=ZIP_MIS_BACKUP
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
step02
step03

exit $rcode