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

#LCR - TIMESTAMP
echo "BASLSTSP TIMESTAMP for LCR Jobs"
ls -lrt /sasprog/${lev}/copy_stg/POPULATE_STG_FA_APPLICATION.sas > /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FA_APPLICATION.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasprog/${lev}/stg2_dds/POPULATE_DDS_TABLES_WAVE_08_FINANCIAL_ACCOUNT_APPLICATION.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasprog/${lev}/stg2_dds/POPULATE_DDS_TABLES_WAVE_09_FINANCIAL_ACCOUNT_APPLICANT.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/FA_APP_APPT_FOR_DIM.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/FA_APP_FOR_DIM_EXT.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/APPLICATION_PRE_DIM.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/APPLICATION_DIM.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
ls -lrt /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/X_BPI_ACCT_APPT_ABT.sas >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt
date >> /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt

#LCR - TIMESTAMP ENDS HERE

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

#LCR - PRODDOWN OF SAS JOBS

scp -r /sasprog/${lev}/copy_stg/POPULATE_STG_FA_APPLICATION.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasprog/${lev}/stg_stg2/01_POPULATE_STG2_FA_APPLICATION.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasprog/${lev}/stg2_dds/POPULATE_DDS_TABLES_WAVE_08_FINANCIAL_ACCOUNT_APPLICATION.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasprog/${lev}/stg2_dds/POPULATE_DDS_TABLES_WAVE_09_FINANCIAL_ACCOUNT_APPLICANT.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/FA_APP_APPT_FOR_DIM.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/FA_APP_FOR_DIM_EXT.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/APPLICATION_PRE_DIM.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/APPLICATION_DIM.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/jobs/X_BPI_ACCT_APPT_ABT.sas aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/
scp -r /home/ejsdefiesta/LCR_TIMESTAMP_PROD.txt aixcpid@133.100.205.213:/cygdrive/v/basel/LCR_PRODDOWN/

#LCR - PRODDOWN OF SAS JOBS ENDS HERE

 rcode=$?
 logrc
}

#main script

drv=/sasprog/joblog
rdrv=/sasprog/joblog
batchname=LCR_PRODDOWN_AND_TIMESTAMP
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
exit $rcode

