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
 cd $error_drv
  if [ -f $error_file  ]
  then rm $error_file
  echo $error_file " deleted "
  else echo $error_file " does not exist"
  fi
 desc="Read XFILES_COPY.txt program"
  cd $parm_drv
  if [ -f $prog_list ]
  then 
    echo "xfiles copy exist"
    while read xtbl xtbl2
        do
	step=$xtbl
	echo "read file"
	desc="Copy Tables"
	cd $srcd
		if [ -f $xtbl ]
		then cp -p $srcd/$xtbl $trgtd/$xtbl2
			rcode=$?
			echo $rcode
			if [ $rcode == 0 ]
			then echo "copied file"
			else echo "FAILED COPY"  > $error_drv/$error_file
			fi
		else
		echo "no source file"
		fi
	logrc
	done < $prog_list
  else
   echo $parm_drv/$prog_list " does not exist."  > $error_drv/$error_file
   rrstep=""
   logrc
  fi
}

#main script
	
drv=/sasprog/joblog
rdrv=/sasprog/joblog
srcd=/sasdata/${lev}/XFILES
trgtd=/sasdata/${lev}/COPY
saslog_drv=/sasprog/sasjoblog
parm_drv=/sasdata/PARAMCARD
prog_list=XFILES_COPY.txt
sasprog_drv=/sasprog/${lev}/upon_request
batchname=XFILES_COPY
error_drv=/sasprog/triggers
error_file=XFILES_COPY_ERROR.txt
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