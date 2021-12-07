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
 desc="RESTORE_PH2_POPULATE_DDS_TABLES_WAVE_10"
 cd /sasprog/triggers
 if [ -f $ut  ]
 then
 rm $ut
 echo  $ut " deleted "
 else
 echo $ut " does not exist"
 fi
 if [ -f $st ]
 then
 rm $st
 echo $st " deleted"
 else
 echo  $st " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/recovery/RESTORE_POPULATE_DDS_TABLES_WAVE_10.sas"
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
 desc="Run Restore_Expire_Financial_Inst_Credit_Assess"
 cd /sasprog/triggers

 if [ -f S_EXPIRE_ACTIVE_FINANCIAL_INST_CREDIT_ASSESS.txt ]
 then
 $swcode $swuser -c "cd /sasdata/${lev}/BACKUP/DDS ; cp financial_inst_credit_assess.sas7bdat financial_inst_credit_assess.sas7bndx /sasdds/${lev}/"
 fi

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
 desc="Rerun POPULATE_FIN_INST_CRDT_ASSESS_AND_ACCT_CRDT_ASSESS_FOR_XLS"
 cd /sasprog/triggers

 if [ -f S_EXPIRE_ACTIVE_FINANCIAL_INST_CREDIT_ASSESS.txt ]
 then
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/copy_stg/POPULATE_FIN_INST_CRDT_ASSESS_AND_ACCT_CRDT_ASSESS_FOR_XLS.sas"
 fi

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
 desc="Rerun 01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS"
 cd /sasprog/triggers

 if [ -f S_EXPIRE_ACTIVE_FINANCIAL_INST_CREDIT_ASSESS.txt ]
 then
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FINANCIAL_INST_CREDIT_ASSESS.sas"
 fi

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
 desc="Create trigger file"
 cd /sasprog/triggers

 touch S_RESTORE_PH2_POPULATE_DDS_TABLES_WAVE_10.txt

 rcode=$?
 rrstep=""
 logrc
 }



#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=RESTORE_PH2_POPULATE_DDS_TABLES_WAVE_10
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_RESTORE_POPULATE_DDS_TABLES_WAVE_10.txt
st=S_RESTORE_POPULATE_DDS_TABLES_WAVE_10.txt
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
exit $rcode