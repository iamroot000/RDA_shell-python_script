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
 desc="Call 01_POPULATE_STG2_APPLICATION_SCORE job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_APPLICATION_SCORE.txt  ]
 then
 rm S_01_POPULATE_STG2_APPLICATION_SCORE.txt
 echo   "S_01_POPULATE_STG2_APPLICATION_SCORE.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_APPLICATION_SCORE.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_APPLICATION_SCORE.txt ]
 then
 rm U_01_POPULATE_STG2_APPLICATION_SCORE.txt
 echo  "U_01_POPULATE_STG2_APPLICATION_SCORE.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_APPLICATION_SCORE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_APPLICATION_SCORE.sas"
 rcode=$?
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_STG2_APPLICATION_SCORE_PREALFES
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_01_POPULATE_STG2_APPLICATION_SCORE.txt
st=S_01_POPULATE_STG2_APPLICATION_SCORE.txt
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

exit $rcode