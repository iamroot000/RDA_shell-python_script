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
 if [ -f $st ]
 then
 rm $st
 echo  $st  " deleted "
 else
 echo $st  " does not exist"
 fi
 if [ -f $ut ]
 then
 rm $ut
 echo  $ut " deleted"
 else
 echo   $ut " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/UPDATE_RISKENGINE_CONFIG_IRB.sas"
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
 desc="Copy tables"
 cd /sasprog/triggers
 if [ -f $st ]
 then
 rm $st
 echo  $st  " deleted "
 else
 echo $st  " does not exist"
 fi
 if [ -f $ut ]
 then
 rm $ut
 echo  $ut " deleted"
 else
 echo   $ut " does not exist"
 fi
 cp -p /sas9/SASCreditRiskManagement/4.2/groups/main/datamart/static/rating_grade_band.sas7bdat /sasdata/PARAMTABLE/RE_IRB/static
 cp -p /sas9/SASCreditRiskManagement/4.2/groups/main/datamart/static/regulatory_risk_weight.sas7bdat /sasdata/PARAMTABLE/RE_IRB/static
 cp -p /sas9/SASCreditRiskManagement/4.2/groups/main/datamart/static/regulatory_risk_weight.sas7bndx /sasdata/PARAMTABLE/RE_IRB/static
 cp -p /sas9/SASCreditRiskManagement/4.2/groups/main/datamart/mapping/map_ext_ratings.sas7bdat /sasdata/PARAMTABLE/RE_IRB/mapping
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
 desc="Create trigger file"
 cd /sasprog/triggers

 touch S_UPDATE_RISKENGINE_CONFIG_IRB.txt

 rcode=$?
 rrstep=""
 logrc
 }
#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=UPDATE_RISKENGINE_CONFIG_IRB
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_UPDATE_RISKENGINE_CONFIG_IRB.txt
st=S_UPDATE_RISKENGINE_CONFIG_IRB.txt
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

