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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f $ut  ]
 then
 rm $ut
 echo  $ut " deleted "
 else
 echo $ut " does not exist"
 fi
 if [ -f $st ]
 then
 rm $st
 echo $st " deleted"
 else
 echo  $st " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/prereq/SET_RUN_CONTROL_TABLE_FOR_CAR_DATES.sas"
 rcode=$?
 rrstep=""
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
 desc="Backup CAR Dates"

 cp -p /sasdata/${lev}/ADMIN/run_dates_car.sas7bdat /sasdata/${lev}/BACKUP/ADMIN/run_dates_car_eomd5.sas7bdat
 

 rcode=$?
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
 desc="Create trigger file"
 cd /sasprog/triggers
 if [ -f S_SET_RUN_CONTROL_TABLE_FOR_CAR_DATES.txt  ]
 then
 touch S_SET_RUN_CONTROL_TABLE_FOR_CAR_DATES_EOMD5_Q.txt 
 else
 echo  "S_SET_RUN_CONTROL_TABLE_FOR_CAR_DATES.txt does not exist"
 fi

 rcode=$?
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=SET_RUN_CONTROL_TABLE_FOR_CAR_DATES_EOMD5
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_SET_RUN_CONTROL_TABLE_FOR_CAR_DATES.txt
st=S_SET_RUN_CONTROL_TABLE_FOR_CAR_DATES.txt
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

#end of script
