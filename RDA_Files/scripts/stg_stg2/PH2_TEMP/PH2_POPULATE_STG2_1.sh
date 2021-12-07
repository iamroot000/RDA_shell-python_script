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
 if [ -f S_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt  ]
 then
 rm S_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt
 echo   "S_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt ]
 then
 rm U_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt
 echo  "U_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_ACCOUNT_CREDIT_ASSESSMENT.sas"
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
 if [ -f S_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt  ]
 then
 rm S_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt
 echo   "S_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt ]
 then
 rm U_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt
 echo  "U_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_ACCOUNT_CREDIT_RISK_MITIGANT.sas"
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
 if [ -f S_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt  ]
 then
 rm S_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt
 echo   "S_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt ]
 then
 rm U_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt
 echo  "U_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_ASSESSMENT_RATING_GRADE.sas"
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
 if [ -f S_01_POPULATE_STG2_BOND_INSTRUMENT.txt  ]
 then
 rm S_01_POPULATE_STG2_BOND_INSTRUMENT.txt
 echo   "S_01_POPULATE_STG2_BOND_INSTRUMENT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_BOND_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_BOND_INSTRUMENT.txt ]
 then
 rm U_01_POPULATE_STG2_BOND_INSTRUMENT.txt
 echo  "U_01_POPULATE_STG2_BOND_INSTRUMENT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_BOND_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_BOND_INSTRUMENT.sas"
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
 if [ -f S_01_POPULATE_STG2_BPI_GROUPS.txt  ]
 then
 rm S_01_POPULATE_STG2_BPI_GROUPS.txt
 echo   "S_01_POPULATE_STG2_BPI_GROUPS.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_BPI_GROUPS.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_BPI_GROUPS.txt ]
 then
 rm U_01_POPULATE_STG2_BPI_GROUPS.txt
 echo  "U_01_POPULATE_STG2_BPI_GROUPS.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_BPI_GROUPS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_BPI_GROUPS.sas"
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
 if [ -f S_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt  ]
 then
 rm S_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt
 echo   "S_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt ]
 then
 rm U_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt
 echo  "U_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_CORE_BANKING_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_CORE_BANKING_ACCOUNT.sas"
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
 if [ -f S_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt  ]
 then
 rm S_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt
 echo   "S_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt ]
 then
 rm U_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt
 echo  "U_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_CORPORATE_CUSTOMER.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_CORPORATE_CUSTOMER.sas"
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
 if [ -f S_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt  ]
 then
 rm S_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt
 echo   "S_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt ]
 then
 rm U_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt
 echo  "U_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_COUNTERPARTY_CREDIT_ASSESSMENT.sas"
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
 if [ -f S_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt  ]
 then
 rm S_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt
 echo   "S_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt ]
 then
 rm U_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt
 echo  "U_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_COUNTERPARTY_X_CR_MITIGANT.sas"
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
 if [ -f S_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt  ]
 then
 rm S_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt
 echo   "S_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt ]
 then
 rm U_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt
 echo  "U_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_CREDIT_CARD_ACCOUNT.sas"
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
 if [ -f S_01_POPULATE_STG2_CREDIT_FACILITY.txt  ]
 then
 rm S_01_POPULATE_STG2_CREDIT_FACILITY.txt
 echo   "S_01_POPULATE_STG2_CREDIT_FACILITY.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_CREDIT_FACILITY.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_CREDIT_FACILITY.txt ]
 then
 rm U_01_POPULATE_STG2_CREDIT_FACILITY.txt
 echo  "U_01_POPULATE_STG2_CREDIT_FACILITY.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_CREDIT_FACILITY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_CREDIT_FACILITY.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step12
{
 step=step12
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt  ]
 then
 rm S_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt
 echo   "S_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt ]
 then
 rm U_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt
 echo  "U_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_CREDIT_FACILITY_CR_MITIGANT.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step13
{
 step=step13
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt  ]
 then
 rm S_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt
 echo   "S_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt ]
 then
 rm U_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt
 echo  "U_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_CREDIT_RISK_MITIGANT.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step14
{
 step=step14
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Create multiple trigger file"
 cd /sasprog/triggers
 if [ -f $st ]
 then
 touch S_PH2_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt S_PH2_POPULATE_STG2_1.txt
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
batchname=PH2_POPULATE_STG2_1
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt
st=S_01_POPULATE_STG2_CREDIT_RISK_MITIGANT.txt
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
step12
step13
step14

exit $rcode
