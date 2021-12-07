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

 desc="Deletion of trigger file" 
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
 
 desc="Deletion of temporary SAS tables/index & release of trigger file" 
 cd $parm_drv
 echo > $log_drv/$log_file
 if [ -f $tmptbl_lst ]
  then
 	while read xtbl
	  do
	   if [ -f $xtbl ]
	    then
	     $swcode $swuser -c "rm -f $xtbl"
	     echo $xtbl deleted successfully! >> $log_drv/$log_file
	   else
	     touch $log_drv/$log_file
	     echo $xtbl " does not exist."  >> $log_drv/$log_file
	   fi 
	done < $tmptbl_lst
       touch /sasprog/triggers/$st
	rcode=$? 
	rrstep=""
	logrc 
 else
   	touch $log_drv/$log_file
	echo $parm_drv/$tmptbl_lst " does not exist." > $log_drv/$log_file
       touch /sasprog/triggers/$ut
  rcode=$? 
  rrstep=""
  logrc
 fi  
 }

#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
parm_drv=/sasdata/PARAMCARD
log_drv=/sasprog/joblog
tmptbl_lst=TEMP_TABLES_LIST.txt
log_file=DELETE_TEMP_TABLES_EOMD5_LOG.log
batchname=DELETE_TEMP_TABLES_EOMD5
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_DELETE_TEMP_TABLES_EOMD5.txt
st=S_DELETE_TEMP_TABLES_EOMD5.txt
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

#end of script
