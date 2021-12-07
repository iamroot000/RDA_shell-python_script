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

 dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
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
 desc="ETL01_GET_PRIMARY_CPTY_CR_MITIGANT"
 cd /sasprog/triggers
 if [ -f S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt  ]
 then
 rm S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt
 echo   "S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt deleted "
 else
 echo  "S_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt does not exist"
 fi
 if [ -f U_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt ]
 then
 rm U_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt
 echo  "U_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt deleted"
 else
 echo   "U_ETL01_GET_PRIMARY_CPTY_CR_MITIGANT.txt does not exist"
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
 desc="ETL01_JOIN_CUSTOMERS"
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
 desc="ETL02_APPEND_ALL_FINANCIAL_INSTRUMENT"
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
 desc="ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt  ]
 then
 rm S_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt
 echo   "S_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt deleted "
 else
 echo  "S_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt does not exist"
 fi
 if [ -f U_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt ]
 then
 rm U_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt
 echo  "U_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt deleted"
 else
 echo   "U_ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_TRANS_ACCOUNT_CREDIT_ASSESS_IRB.sas"
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
 desc="ETL02_JOIN_INTERNAL_ORG_WITH_ASSOC"
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

function step06
{
 step=step06
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt  ]
 then
 rm S_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt
 echo   "S_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt deleted "
 else
 echo  "S_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt does not exist"
 fi
 if [ -f U_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt ]
 then
 rm U_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt
 echo  "U_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt deleted"
 else
 echo   "U_ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_JOIN_ACCOUNT_ASSESSMENT_IRB.sas"
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
 desc="ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt  ]
 then
 rm S_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt
 echo   "S_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt deleted "
 else
 echo  "S_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt does not exist"
 fi
 if [ -f U_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt ]
 then
 rm U_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt
 echo  "U_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt deleted"
 else
 echo   "U_ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_TRANS_CPTY_CREDIT_ASSESS_IRB.sas"
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
 desc="ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt  ]
 then
 rm S_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt
 echo   "S_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt deleted "
 else
 echo  "S_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt does not exist"
 fi
 if [ -f U_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt ]
 then
 rm U_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt
 echo  "U_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt deleted"
 else
 echo   "U_ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL02_TRANS_FACILITY_CREDIT_ASSESS_IRB.sas"
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
 desc="ETL02_TRANS_INSTRUMENT_CREDIT_ASSESS"
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

function step10
{
 step=step10
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_COUNTERPARTY_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_COUNTERPARTY_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_COUNTERPARTY_RATINGS_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_ACCOUNT_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_GUARANTEE_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_PHYSICAL_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_INSTRUMENT_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_CRM_RECEIVABLE_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_EXPOSURE_ACCOUNT"
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

function step18
{
 step=step18
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_EXPOSURE_CF_LINK"
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

function step19
{
 step=step19
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_EXPOSURE_CRM_LINK_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_EXPOSURE_FACILITY"
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

function step21
{
 step=step21
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_INTERNAL_ORG_MART"
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

function step22
{
 step=step22
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_ACCOUNT_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_ASSET_IRB.sas"
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
 desc="ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_FACILITY_IRB.sas"
 rcode=$?
 rrstep=""
 logrc
 }

function step25
{
 step=step25
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_INSTRUMENT_IRB.sas"
 rcode=$?
 rrstep=""
 logrc
 }

function step26
{
 step=step26
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_ISSUE_RATINGS_IRB.sas"
 rcode=$?
 rrstep=""
 logrc
 }

function step27
{
 step=step27
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_PROVISIONS"
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

function step28
{
 step=step28
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL03_LOAD_DATAMART_RATING_GRADE_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt  ]
 then
 rm S_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt
 echo   "S_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt deleted "
 else
 echo  "S_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt does not exist"
 fi
 if [ -f U_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt ]
 then
 rm U_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt
 echo  "U_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt deleted"
 else
 echo   "U_ETL03_LOAD_DATAMART_RATING_GRADE_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL03_LOAD_DATAMART_RATING_GRADE_IRB.sas"
 rcode=$?
 rrstep=""
 logrc
 }

function step29
{
 step=step29
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB"
 cd /sasprog/triggers
 if [ -f S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt  ]
 then
 rm S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt
 echo   "S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt deleted "
 else
 echo  "S_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt does not exist"
 fi
 if [ -f U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt ]
 then
 rm U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt
 echo  "U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt deleted"
 else
 echo   "U_ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/ETL04_LOAD_DATAMART_EXPOSURE_INSTRUMENT_IRB.sas"
 rcode=$?
 rrstep=""
 logrc
 }


function step30
{
 step=step30
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Create trigger file"
 cd /sasprog/triggers

 touch S_POPULATE_SDMSMJ_IRB.txt

 rcode=$?
 rrstep=""
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_SDMSMJ_IRB
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_SDMSMJ_IRB.txt
st=S_POPULATE_SDMSMJ_IRB.txt
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
step25
step26
step27
step28
step29
step30
exit $rcode
