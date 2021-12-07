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
     cd /sasprog/triggers
     touch $ut
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
 desc="Archive SAS tables"
 cd /sasprog/triggers
 if [ -f S_ARCHIVE_ADJUSTMENTS_XFILES.txt ]
 then
 rm S_ARCHIVE_ADJUSTMENTS_XFILES.txt
 echo   "S_ARCHIVE_ADJUSTMENTS_XFILES.txt deleted "
 else
 echo  "S_ARCHIVE_ADJUSTMENTS_XFILES.txt does not exist"
 fi
 if [ -f U_ARCHIVE_ADJUSTMENTS_XFILES.txt ]
 then
 rm U_ARCHIVE_ADJUSTMENTS_XFILES.txt
 echo  "U_ARCHIVE_ADJUSTMENTS_XFILES.txt deleted"
 else
 echo  "U_ARCHIVE_ADJUSTMENTS_XFILES.txt does not exist"
 fi
 
 flag=0
 cd $parm_drv
 if [ -f $tblList ]
  then
   while read xTbl
    do
     if [ $rcode -lt 2 ]
      then
      isexist=`ls $src_drv/$xTbl | wc -l`
      if [ $isexist == 1 ]
        then
         mv $src_drv/$xTbl $archive_drv/$xTbl
         if [ $? == 0 ]
          then
           echo $xTbl is moved in the archived directory!
           gzip -9f $archive_drv/$xTbl
           if [ $? == 0 ]
            then
              echo $xTbl successfully zipped!
            else
              rcode=2
              touch $trigger_drv/$ut
            fi
          else
           rcode=2
           touch $trigger_drv/$ut
         fi
      else
        echo $xTbl is missing. Table is not moved!
      fi
     fi
   done < $tblList
 else
   echo $tblList is missing!
   rcode=2
   touch $trigger_drv/$ut
 fi
 logrc
 }


function step02
{
 step=step03
 if [ "$rrstep" != "" ] && [ "$rrstep" != "$step" ]
 then
    echo $step skipped
    return 0
 fi
 desc="Create trigger file"
 touch $trigger_drv/$st
 rrstep=""
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
parm_drv=/sasdata/PARAMCARD
src_drv=/sasdata/${lev}/XFILES
archive_drv=/sasdata/${lev}/XFILES/ARCHIVE
trigger_drv=/sasprog/triggers
batchname=ARCHIVE_ADJUSTMENTS_XFILES
tblList=ARCHIVE_ADJUSTMENTS_LIST.txt
dtx=`date +'%y%m%d'`"   "`date +'%H%M%S'`
rrstep=""
bpsw=0
ut=U_ARCHIVE_ADJUSTMENTS_XFILES.txt
st=S_ARCHIVE_ADJUSTMENTS_XFILES.txt
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

