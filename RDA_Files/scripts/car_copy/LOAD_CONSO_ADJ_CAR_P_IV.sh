#!/bin/sh
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1.sas"
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1A.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1A.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1B.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1B.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1C.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1C.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_AUD.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_BRL.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_CAD.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_CHF.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_CLP.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_CNY.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_COP.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_DKK.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_EUR.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_GBP.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_HKD.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_HUF.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_IDR.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_ILS.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_INR.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_JPY.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_KRW.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_MXN.sas"
 rcode=$?
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
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_MYR.sas"
 rcode=$?
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_PHP.sas"
 rcode=$?
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_PLN.sas"
 rcode=$?
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_SEK.sas"
 rcode=$?
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_SGD.sas"
 rcode=$?
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_THB.sas"
 rcode=$?
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
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_TRY.sas"
 rcode=$?
 logrc
 }

function step31
{
 step=step31 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_TWD.sas"
 rcode=$?
 logrc
 }

function step32
{
 step=step32 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_USD.sas"
 rcode=$?
 logrc
 }

function step33
{
 step=step33 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_1D_ZAR.sas"
 rcode=$?
 logrc
 }

function step34
{
 step=step34 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_2.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_2.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_2.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_2.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_2.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_2.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_2.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_2.sas"
 rcode=$?
 logrc
 }

function step35
{
 step=step35 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_3.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_3.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_3.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_3.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_3.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_3.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_3.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_3.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_3.sas"
 rcode=$?
 logrc
 }

function step36
{
 step=step36 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_3A.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_3A.sas"
 rcode=$?
 logrc
 }

function step37
{
 step=step37 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4.sas"
 rcode=$?
 logrc
 }

function step38
{
 step=step38 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4A.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4A.sas"
 rcode=$?
 logrc
 }

function step39
{
 step=step39 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4B.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4B.sas"
 rcode=$?
 logrc
 }

function step40
{
 step=step40 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4C_P1.sas"
 rcode=$?
 logrc
 }

function step41
{
 step=step41 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4C_P2.sas"
 rcode=$?
 logrc
 }

function step42
{
 step=step42 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4D_P1.sas"
 rcode=$?
 logrc
 }

function step43
{
 step=step43 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4D_P2.sas"
 rcode=$?
 logrc
 }

function step44
{
 step=step44 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4E_P1.sas"
 rcode=$?
 logrc
 }

function step45
{
 step=step45 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_4E_P2.sas"
 rcode=$?
 logrc
 }

function step46
{
 step=step46 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_5_P1.sas"
 rcode=$?
 logrc
 }

function step47
{
 step=step47 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_5_P2.sas"
 rcode=$?
 logrc
 }

function step48
{
 step=step48 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P3.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_5_P3.sas"
 rcode=$?
 logrc
 }

function step49
{
 step=step49 
if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Call SAS job"
 cd /sasprog/triggers
 if [ -f U_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt ]
 then
 rm U_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt
 echo   "U_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt deleted "
 else
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt does not exist"
 fi
 if [ -f S_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt ]
 then
 rm S_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt
 echo  "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt deleted"
 else
 echo   "S_LOAD_CONSO_ADJ_CAR_P_IV_5_P4.txt does not exist"
fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_CONSO_ADJ_CAR_P_IV_5_P4.sas"
 rcode=$?
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=LOAD_CONSO_ADJ_CAR_P_IV_AMEND
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
step31
step32
step33
step34
step35
step36
step37
step38
step39
step40
step41
step42
step43
step44
step45
step46
step47
step48
step49
exit $rcode