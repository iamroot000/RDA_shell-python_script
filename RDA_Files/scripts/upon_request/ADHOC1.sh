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
 desc="backup run_dates_dds"
 $swcode $swuser -c "cp -p /sasdata/${lev}/ADMIN/run_dates_dds.sas7bdat /sasdata/${lev}/ADMIN/run_dates_dds_20130507.sas7bdat"
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
 desc="move dds paramcard table"
 mv /sasprog/triggers/DDS_PARAMCARD.txt /sasdata/PARAMCARD/
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
 desc="run SET_RUN_CONTROL_TABLE_FOR_DDS.sh"
 cd /sasprog/scripts/prereq 
  ./SET_RUN_CONTROL_TABLE_FOR_DDS.sh
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
 desc="run LOAD_COPY_FXRATE.sh"
 cd /sasprog/scripts/src_copy 
  ./LOAD_COPY_FXRATE.sh
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
 desc="restore run_dates table"
 $swcode $swuser -c "cp -p /sasdata/${lev}/ADMIN/run_dates_dds_20130507.sas7bdat /sasdata/${lev}/ADMIN/run_dates_dds.sas7bdat"
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
 desc="delete trigger files"
 cd /sasprog/triggers
 rm S_SET_RUN_CONTROL_TABLE_FOR_DDS_A.txt S_SET_RUN_CONTROL_TABLE_FOR_DDS.txt 
 rcode=$?
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=ADHOC1
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
step04
step05
step06
exit $rcode

