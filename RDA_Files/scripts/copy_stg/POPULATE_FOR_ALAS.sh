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
 if [ -f U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt  ]
 then
 rm U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt
 echo  U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt " deleted "
 else
 echo U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt " does not exist"
 fi
 if [ -f S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt ]
 then
 rm S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt
 echo S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt " deleted"
 else
 echo  S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_INDIVIDUAL_CUSTOMER_FOR_ALAS.sas"
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
 if [ -f U_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt  ]
 then
 rm U_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt
 echo  U_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt " deleted "
 else
 echo U_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt " does not exist"
 fi
 if [ -f S_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt ]
 then
 rm S_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt
 echo S_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt " deleted"
 else
 echo  S_POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CORPORATE_CUSTOMER_FOR_ALAS.sas"
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
 if [ -f U_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt  ]
 then
 rm U_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt
 echo  U_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt " deleted "
 else
 echo U_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt " does not exist"
 fi
 if [ -f S_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt ]
 then
 rm S_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt
 echo S_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt " deleted"
 else
 echo  S_POPULATE_LEASING_ACCOUNT_FOR_ALAS.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_LEASING_ACCOUNT_FOR_ALAS.sas"
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
 if [ -f U_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt  ]
 then
 rm U_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt
 echo  U_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt " deleted "
 else
 echo U_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt " does not exist"
 fi
 if [ -f S_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt ]
 then
 rm S_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt
 echo S_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt " deleted"
 else
 echo  S_POPULATE_CREDIT_FACILITY_FOR_ALAS.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CREDIT_FACILITY_FOR_ALAS.sas"
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
 if [ -f U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt  ]
 then
 rm U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt
 echo  U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt " deleted "
 else
 echo U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt ]
 then
 rm S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt
 echo S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_INDIVIDUAL_CUSTOMER_FOR_AMBIT.sas"
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
 if [ -f U_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt  ]
 then
 rm U_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt
 echo  U_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt " deleted "
 else
 echo U_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt ]
 then
 rm S_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt
 echo S_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CORPORATE_CUSTOMER_FOR_AMBIT.sas"
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
 if [ -f U_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt  ]
 then
 rm U_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt
 echo  U_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt " deleted "
 else
 echo U_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt ]
 then
 rm S_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt
 echo S_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_LEASING_ACCOUNT_FOR_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_LEASING_ACCOUNT_FOR_AMBIT.sas"
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
 if [ -f U_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt  ]
 then
 rm U_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt
 echo  U_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt " deleted "
 else
 echo U_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt ]
 then
 rm S_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt
 echo S_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_CREDIT_FACILITY_FOR_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CREDIT_FACILITY_FOR_AMBIT.sas"
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
 if [ -f U_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt  ]
 then
 rm U_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt
 echo  U_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt " deleted "
 else
 echo U_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt ]
 then
 rm S_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt
 echo S_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_FINANCIAL_COLLATERAL_FOR_AMBIT.sas"
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
 if [ -f U_POPULATE_RECEIVABLES_AMBIT.txt  ]
 then
 rm U_POPULATE_RECEIVABLES_AMBIT.txt
 echo  U_POPULATE_RECEIVABLES_AMBIT.txt " deleted "
 else
 echo U_POPULATE_RECEIVABLES_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_RECEIVABLES_AMBIT.txt ]
 then
 rm S_POPULATE_RECEIVABLES_AMBIT.txt
 echo S_POPULATE_RECEIVABLES_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_RECEIVABLES_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_RECEIVABLES_AMBIT.sas"
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
 if [ -f U_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt  ]
 then
 rm U_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt
 echo  U_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt " deleted "
 else
 echo U_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt ]
 then
 rm S_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt
 echo S_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_EXPOSURE_CRM_LINK_FOR_AMBIT.sas"
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
 if [ -f U_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt  ]
 then
 rm U_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt
 echo  U_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt " deleted "
 else
 echo U_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt " does not exist"
 fi
 if [ -f S_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt ]
 then
 rm S_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt
 echo S_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt " deleted"
 else
 echo  S_POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_EXPOSURE_CRM_LINK_RECEIVABLES_AMBIT.sas"
 rcode=$?
 rrstep=""
 logrc
 }



#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_FOR_ALAS
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_FOR_ALAS.txt
st=S_POPULATE_FOR_ALAS.txt
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
exit $rcode
