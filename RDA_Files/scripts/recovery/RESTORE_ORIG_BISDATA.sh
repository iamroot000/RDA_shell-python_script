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
 desc="RESTORE_ORIG_BISDATA"
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
  if [ -f $utd ]
 then
 rm $utd
 echo  $utd " deleted "
 else
 echo $utd " does not exist"
 fi
 if [ -f $std ]
 then
 rm $std
 echo $std " deleted"
 else
 echo  $st " does not exist"
 fi
 $swcode $swuser -c "cd /sasprog/sasjoblog;  rm -R /sasdata/${lev}/Data/bisdata/bridge/*.sas7*;  rm -R /sasdata/${lev}/Data/bisdata/detail/*.sas7*;"
 $swcode $swuser -c "cd /sasprog/sasjoblog; $exesas -autoexec /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/autoexec.sas /sasprog/${lev}/recovery/RESTORE_BISDATA.sas"
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
 desc="Create trigger file"
 cd /sasprog/triggers
 if [ -f $std ]
 then
 rm $std
 touch S_RESTORE_ORIG_BISDATA.txt
 fi
 if [ -f $utd ]
 then
 rm $utd
 touch U_RESTORE_ORIG_BISDATA.txt
 fi
 rrstep=""
 logrc
 }


#main script

path=$1
$1=""
drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=RESTORE_ORIG_BISDATA
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_RESTORE_ORIG_BISDATA.txt
st=S_RESTORE_ORIG_BISDATA.txt
utd=S_RESTORE_BISDATA.txt
std=S_RESTORE_BISDATA.txt
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

