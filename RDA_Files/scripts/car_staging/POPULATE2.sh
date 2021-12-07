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
 if [ -f S_POPULATE_STG_CAR_P_III_2_1BPI.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_2_1BPI.txt
 echo   "S_POPULATE_STG_CAR_P_III_2_1BPI.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_2_1BPI.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_2_1BPI.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_2_1BPI.txt
 echo  "U_POPULATE_STG_CAR_P_III_2_1BPI.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_2_1BPI.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_2_1BPI.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt
 echo   "S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt
 echo  "U_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.sas"
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
 desc="Create multiple trigger file"
 cd /sasprog/triggers

 if [ -f S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt   ]
 then
 touch S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS_DD2.txt 
rm S_POPULATE_STG_CAR_P_III_2_FOREIGN_SUBS.txt
fi
 rcode=$?
 rrstep=""
 logrc
 }


#main script
drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE2
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

