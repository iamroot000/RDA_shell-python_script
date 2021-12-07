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

 desc="Deletion of trigger file" 
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
 
 desc="Deletion of old param card lines"
 cd $parm_drv
 echo >> $log_drv/$log_file
 for pmc in `ls $pmcard_lst`
 do
   if [ -f $pmc ]
   then
     rm -f /tmp/$pmc
     cp -p $pmc /tmp/$pmc
     tail -1 $pmc > /tmp/$pmc
     mv -f /tmp/$pmc $pmc
     rcode=$? 
     echo $pmc purged! >> $log_drv/$log_file
     touch /sasprog/triggers/$st
   else
     #touch $log_drv/$log_file
     echo $pmc does not exist.  >> $log_drv/$log_file
     rcode=$?
     touch /sasprog/triggers/$ut
   fi 
 done

 rrstep=""
 logrc
}

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
parm_drv=/sasdata/PARAMCARD
log_drv=/sasprog/joblog
pmcard_lst="?*_PARAMCARD.txt ?*_Param_Card.txt"
log_file=PURGE_PARAMCARD.log
batchname=PURGE_PARAMCARD
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_PURGE_PARAMCARD.txt
st=S_PURGE_PARAMCARD.txt
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
