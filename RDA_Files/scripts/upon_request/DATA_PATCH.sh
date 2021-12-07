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
   if [ $rcode != 0 ]
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
 desc="Read DATA_PATCH_PROGLIST.txt program"
  cd $parm_drv
  if [ -f $prog_list ]
  then
    while read xjob 
    	do
      		step=$xjob
      		desc="Run sas program" 
     		$swcode $swuser -c "cd $saslog_drv ; $exesas $sasprog_drv/$xjob.sas"  
		if [ -f $saslog_drv/$xjob.log ]
     		then
      		  iserror=`grep "ERROR:" $saslog_drv/$xjob.log | wc -l`
			error_msg2=`grep "ERROR:" $saslog_drv/$xjob.log`
			if [ $iserror != 0 ]
			then
			  if ! [ -f $error_drv/$error_file ]
			     then 
			     touch $error_drv/$error_file
			  fi
			  echo "Error in $sasprog_drv/$xjob.sas program." >> $error_drv/$error_file
			  echo "	Details:" $error_msg2 >> $error_drv/$error_file
			  error_msg=""	
		       fi
		else
			  if ! [ -f $error_drv/$error_file ]
			     then 
			     touch $error_drv/$error_file
			  fi
			  echo "The $sasprog_drv/$xjob.sas program and $saslog_drv/$xjob.log do not exist." >> $error_drv/$error_file
			  error_msg=""	
		  
    		fi 
	 	rrstep=""
    		logrc	
    	done < $prog_list
  else 
   touch $error_drv/$error_file
   echo $parm_drv/$prog_list " does not exist."  >> $error_drv/$error_file
   rrstep=""
   logrc
  fi 
}

#main script

drv=/sasprog/joblog
rdrv=/sasprog/joblog
saslog_drv=/sasprog/sasjoblog
parm_drv=/sasdata/PARAMCARD
prog_list=DATA_PATCH_PROGLIST.txt
sasprog_drv=/sasprog/${lev}/upon_request
batchname=DATA_PATCH
error_drv=/sasprog/triggers
error_file=DATA_PATCH_ERROR.txt
error_msg=""
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



exit $rcode

#end of script
