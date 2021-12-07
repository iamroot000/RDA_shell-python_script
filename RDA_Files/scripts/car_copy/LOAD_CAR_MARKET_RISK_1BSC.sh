#!/bin/sh
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 
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
 if [ -f S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt ]
 then
 rm S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt
 echo   "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt deleted "
 else
 echo  "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt does not exist"
 fi
 if [ -f U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt ]
 then
 rm U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt
 echo  "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt deleted"
 else
 echo   "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_1.sas"
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
 if [ -f S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2txt ]
 then
 rm S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt
 echo   "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt deleted "
 else
 echo  "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt does not exist"
 fi
 if [ -f U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt ]
 then
 rm U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt
 echo  "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt deleted"
 else
 echo   "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_2.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt ]
 then
 rm S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt
 echo   "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt deleted "
 else
 echo  "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt does not exist"
 fi
 if [ -f U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt ]
 then
 rm U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt
 echo  "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt deleted"
 else
 echo   "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_3.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt ]
 then
 rm S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt
 echo   "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt deleted "
 else
 echo  "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt does not exist"
 fi
 if [ -f U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt ]
 then
 rm U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt
 echo  "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt deleted"
 else
 echo   "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_4.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt ]
 then
 rm S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt
 echo   "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt deleted "
 else
 echo  "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt does not exist"
 fi
 if [ -f U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt ]
 then
 rm U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt
 echo  "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt deleted"
 else
 echo   "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_5.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt ]
 then
 rm S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt
 echo   "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt deleted "
 else
 echo  "S_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt does not exist"
 fi
 if [ -f U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt ]
 then
 rm U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt
 echo  "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt deleted"
 else
 echo   "U_LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BSC_IV_6.sas"
 rcode=$?
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=LOAD_CAR_MARKET_RISK_1BSC
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_LOAD_CAR_MARKET_RISK_1BSC.txt
st=S_LOAD_CAR_MARKET_RISK_1BSC.txt
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


exit $rcode

