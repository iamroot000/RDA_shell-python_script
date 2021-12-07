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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1BAB_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1BAB_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1BCC_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1BCC_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1BCF_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1BCF_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1BFB_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1BFB_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1BLC_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1BLC_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1BPI_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1BPI_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_1PSB_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_1PSB_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_FOREIGN_SUBS_SSC.sas"
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
 if [ -f S_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt ]
 then
 rm S_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt
 echo   "S_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt
 echo  "U_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_staging/POPULATE_STG_CAR_P_III_1_LOCAL_SUBS_SSC.sas"
 rcode=$?
 logrc
}

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=CAR_P_III_1_SSC
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_CAR_P_III_1_SSC.txt
st=S_CAR_P_III_1_SSC.txt
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

exit $rcode

