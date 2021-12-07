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
desc="Run PATCH_APPEND_BASELII_ADJ.sas"

 $swcode $swuser -c "cd /sasprog/sasjoblog; $exesas /sasprog/${lev}/upon_request/PATCH_APPEND_BASELII_ADJ.sas"

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
desc="Delete posted Basel II Adjustment files"

 rm -f /saswork/work/BASEL_II_adjustment/TEMP/*
 
rcode=$?
logrc
}


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=PATCH_APPEND_BASELII_ADJ
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
exit $rcode

#end of script
