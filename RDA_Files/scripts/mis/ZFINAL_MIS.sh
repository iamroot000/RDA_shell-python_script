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
 if [ -f S_POPULATE_MISREPORT_SOURCES1.txt ]
 then
 rm S_POPULATE_MISREPORT_SOURCES1.txt
 echo   "S_POPULATE_MISREPORT_SOURCES1.txt deleted "
 else
 echo  "S_POPULATE_MISREPORT_SOURCES1.txt does not exist"
 fi
 if [ -f U_POPULATE_MISREPORT_SOURCES1.txt ]
 then
 rm U_POPULATE_MISREPORT_SOURCES1.txt
 echo  "U_POPULATE_MISREPORT_SOURCES1.txt deleted"
 else
 echo   "U_POPULATE_MISREPORT_SOURCES1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/mis/POPULATE_MISREPORT_SOURCES1.sas"
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
 if [ -f S_POPULATE_MISREPORT_SOURCES2.txt ]
 then
 rm S_POPULATE_MISREPORT_SOURCES2.txt
 echo   "S_POPULATE_MISREPORT_SOURCES2.txt deleted "
 else
 echo  "S_POPULATE_MISREPORT_SOURCES2.txt does not exist"
 fi
 if [ -f U_POPULATE_MISREPORT_SOURCES2.txt ]
 then
 rm U_POPULATE_MISREPORT_SOURCES2.txt
 echo  "U_POPULATE_MISREPORT_SOURCES2.txt deleted"
 else
 echo   "U_POPULATE_MISREPORT_SOURCES2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/mis/POPULATE_MISREPORT_SOURCES2.sas"
 rcode=$?
 logrc
 }




#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=ZFINAL_MIS
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_ZFINAL_MIS.txt
st=S_ZFINAL_MIS.txt
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


