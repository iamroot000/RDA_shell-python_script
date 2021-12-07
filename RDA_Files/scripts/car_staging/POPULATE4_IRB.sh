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
 desc="POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt
 echo   "S_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt
 echo  "U_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_mart_irb/POPULATE_STG_CAR_P_III_4_P1N2_1BCC_IRB.sas"
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
 desc="POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt
 echo   "S_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt
 echo  "U_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_mart_irb/POPULATE_STG_CAR_P_III_4_P1N2_1BFB_IRB.sas"
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
 desc="POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt
 echo   "S_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt
 echo  "U_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_mart_irb/POPULATE_STG_CAR_P_III_4_P1N2_1BPI_IRB.sas"
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
 desc="POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt
 echo   "S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt
 echo  "U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_mart_irb/POPULATE_STG_CAR_P_III_4_1_P1N2_1BCC_IRB.sas"
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
 desc="POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt
 echo   "S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt
 echo  "U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_mart_irb/POPULATE_STG_CAR_P_III_4_1_P1N2_1BFB_IRB.sas"
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
 desc="POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB"
 cd /sasprog/triggers
 if [ -f S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt  ]
 then
 rm S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt
 echo   "S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt deleted "
 else
 echo  "S_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt does not exist"
 fi
 if [ -f U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt ]
 then
 rm U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt
 echo  "U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt deleted"
 else
 echo   "U_POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.txt does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/car_mart_irb/POPULATE_STG_CAR_P_III_4_1_P1N2_1BPI_IRB.sas"
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
 desc="Create trigger file"
 cd /sasprog/triggers

 touch S_POPULATE4_IRB.txt

 rcode=$?
 rrstep=""
 logrc
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=POPULATE4_IRB
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE4_IRB.txt
st=S_POPULATE4_IRB.txt
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
