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
     touch /sasprog/triggers/$ut
     if [ -f $rdrv/$batchname".rpm" ]
     then
        cat $rdrv/$batchname".rpm" >> $drv/$batchname".log"
     else
        echo "No Recovery Procedure." >> $drv/$batchname".log"
	touch /sasprog/triggers/$ut
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
 desc="DELETE_EXCEPTION_TABLES"
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
 if [ -f copy_acct_crdt_risk_mitigant_err.sas7bdat copy_counterparty_assoc_err.sas7bdat copy_financial_account_err.sas7bdat copy_financial_inst_crdt_ass_err.sas7bdat copy_gl_account_err.sas7bdat ]
 then
 "cd /sasdata/${lev}/MISMART ; rm copy_exception_table.sas7bdat copy_acct_crdt_risk_mitigant_err.sas7bdat copy_counterparty_assoc_err.sas7bdat copy_financial_account_err.sas7bdat copy_financial_inst_crdt_ass_err.sas7bdat copy_gl_account_err.sas7bdat"
 else
 echo "Tables doesnt exist" >> $drv/$batchname".log"
 fi  
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
 desc="MOVE_EXCEPTION_TABLE"
 $swcode $swuser -c "cp /sasdata/${lev}/ADMIN/exception_table.sas7bdat /sasdata/${lev}/MISMART/copy_exception_table.sas7bdat"
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
 desc="MOVE_STG2_ERR_TABLES"
 $swcode $swuser -c "cd /sasdata/${lev}/STG2_ERR ; cp acct_crdt_risk_mitigant_err.sas7bdat /sasdata/${lev}/MISMART/copy_acct_crdt_risk_mitigant_err.sas7bdat ; cp counterparty_assoc_err.sas7bdat /sasdata/${lev}/MISMART/copy_counterparty_assoc_err.sas7bdat ; cp financial_account_err.sas7bdat /sasdata/${lev}/MISMART/copy_financial_account_err.sas7bdat ; cp financial_inst_crdt_ass_err.sas7bdat /sasdata/${lev}/MISMART/copy_financial_inst_crdt_ass_err.sas7bdat ; cp gl_account_err.sas7bdat /sasdata/${lev}/MISMART/copy_gl_account_err.sas7bdat"
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
 desc="CREATE_TRIGGER_FILE"
 cd /sasprog/triggers
 touch $st
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=MOVE_EXCEPTION_TABLES
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_MOVE_EXCEPTION_TABLES.txt
st=S_MOVE_EXCEPTION_TABLES.txt
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
