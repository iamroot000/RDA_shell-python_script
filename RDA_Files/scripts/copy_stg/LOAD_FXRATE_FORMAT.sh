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
 desc="Call SAS job LOAD_FXRATE_FORMAT.sas"
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
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/LOAD_FXRATE_FORMAT.sas"
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
 desc="Call SAS job LOAD_FXRATE_FORMAT_USD.sas"
 cd /sasprog/triggers
 if [ -f $ut1  ]
 then
 rm $ut1
 echo  $ut1 " deleted "
 else
 echo $ut1 " does not exist"
 fi
 if [ -f $st1 ]
 then
 rm $st1
 echo $st1 " deleted"
 else
 echo  $st1 " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/LOAD_FXRATE_FORMAT_USD.sas"
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
 desc="Create multiple trigger file"
 cd /sasprog/triggers
 if [ -f $st  ]
 then
 touch S_LOAD_FXRATE_FORMAT.txt S_LOAD_FXRATE_FORMAT_A.txt S_LOAD_FXRATE_FORMAT_USD.txt
 else
 echo $st " does not exist"
 fi
 rcode=$?
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=LOAD_FXRATE_FORMAT
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_LOAD_FXRATE_FORMAT.txt
st=S_LOAD_FXRATE_FORMAT.txt
ut1=U_LOAD_FXRATE_FORMAT_USD.txt
st1=S_LOAD_FXRATE_FORMAT_USD.txt
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


