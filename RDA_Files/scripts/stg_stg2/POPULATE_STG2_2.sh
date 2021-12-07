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
 if [ -f S_01_POPULATE_STG2_EMPLOYEE.txt  ]
 then
 rm S_01_POPULATE_STG2_EMPLOYEE.txt
 echo   "S_01_POPULATE_STG2_EMPLOYEE.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EMPLOYEE.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EMPLOYEE.txt ]
 then
 rm U_01_POPULATE_STG2_EMPLOYEE.txt
 echo  "U_01_POPULATE_STG2_EMPLOYEE.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EMPLOYEE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EMPLOYEE.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_EXTERNAL_ORG.txt  ]
 then
 rm S_01_POPULATE_STG2_EXTERNAL_ORG.txt
 echo   "S_01_POPULATE_STG2_EXTERNAL_ORG.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EXTERNAL_ORG.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EXTERNAL_ORG.txt ]
 then
 rm U_01_POPULATE_STG2_EXTERNAL_ORG.txt
 echo  "U_01_POPULATE_STG2_EXTERNAL_ORG.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EXTERNAL_ORG.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EXTERNAL_ORG.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt  ]
 then
 rm S_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt
 echo   "S_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt ]
 then
 rm U_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt
 echo  "U_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EXTERNAL_ORG_ADDRESS.sas"
 rcode=$?
 rrstep=""
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
 if [ -f S_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt  ]
 then
 rm S_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt
 echo   "S_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt ]
 then
 rm U_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt
 echo  "U_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EXTERNAL_ORG_FINANCIAL_DATA.sas"
 rcode=$?
 rrstep=""
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt  ]
 then
 rm S_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt
 echo   "S_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt ]
 then
 rm U_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt
 echo  "U_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EXTERNAL_ORG_INDUSTRY.sas"
 rcode=$?
 rrstep=""
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt  ]
 then
 rm S_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt
 echo   "S_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt ]
 then
 rm U_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt
 echo  "U_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EXT_EMPLOYEE_X_GROUP.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step07
{
 step=step07
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt  ]
 then
 rm S_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt
 echo   "S_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt ]
 then
 rm U_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt
 echo  "U_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FINANCIAL_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FINANCIAL_ACCOUNT.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step08
{
 step=step08
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt  ]
 then
 rm S_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt
 echo   "S_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt ]
 then
 rm U_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt
 echo  "U_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FINANCIAL_ACCOUNT_CHNG.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step09
{
 step=step09
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt  ]
 then
 rm S_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt
 echo   "S_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt ]
 then
 rm U_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt
 echo  "U_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FINANCIAL_COLLATERAL.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FINANCIAL_COLLATERAL.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step10
{
 step=step10
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt  ]
 then
 rm S_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt
 echo   "S_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt ]
 then
 rm U_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt
 echo  "U_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FINANCIAL_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FINANCIAL_INSTRUMENT.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step11
{
 step=step11
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt  ]
 then
 rm S_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt
 echo   "S_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt ]
 then
 rm U_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt
 echo  "U_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.sas"
 rcode=$?
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_STG2_2
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_STG2_2.txt
st=S_POPULATE_STG2_2.txt
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
step07
step08
step09
step10
step11
exit $rcode