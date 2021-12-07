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
 desc="Call 01_POPULATE_STG2_X_REAL_NPL job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_X_REAL_NPL.txt  ]
 then
 rm S_01_POPULATE_STG2_X_REAL_NPL.txt
 echo   "S_01_POPULATE_STG2_X_REAL_NPL.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_X_REAL_NPL.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_X_REAL_NPL.txt ]
 then
 rm U_01_POPULATE_STG2_X_REAL_NPL.txt
 echo  "U_01_POPULATE_STG2_X_REAL_NPL.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_X_REAL_NPL.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_X_REAL_NPL.sas"
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
 desc="Call 01_POPULATE_STG2_LOAN_TRANSACTION job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_LOAN_TRANSACTION.txt  ]
 then
 rm S_01_POPULATE_STG2_LOAN_TRANSACTION.txt
 echo   "S_01_POPULATE_STG2_LOAN_TRANSACTION.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_LOAN_TRANSACTION.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_LOAN_TRANSACTION.txt ]
 then
 rm U_01_POPULATE_STG2_LOAN_TRANSACTION.txt
 echo  "U_01_POPULATE_STG2_LOAN_TRANSACTION.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_LOAN_TRANSACTION.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_LOAN_TRANSACTION.sas"
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
 desc="Call 01_POPULATE_STG2_MORTGAGE_TRANSACTION job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt  ]
 then
 rm S_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt
 echo   "S_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt ]
 then
 rm U_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt
 echo  "U_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_MORTGAGE_TRANSACTION.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_MORTGAGE_TRANSACTION.sas"
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
 desc="Call 01_POPULATE_STG2_X_BPI_RATING job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_X_BPI_RATING.sas.txt  ]
 then
 rm S_01_POPULATE_STG2_X_BPI_RATING.sas.txt
 echo   "S_01_POPULATE_STG2_X_BPI_RATING.sas.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_X_BPI_RATING.sas.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_X_BPI_RATING.sas.txt ]
 then
 rm U_01_POPULATE_STG2_X_BPI_RATING.sas.txt
 echo  "U_01_POPULATE_STG2_X_BPI_RATING.sas.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_X_BPI_RATING.sas.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_X_BPI_RATING.sas"
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
 desc="Call 01_POPULATE_STG2_APPLICATION_SCORE job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_APPLICATION_SCORE.txt  ]
 then
 rm S_01_POPULATE_STG2_APPLICATION_SCORE.txt
 echo   "S_01_POPULATE_STG2_APPLICATION_SCORE.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_APPLICATION_SCORE.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_APPLICATION_SCORE.txt ]
 then
 rm U_01_POPULATE_STG2_APPLICATION_SCORE.txt
 echo  "U_01_POPULATE_STG2_APPLICATION_SCORE.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_APPLICATION_SCORE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_APPLICATION_SCORE.sas"
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
 desc="Call 01_POPULATE_STG2_PHYSICAL_COLLATERAL job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt  ]
 then
 rm S_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt
 echo   "S_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt ]
 then
 rm U_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt
 echo  "U_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_PHYSICAL_COLLATERAL.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_PHYSICAL_COLLATERAL.sas"
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
 desc="Call 01_POPULATE_STG2_PROPERTY job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_PROPERTY.txt  ]
 then
 rm S_01_POPULATE_STG2_PROPERTY.txt
 echo   "S_01_POPULATE_STG2_PROPERTY.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_PROPERTY.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_PROPERTY.txt ]
 then
 rm U_01_POPULATE_STG2_PROPERTY.txt
 echo  "U_01_POPULATE_STG2_PROPERTY.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_PROPERTY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_PROPERTY.sas"
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
 desc="Call 01_POPULATE_STG2_EXPOSURE_RECOVERY job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt  ]
 then
 rm S_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt
 echo   "S_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt ]
 then
 rm U_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt
 echo  "U_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_EXPOSURE_RECOVERY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_EXPOSURE_RECOVERY.sas"
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
 desc="Call 01_POPULATE_STG2_FA_APPLICANT job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FA_APPLICANT.txt  ]
 then
 rm S_01_POPULATE_STG2_FA_APPLICANT.txt
 echo   "S_01_POPULATE_STG2_FA_APPLICANT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FA_APPLICANT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FA_APPLICANT.txt ]
 then
 rm U_01_POPULATE_STG2_FA_APPLICANT.txt
 echo  "U_01_POPULATE_STG2_FA_APPLICANT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FA_APPLICANT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FA_APPLICANT.sas"
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
 desc="Call 01_POPULATE_STG2_FA_APPLICATION job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_FA_APPLICATION.txt  ]
 then
 rm S_01_POPULATE_STG2_FA_APPLICATION.txt
 echo   "S_01_POPULATE_STG2_FA_APPLICATION.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_FA_APPLICATION.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_FA_APPLICATION.txt ]
 then
 rm U_01_POPULATE_STG2_FA_APPLICATION.txt
 echo  "U_01_POPULATE_STG2_FA_APPLICATION.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_FA_APPLICATION.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FA_APPLICATION.sas"
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
 desc="Call 01_POPULATE_STG2_MARKET_SEGMENT job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_MARKET_SEGMENT.txt  ]
 then
 rm S_01_POPULATE_STG2_MARKET_SEGMENT.txt
 echo   "S_01_POPULATE_STG2_MARKET_SEGMENT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_MARKET_SEGMENT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_MARKET_SEGMENT.txt ]
 then
 rm U_01_POPULATE_STG2_MARKET_SEGMENT.txt
 echo  "U_01_POPULATE_STG2_MARKET_SEGMENT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_MARKET_SEGMENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_MARKET_SEGMENT.sas"
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
 desc="Call 01_POPULATE_STG2_DEFAULT_EVENT job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_DEFAULT_EVENT.txt  ]
 then
 rm S_01_POPULATE_STG2_DEFAULT_EVENT.txt
 echo   "S_01_POPULATE_STG2_DEFAULT_EVENT.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_DEFAULT_EVENT.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_DEFAULT_EVENT.txt ]
 then
 rm U_01_POPULATE_STG2_DEFAULT_EVENT.txt
 echo  "U_01_POPULATE_STG2_DEFAULT_EVENT.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_DEFAULT_EVENT.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_DEFAULT_EVENT.sas"
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
 desc="Call 01_POPULATE_STG2_X_FS_VARIABLES job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_X_FS_VARIABLES.txt  ]
 then
 rm S_01_POPULATE_STG2_X_FS_VARIABLES.txt
 echo   "S_01_POPULATE_STG2_X_FS_VARIABLES.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_X_FS_VARIABLES.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_X_FS_VARIABLES.txt ]
 then
 rm U_01_POPULATE_STG2_X_FS_VARIABLES.txt
 echo  "U_01_POPULATE_STG2_X_FS_VARIABLES.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_X_FS_VARIABLES.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_X_FS_VARIABLES.sas"
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
 desc="Call 01_POPULATE_STG2_X_BORROWER_RISK_RATING job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt  ]
 then
 rm S_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt
 echo   "S_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt ]
 then
 rm U_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt
 echo  "U_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_X_BORROWER_RISK_RATING.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_X_BORROWER_RISK_RATING.sas"
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
 desc="Call 01_POPULATE_STG2_INTEREST_RATE_QUOTE job"
 cd /sasprog/triggers
 if [ -f S_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt  ]
 then
 rm S_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt
 echo   "S_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt deleted "
 else
 echo  "S_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt does not exist"
 fi
 if [ -f U_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt ]
 then
 rm U_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt
 echo  "U_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt deleted"
 else
 echo   "U_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_INTEREST_RATE_QUOTE.sas"
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
 desc="Create multiple trigger file"
 cd /sasprog/triggers
 if [ -f $st ]
 then
 touch S_PH2_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt S_PH2_POPULATE_STG2_4.txt
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
batchname=PH2_POPULATE_STG2_4
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt
st=S_01_POPULATE_STG2_INTEREST_RATE_QUOTE.txt
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

exit $rcode