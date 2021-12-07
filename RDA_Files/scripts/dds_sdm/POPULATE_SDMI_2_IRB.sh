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
 desc="POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt  ]
 then
 rm S_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt
 echo   "S_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt deleted "
 else
 echo  "S_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt does not exist"
 fi
 if [ -f U_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt ]
 then
 rm U_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt
 echo  "U_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt deleted"
 else
 echo   "U_POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_EXTERNAL_ORG_FINANCIAL_DATA.sas"
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
 desc="POPULATE_I_FINANCIAL_ACCOUNT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FINANCIAL_ACCOUNT.txt  ]
 then
 rm S_POPULATE_I_FINANCIAL_ACCOUNT.txt
 echo   "S_POPULATE_I_FINANCIAL_ACCOUNT.txt deleted "
 else
 echo  "S_POPULATE_I_FINANCIAL_ACCOUNT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FINANCIAL_ACCOUNT.txt ]
 then
 rm U_POPULATE_I_FINANCIAL_ACCOUNT.txt
 echo  "U_POPULATE_I_FINANCIAL_ACCOUNT.txt deleted"
 else
 echo   "U_POPULATE_I_FINANCIAL_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FINANCIAL_ACCOUNT.sas"
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
 desc="POPULATE_I_FINANCIAL_ACCOUNT_CHNG"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt  ]
 then
 rm S_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt
 echo   "S_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt deleted "
 else
 echo  "S_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt ]
 then
 rm U_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt
 echo  "U_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt deleted"
 else
 echo   "U_POPULATE_I_FINANCIAL_ACCOUNT_CHNG.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FINANCIAL_ACCOUNT_CHNG.sas"
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
 desc="POPULATE_I_FINANCIAL_COLLATERAL"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FINANCIAL_COLLATERAL.txt  ]
 then
 rm S_POPULATE_I_FINANCIAL_COLLATERAL.txt
 echo   "S_POPULATE_I_FINANCIAL_COLLATERAL.txt deleted "
 else
 echo  "S_POPULATE_I_FINANCIAL_COLLATERAL.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FINANCIAL_COLLATERAL.txt ]
 then
 rm U_POPULATE_I_FINANCIAL_COLLATERAL.txt
 echo  "U_POPULATE_I_FINANCIAL_COLLATERAL.txt deleted"
 else
 echo   "U_POPULATE_I_FINANCIAL_COLLATERAL.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FINANCIAL_COLLATERAL.sas"
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
 desc="POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt  ]
 then
 rm S_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt
 echo   "S_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt deleted "
 else
 echo  "S_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt ]
 then
 rm U_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt
 echo  "U_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt deleted"
 else
 echo   "U_POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FINANCIAL_INST_CREDIT_ASSESS.sas"
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
 desc="POPULATE_I_FINANCIAL_INSTRUMENT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FINANCIAL_INSTRUMENT.txt  ]
 then
 rm S_POPULATE_I_FINANCIAL_INSTRUMENT.txt
 echo   "S_POPULATE_I_FINANCIAL_INSTRUMENT.txt deleted "
 else
 echo  "S_POPULATE_I_FINANCIAL_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FINANCIAL_INSTRUMENT.txt ]
 then
 rm U_POPULATE_I_FINANCIAL_INSTRUMENT.txt
 echo  "U_POPULATE_I_FINANCIAL_INSTRUMENT.txt deleted"
 else
 echo   "U_POPULATE_I_FINANCIAL_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FINANCIAL_INSTRUMENT.sas"
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
 desc="POPULATE_I_FINANCIAL_POSITION"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FINANCIAL_POSITION.txt  ]
 then
 rm S_POPULATE_I_FINANCIAL_POSITION.txt
 echo   "S_POPULATE_I_FINANCIAL_POSITION.txt deleted "
 else
 echo  "S_POPULATE_I_FINANCIAL_POSITION.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FINANCIAL_POSITION.txt ]
 then
 rm U_POPULATE_I_FINANCIAL_POSITION.txt
 echo  "U_POPULATE_I_FINANCIAL_POSITION.txt deleted"
 else
 echo   "U_POPULATE_I_FINANCIAL_POSITION.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FINANCIAL_POSITION.sas"
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
 desc="POPULATE_I_FX_INSTRUMENT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_FX_INSTRUMENT.txt  ]
 then
 rm S_POPULATE_I_FX_INSTRUMENT.txt
 echo   "S_POPULATE_I_FX_INSTRUMENT.txt deleted "
 else
 echo  "S_POPULATE_I_FX_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_FX_INSTRUMENT.txt ]
 then
 rm U_POPULATE_I_FX_INSTRUMENT.txt
 echo  "U_POPULATE_I_FX_INSTRUMENT.txt deleted"
 else
 echo   "U_POPULATE_I_FX_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_FX_INSTRUMENT.sas"
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
 desc="POPULATE_I_GUARANTEE"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_GUARANTEE.txt  ]
 then
 rm S_POPULATE_I_GUARANTEE.txt
 echo   "S_POPULATE_I_GUARANTEE.txt deleted "
 else
 echo  "S_POPULATE_I_GUARANTEE.txt does not exist"
 fi
 if [ -f U_POPULATE_I_GUARANTEE.txt ]
 then
 rm U_POPULATE_I_GUARANTEE.txt
 echo  "U_POPULATE_I_GUARANTEE.txt deleted"
 else
 echo   "U_POPULATE_I_GUARANTEE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_GUARANTEE.sas"
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
 desc="POPULATE_I_INDIVIDUAL_CUSTOMER"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_INDIVIDUAL_CUSTOMER.txt  ]
 then
 rm S_POPULATE_I_INDIVIDUAL_CUSTOMER.txt
 echo   "S_POPULATE_I_INDIVIDUAL_CUSTOMER.txt deleted "
 else
 echo  "S_POPULATE_I_INDIVIDUAL_CUSTOMER.txt does not exist"
 fi
 if [ -f U_POPULATE_I_INDIVIDUAL_CUSTOMER.txt ]
 then
 rm U_POPULATE_I_INDIVIDUAL_CUSTOMER.txt
 echo  "U_POPULATE_I_INDIVIDUAL_CUSTOMER.txt deleted"
 else
 echo   "U_POPULATE_I_INDIVIDUAL_CUSTOMER.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_INDIVIDUAL_CUSTOMER.sas"
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
 desc="POPULATE_I_INTERNAL_ORG"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_INTERNAL_ORG.txt  ]
 then
 rm S_POPULATE_I_INTERNAL_ORG.txt
 echo   "S_POPULATE_I_INTERNAL_ORG.txt deleted "
 else
 echo  "S_POPULATE_I_INTERNAL_ORG.txt does not exist"
 fi
 if [ -f U_POPULATE_I_INTERNAL_ORG.txt ]
 then
 rm U_POPULATE_I_INTERNAL_ORG.txt
 echo  "U_POPULATE_I_INTERNAL_ORG.txt deleted"
 else
 echo   "U_POPULATE_I_INTERNAL_ORG.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_INTERNAL_ORG.sas"
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
 desc="POPULATE_I_LEASE_ACCOUNT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_LEASE_ACCOUNT.txt  ]
 then
 rm S_POPULATE_I_LEASE_ACCOUNT.txt
 echo   "S_POPULATE_I_LEASE_ACCOUNT.txt deleted "
 else
 echo  "S_POPULATE_I_LEASE_ACCOUNT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_LEASE_ACCOUNT.txt ]
 then
 rm U_POPULATE_I_LEASE_ACCOUNT.txt
 echo  "U_POPULATE_I_LEASE_ACCOUNT.txt deleted"
 else
 echo   "U_POPULATE_I_LEASE_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_LEASE_ACCOUNT.sas"
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
 desc="POPULATE_I_LOAN_ACCOUNT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_LOAN_ACCOUNT.txt  ]
 then
 rm S_POPULATE_I_LOAN_ACCOUNT.txt
 echo   "S_POPULATE_I_LOAN_ACCOUNT.txt deleted "
 else
 echo  "S_POPULATE_I_LOAN_ACCOUNT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_LOAN_ACCOUNT.txt ]
 then
 rm U_POPULATE_I_LOAN_ACCOUNT.txt
 echo  "U_POPULATE_I_LOAN_ACCOUNT.txt deleted"
 else
 echo   "U_POPULATE_I_LOAN_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_LOAN_ACCOUNT.sas"
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
 desc="POPULATE_I_MORTGAGE_ACCOUNT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_MORTGAGE_ACCOUNT.txt  ]
 then
 rm S_POPULATE_I_MORTGAGE_ACCOUNT.txt
 echo   "S_POPULATE_I_MORTGAGE_ACCOUNT.txt deleted "
 else
 echo  "S_POPULATE_I_MORTGAGE_ACCOUNT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_MORTGAGE_ACCOUNT.txt ]
 then
 rm U_POPULATE_I_MORTGAGE_ACCOUNT.txt
 echo  "U_POPULATE_I_MORTGAGE_ACCOUNT.txt deleted"
 else
 echo   "U_POPULATE_I_MORTGAGE_ACCOUNT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_MORTGAGE_ACCOUNT.sas"
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
 desc="POPULATE_I_PHYSICAL_ASSET_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_PHYSICAL_ASSET_IRB.txt  ]
 then
 rm S_POPULATE_I_PHYSICAL_ASSET_IRB.txt
 echo   "S_POPULATE_I_PHYSICAL_ASSET_IRB_IRB.txt deleted "
 else
 echo  "S_POPULATE_I_PHYSICAL_ASSET_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_I_PHYSICAL_ASSET_IRB.txt ]
 then
 rm U_POPULATE_I_PHYSICAL_ASSET_IRB.txt
 echo  "U_POPULATE_I_PHYSICAL_ASSET_IRB.txt deleted"
 else
 echo   "U_POPULATE_I_PHYSICAL_ASSET_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_PHYSICAL_ASSET_IRB.sas"
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
 desc="POPULATE_I_PHYSICAL_COLLATERAL_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt  ]
 then
 rm S_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt
 echo   "S_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt deleted "
 else
 echo  "S_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt ]
 then
 rm U_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt
 echo  "U_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt deleted"
 else
 echo   "U_POPULATE_I_PHYSICAL_COLLATERAL_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_PHYSICAL_COLLATERAL_IRB.sas"
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
 desc="POPULATE_I_SPECIFIC_PROVISION"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_SPECIFIC_PROVISION.txt  ]
 then
 rm S_POPULATE_I_SPECIFIC_PROVISION.txt
 echo   "S_POPULATE_I_SPECIFIC_PROVISION.txt deleted "
 else
 echo  "S_POPULATE_I_SPECIFIC_PROVISION.txt does not exist"
 fi
 if [ -f U_POPULATE_I_SPECIFIC_PROVISION.txt ]
 then
 rm U_POPULATE_I_SPECIFIC_PROVISION.txt
 echo  "U_POPULATE_I_SPECIFIC_PROVISION.txt deleted"
 else
 echo   "U_POPULATE_I_SPECIFIC_PROVISION.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_SPECIFIC_PROVISION.sas"
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
 desc="POPULATE_I_SWAP_IRS_CCS_INSTRUMENT"
 cd /sasprog/triggers
 if [ -f S_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt  ]
 then
 rm S_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt
 echo   "S_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt deleted "
 else
 echo  "S_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt does not exist"
 fi
 if [ -f U_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt ]
 then
 rm U_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt
 echo  "U_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt deleted"
 else
 echo   "U_POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/dds_sdm/POPULATE_I_SWAP_IRS_CCS_INSTRUMENT.sas"
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
 desc="Create trigger file"
 cd /sasprog/triggers

 touch S_POPULATE_SDMI_2_IRB.txt

 rcode=$?
 rrstep=""
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_SDMI_2_IRB
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_SDMI_2_IRB.txt
st=S_POPULATE_SDMI_2_IRB.txt
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
exit $rcode
