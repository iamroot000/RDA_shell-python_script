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
     cd /sasprog/triggers
     touch $ut
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
 if [ -f S_RESTORE_CHECK_BUILD_SCORING_ABT.txt ]
 then
 rm S_RESTORE_CHECK_BUILD_SCORING_ABT.txt
 echo   "S_RESTORE_CHECK_BUILD_SCORING_ABT.txt deleted "
 else
 echo  "S_RESTORE_CHECK_BUILD_SCORING_ABT.txt does not exist"
 fi
 if [ -f U_RESTORE_CHECK_BUILD_SCORING_ABT.txt ]
 then
 rm U_RESTORE_CHECK_BUILD_SCORING_ABT.txt
 echo  "U_RESTORE_CHECK_BUILD_SCORING_ABT.txt deleted"
 else
 echo   "U_RESTORE_CHECK_BUILD_SCORING_ABT.txt does not exist"
 fi
 if [ -f S_RESTORE_APPLICATION_SCORE.txt ]
 then
 rm S_RESTORE_APPLICATION_SCORE.txt
 echo   "S_RESTORE_APPLICATION_SCORE.txt deleted "
 else
 echo  "S_RESTORE_APPLICATION_SCORE.txt does not exist"
 fi
 if [ -f U_RESTORE_APPLICATION_SCORE.txt ]
 then
 rm U_RESTORE_APPLICATION_SCORE.txt
 echo  "U_RESTORE_APPLICATION_SCORE.txt deleted"
 else
 echo   "U_RESTORE_APPLICATION_SCORE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/recovery/RESTORE_APPLICATION_SCORE.sas"
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
 if [ -f RESTORE_CUSTOMER_ACCOUNT_SCORE.txt ]
 then
 rm S_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt
 echo   "S_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt deleted "
 else
 echo  "S_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt does not exist"
 fi
 if [ -f U_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt ]
 then
 rm U_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt
 echo  "U_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt deleted"
 else
 echo   "U_RESTORE_CUSTOMER_ACCOUNT_SCORE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/recovery/RESTORE_CUSTOMER_ACCOUNT_SCORE.sas"
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
 if [ -f S_RESTORE_CUSTOMER_MODEL_SCORE.txt ]
 then
 rm S_RESTORE_CUSTOMER_MODEL_SCORE.txt
 echo   "S_RESTORE_CUSTOMER_MODEL_SCORE.txt deleted "
 else
 echo  "S_RESTORE_CUSTOMER_MODEL_SCORE.txt does not exist"
 fi
 if [ -f U_RESTORE_CUSTOMER_MODEL_SCORE.txt ]
 then
 rm U_RESTORE_CUSTOMER_MODEL_SCORE.txt
 echo  "U_RESTORE_CUSTOMER_MODEL_SCORE.txt deleted"
 else
 echo   "U_RESTORE_CUSTOMER_MODEL_SCORE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/recovery/RESTORE_CUSTOMER_MODEL_SCORE.sas"
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
 if [ -f S_RESTORE_WRITEBACK_BISDATA.txt ]
 then
 rm S_RESTORE_WRITEBACK_BISDATA.txt
 echo   "S_RESTORE_WRITEBACK_BISDATA.txt deleted "
 else
 echo  "S_RESTORE_WRITEBACK_BISDATA.txt does not exist"
 fi
 if [ -f U_RESTORE_WRITEBACK_BISDATA.txt ]
 then
 rm RESTORE_WRITEBACK_BISDATA.txt
 echo  "U_RESTORE_WRITEBACK_BISDATA.txt deleted"
 else
 echo   "U_RESTORE_WRITEBACK_BISDATA.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas -autoexec /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/autoexec.sas /sasprog/${lev}/recovery/RESTORE_WRITEBACK_BISDATA.sas"
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
 desc="Create trigger file"
 cd /sasprog/triggers
 touch $st
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=RESTORE_CHECK_BUILD_SCORING_ABT
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_RESTORE_CHECK_BUILD_SCORING_ABT.txt
st=S_RESTORE_CHECK_BUILD_SCORING_ABT.txt
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
