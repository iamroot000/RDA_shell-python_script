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
 desc="POPULATE_DDS_TABLES_WAVE_09"
 cd /sasprog/triggers
 if [ -f U_POPULATE_DDS_TABLES_WAVE_09.txt  ]
 then
 rm U_POPULATE_DDS_TABLES_WAVE_09.txt
 echo  U_POPULATE_DDS_TABLES_WAVE_09.txt " deleted "
 else
 echo U_POPULATE_DDS_TABLES_WAVE_09.txt " does not exist"
 fi
 if [ -f S_POPULATE_DDS_TABLES_WAVE_09.txt ]
 then
 rm S_POPULATE_DDS_TABLES_WAVE_09.txt
 echo S_POPULATE_DDS_TABLES_WAVE_09.txt " deleted"
 else
 echo  S_POPULATE_DDS_TABLES_WAVE_09.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg2_dds/POPULATE_DDS_TABLES_WAVE_09.sas"
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
 desc="POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE"
 cd /sasprog/triggers
 if [ -f U_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt  ]
 then
 rm U_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt
 echo  U_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt " deleted "
 else
 echo U_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt " does not exist"
 fi
 if [ -f S_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt ]
 then
 rm S_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt
 echo S_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt " deleted"
 else
 echo  S_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt " does not exist"
 fi
 $swcode $swuser -c "${dirlog} $exesas /sasprog/${lev}/stg2_dds/POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.sas"
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
 desc="Backup DDS.FINANCIAL_INSTRUMENT"
 $swcode $swuser -c "${dirlog} cp /sasdds/${lev}/financial_instrument.* /sasdata/${lev}/BACKUP/DDS"
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
 desc="Create multiple trigger file"
 cd /sasprog/triggers
 touch S_PH2_POPULATE_DDS_TABLES_WAVE_09.txt S_PH2_POPULATE_DDS_TABLES_WAVE_09_CTRPRTY_ASSC_ERR_UPDATE.txt 
 rcode=$?
 rrstep=""
 logrc
 }




#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=PH2_POPULATE_DDS_TABLES_WAVE_09
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_POPULATE_DDS_TABLES_WAVE_09.txt
st=S_POPULATE_DDS_TABLES_WAVE_09.txt
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