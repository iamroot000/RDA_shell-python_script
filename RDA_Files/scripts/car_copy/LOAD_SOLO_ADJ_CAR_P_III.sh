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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1A.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1A.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1A.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1A.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1A.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1A.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1A.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1A.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1A.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1B.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1B.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1B.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1B.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1B.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1B.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1B.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1B.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1B.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1C_1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1C_1.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1C_2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1C_2.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1D.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1D.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1D.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1D.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1D.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1D.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1D.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1D.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1D.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_2.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_2.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_2.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_2.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_2.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_2.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_2.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_2.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_3_P1N2.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_3_P3.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_3_P3.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_3_P4.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_3_P4.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_4_P1N2.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_4_P3.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_4_P3.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_4_P4.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_4_P4.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_4A.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_4A.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_4A.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4A.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_4A.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_4A.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_4A.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_4A.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_4A.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_5.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_5.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_5.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_5.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_5.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_5.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_5.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_5.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_5.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_6.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_6.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_6.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_6.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_6.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_6.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_6.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_6.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_6.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_6A.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_6A.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_6A.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_6A.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_6A.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_6A.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_6A.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_6A.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_6A.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_6B.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_6B.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_6B.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_6B.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_6B.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_6B.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_6B.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_6B.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_6B.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1C_P1.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1C_P1.sas"
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
 if [ -f U_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt ]
 then
 rm U_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt
 echo   "U_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt deleted "
 else
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt does not exist"
 fi
 if [ -f S_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt ]
 then
 rm S_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt
 echo  "S_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt deleted"
 else
 echo   "S_LOAD_SOLO_ADJ_CAR_P_III_1C_P2.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_copy/LOAD_SOLO_ADJ_CAR_P_III_1C_P2.sas"
 rcode=$?
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=LOAD_SOLO_ADJ_CAR_P_III
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
exit $rcode