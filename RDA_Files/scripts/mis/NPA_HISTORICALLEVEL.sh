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
 desc="Call NPA_HISTORICALLEVEL"
 cd /sasprog/triggers
 if [ -f S_NPA_HISTORICALLEVEL.txt ]
 then
 rm S_NPA_HISTORICALLEVEL.txt
 echo   "S_NPA_HISTORICALLEVEL.txt deleted "
 else
 echo  "S_NPA_HISTORICALLEVEL.txt does not exist"
 fi
 if [ -f U_NPA_HISTORICALLEVEL.txt ]
 then
 rm U_NPA_HISTORICALLEVEL.txt
 echo  "U_NPA_HISTORICALLEVEL.txt deleted"
 else
 echo   "U_NPA_HISTORICALLEVEL.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/mis/NPA_HISTORICALLEVEL.sas"
 rcode=$?
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=NPA_HISTORICALLEVEL
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_NPA_HISTORICALLEVEL.txt
st=S_NPA_HISTORICALLEVEL.txt
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

