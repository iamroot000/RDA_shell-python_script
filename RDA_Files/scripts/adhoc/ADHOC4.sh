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

 dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
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
 desc="Create backup folders for CAR_STAGING and CAR_LV"

 mkdir /sasdata/${lev}/BACKUP/CAR_STAGING/CAR_STAGING_20180406
 mkdir /sasdata/${lev}/BACKUP/CAR_LV/CAR_LV_20180406


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
 desc="Copy/backup CAR_STAGING tables"

 cd /sasdata/${lev}/CARMART/CAR_STAGING
 for i in `ls -ctr`
 do
   flg=`grep -c "$i" $bkup1`
   if [ $flg != 0 ]
     then cp -p $i /sasdata/${lev}/BACKUP/CAR_STAGING/CAR_STAGING_20180406
   fi
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
 desc="Copy/backup CAR_LV tables"

 cd /sasdata/${lev}/CARMART/CAR_LV
 for i in `ls -ctr`
 do
   flg=`grep -c "$i" $bkup2`
   if [ $flg != 0 ]
     then cp -p $i /sasdata/${lev}/BACKUP/CAR_LV/CAR_LV_20180406
   fi
 done

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
 desc="Update run_dates_car"

 $swcode $swuser -c "${dirlog} $exesas /saswork/work/update_rundate.sas"

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
desc="Delete ADHOC"

 rm /sasprog/scripts/adhoc/ADHOC4.sh

rcode=$?
logrc
}

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
bkup1=/saswork/work/CREATE_BACKUP_CAR_STAGING.txt
bkup2=/saswork/work/CREATE_BACKUP_CAR_LV.txt
batchname=ADHOC4
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
step04
step05

exit $rcode

