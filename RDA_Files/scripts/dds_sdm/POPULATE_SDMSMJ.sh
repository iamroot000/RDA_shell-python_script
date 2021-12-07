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
 if [ -f S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt  ]
 then
 rm S_.txt
 echo   "S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt deleted "
 else
 echo  "S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt does not exist"
 fi
 if [ -f U_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt ]
 then
 rm U_.txt
 echo  "U_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt deleted"
 else
 echo   "U_SETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.sas"
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
 if [ -f S_ETL01_JOIN_CUSTOMERS.txt  ]
 then
 rm S_ETL01_JOIN_CUSTOMERS.txt
 echo   "S_ETL01_JOIN_CUSTOMERS.txt deleted "
 else
 echo  "S_ETL01_JOIN_CUSTOMERS.txt does not exist"
 fi
 if [ -f U_ETL01_JOIN_CUSTOMERS.txt ]
 then
 rm U_ETL01_JOIN_CUSTOMERS.txt
 echo  "U_ETL01_JOIN_CUSTOMERS.txt deleted"
 else
 echo   "U_ETL01_JOIN_CUSTOMERS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL01_JOIN_CUSTOMERS.sas"
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
 if [ -f S_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt  ]
 then
 rm S_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt
 echo   "S_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt deleted "
 else
 echo  "S_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt ]
 then
 rm U_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt
 echo  "U_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt deleted"
 else
 echo   "U_ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT.sas"
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
 if [ -f S_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt  ]
 then
 rm S_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt
 echo   "S_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt deleted "
 else
 echo  "S_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt does not exist"
 fi
 if [ -f U_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt ]
 then
 rm U_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt
 echo  "U_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt deleted"
 else
 echo   "U_ETL02_JOIN_ACCOUNT_ASSESSMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_JOIN_ACCOUNT_ASSESSMENT.sas"
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
 if [ -f S_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt  ]
 then
 rm S_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt
 echo   "S_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt deleted "
 else
 echo  "S_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt does not exist"
 fi
 if [ -f U_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt ]
 then
 rm U_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt
 echo  "U_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt deleted"
 else
 echo   "U_ETL02_TRANS_CPTY_CREDIT_ASSESS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_TRANS_CPTY_CREDIT_ASSESS.sas"
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
 if [ -f S_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt  ]
 then
 rm S_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt
 echo   "S_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt deleted "
 else
 echo  "S_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt does not exist"
 fi
 if [ -f U_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt ]
 then
 rm U_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt
 echo  "U_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt deleted"
 else
 echo   "U_ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC.sas"
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
 if [ -f S_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt  ]
 then
 rm S_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt
 echo   "S_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt deleted "
 else
 echo  "S_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt does not exist"
 fi
 if [ -f U_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt ]
 then
 rm U_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt
 echo  "U_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt deleted"
 else
 echo   "U_ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS.sas"
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
 if [ -f S_ETL03_LOAD_DATAMART_COUNTERPARTY.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_COUNTERPARTY.txt
 echo   "S_ETL03_LOAD_DATAMART_COUNTERPARTY.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_COUNTERPARTY.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_COUNTERPARTY.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_COUNTERPARTY.txt
 echo  "U_ETL03_LOAD_DATAMART_COUNTERPARTY.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_COUNTERPARTY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_COUNTERPARTY.sas"
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
 if [ -f S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt
 echo   "S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt
 echo  "U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS.sas"
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
 if [ -f S_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_ACCOUNT.sas"
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
 if [ -f S_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_GUARANTEE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_GUARANTEE.sas"
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
 if [ -f S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_INSTRUMENT.sas"
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
 if [ -f S_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt
 echo   "S_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt
 echo  "U_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt
 echo   "S_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt
 echo  "U_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step15
{
 step=step15
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt  ]
 then
 rm S_.txt
 echo   "S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt
 echo  "U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step16
{
 step=step16
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt
 echo   "S_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt
 echo  "U_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_EXPOSURE_FACILITY.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step17
{
 step=step17
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt
 echo   "S_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt
 echo  "U_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_INTERNAL_ORG_MART.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step18
{
 step=step18
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_ACCOUNT.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step19
{
 step=step19
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_FACILITY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_FACILITY.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step20
{
 step=step20
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step21
{
 step=step21
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_RATINGS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_RATINGS.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step22
{
 step=step22
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_PROVISIONS.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_PROVISIONS.txt
 echo   "S_ETL03_LOAD_DATAMART_PROVISIONS.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_PROVISIONS.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_PROVISIONS.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_PROVISIONS.txt
 echo  "U_ETL03_LOAD_DATAMART_PROVISIONS.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_PROVISIONS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_PROVISIONS.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step23
{
 step=step23
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_RATING_GRADE.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_RATING_GRADE.txt
 echo   "S_ETL03_LOAD_DATAMART_RATING_GRADE.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_RATING_GRADE.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_RATING_GRADE.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_RATING_GRADE.txt
 echo  "U_ETL03_LOAD_DATAMART_RATING_GRADE.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_RATING_GRADE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_RATING_GRADE.sas"
 rcode=$?
 rrstep=""
 logrc
 }



function step24
{
 step=step24
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt  ]
 then
 rm S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt
 echo   "S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt deleted "
 else
 echo  "S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt ]
 then
 rm U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt
 echo  "U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt deleted"
 else
 echo   "U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT.sas"
 rcode=$?
 rrstep=""
 logrc
 }







#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_SDMSMJ
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_SDMSMJ.txt
st=S_POPULATE_SDMSMJ.txt
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
step15
step16
step17
step18
step19
step20
step21
step22
step23
step24


exit $rcode
