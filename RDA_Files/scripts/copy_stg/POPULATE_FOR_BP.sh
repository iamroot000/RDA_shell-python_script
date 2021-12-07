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
 desc="POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP"
 cd /sasprog/triggers
 if [ -f S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt  ]
 then
 rm S_POPOPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt
 echo   "S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt deleted "
 else
 echo  "S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt does not exist"
 fi
 if [ -f U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt ]
 then
 rm U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt
 echo  "U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt deleted"
 else
 echo   "U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_INDIVIDUAL_CUSTOMER_FOR_BP.sas"
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
 desc="POPULATE_CORPORATE_CUSTOMER_FOR_BP"
 cd /sasprog/triggers
 if [ -f S_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt  ]
 then
 rm S_POPOPULATE_CORPORATE_CUSTOMER_FOR_BP.txt
 echo   "S_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt deleted "
 else
 echo  "S_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt does not exist"
 fi
 if [ -f U_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt ]
 then
 rm U_POPULATE_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt
 echo  "U_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt deleted"
 else
 echo   "U_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CORPORATE_CUSTOMER_FOR_BP.sas"
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
 desc="POPULATE_CREDIT_FACILITY_FOR_BP"
 cd /sasprog/triggers
 if [ -f S_POPULATE_CREDIT_FACILITY_FOR_BP.txt  ]
 then
 rm S_POPULATE_CREDIT_FACILITY_FOR_BP.txt
 echo   "S_POPULATE_CREDIT_FACILITY_FOR_BP.txt deleted "
 else
 echo  "S_POPULATE_CREDIT_FACILITY_FOR_BP.txt does not exist"
 fi
 if [ -f U_POPULATE_CREDIT_FACILITY_FOR_BP.txt ]
 then
 rm U_POPULATE_POPULATE_CREDIT_FACILITYFOR_BP.txt
 echo  "U_POPULATE_CREDIT_FACILITY_FOR_BP.txt deleted"
 else
 echo   "U_POPULATE_CORPORATE_CUSTOMER_FOR_BP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CREDIT_FACILITY_FOR_BP.sas"
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
 desc="POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD"
 cd /sasprog/triggers
 if [ -f S_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt  ]
 then
 rm S_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt
 echo   "S_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt deleted "
 else
 echo  "S_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt does not exist"
 fi
 if [ -f U_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt ]
 then
 rm U_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt
 echo  "U_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt deleted"
 else
 echo   "U_POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_LOAN_ACCOUNT_FOR_BP_SUCCEEDING_LOAD.sas"
 rcode=$?
 rrstep=""
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_FOR_BP
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_FOR_BP.txt
st=S_POPULATE_FOR_BP.txt
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
exit $rcode



