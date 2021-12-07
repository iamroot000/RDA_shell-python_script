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
 desc="POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK"
 cd /sasprog/triggers
 if [ -f S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt  ]
 then
 rm S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt
 echo   "S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt deleted "
 else
 echo  "S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt does not exist"
 fi
 if [ -f U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt ]
 then
 rm U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt
 echo  "U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt deleted"
 else
 echo   "U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_INDIVIDUAL_CUSTOMER_FOR_CARDLINK.sas"
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
 desc="POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK"
 cd /sasprog/triggers
 if [ -f S_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt  ]
 then
 rm S_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt
 echo   "S_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt deleted "
 else
 echo  "S_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt does not exist"
 fi
 if [ -f U_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt ]
 then
 rm U_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt
 echo  "U_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt deleted"
 else
 echo   "U_POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CORPORATE_CUSTOMER_FOR_CARDLINK.sas"
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
 desc="POPULATE_CREDIT_FACILITY_FOR_CARDLINK"
 cd /sasprog/triggers
 if [ -f S_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt  ]
 then
 rm S_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt
 echo   "S_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt deleted "
 else
 echo  "S_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt does not exist"
 fi
 if [ -f U_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt ]
 then
 rm U_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt
 echo  "U_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt deleted"
 else
 echo   "U_POPULATE_CREDIT_FACILITY_FOR_CARDLINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_CREDIT_FACILITY_FOR_CARDLINK.sas"
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
 desc="POPULATE_GUARANTEE_FOR_CARDLINK"
 cd /sasprog/triggers
 if [ -f S_POPULATE_GUARANTEE_FOR_CARDLINK.txt  ]
 then
 rm S_POPULATE_GUARANTEE_FOR_CARDLINK.txt
 echo   "S_POPULATE_GUARANTEE_FOR_CARDLINK.txt deleted "
 else
 echo  "S_POPULATE_GUARANTEE_FOR_CARDLINK.txt does not exist"
 fi
 if [ -f U_POPULATE_GUARANTEE_FOR_CARDLINK.txt ]
 then
 rm U_POPULATE_GUARANTEE_FOR_CARDLINK.txt
 echo  "U_POPULATE_GUARANTEE_FOR_CARDLINK.txt deleted"
 else
 echo   "U_POPULATE_GUARANTEE_FOR_CARDLINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_GUARANTEE_FOR_CARDLINK.sas"
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
 desc="POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK"
 cd /sasprog/triggers
 if [ -f S_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt  ]
 then
 rm S_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt
 echo   "S_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt deleted "
 else
 echo  "S_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt does not exist"
 fi
 if [ -f U_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt ]
 then
 rm U_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt
 echo  "U_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt deleted"
 else
 echo   "U_POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_FINANCIAL_COLLATERAL_FOR_CARDLINK.sas"
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
 desc="POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK"
 cd /sasprog/triggers
 if [ -f S_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt  ]
 then
 rm S_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt
 echo   "S_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt deleted "
 else
 echo  "S_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt does not exist"
 fi
 if [ -f U_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt ]
 then
 rm U_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt
 echo  "U_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt deleted"
 else
 echo   "U_POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_EXPOSURE_CRM_LINK_FOR_CARDLINK.sas"
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
 desc="POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS"
 cd /sasprog/triggers
 if [ -f S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt  ]
 then
 rm S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt
 echo   "S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt deleted "
 else
 echo  "S_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt does not exist"
 fi
 if [ -f U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt ]
 then
 rm U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt
 echo  "U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt deleted"
 else
 echo   "U_POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_INDIVIDUAL_CUSTOMER_FOR_OPICS.sas"
 rcode=$?
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE_FOR_CARDLINK_OPICS
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
step07
exit $rcode


