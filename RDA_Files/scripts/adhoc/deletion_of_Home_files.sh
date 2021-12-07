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
 desc="Call to delete selected directories under directory /home"

#REMOVAL OF FILES AND FOLDERS ROUTINE STARTS HERE


rm -r /home/alvilla
rm -r /home/bfpatricio
rm -r /home/bmilu
rm -r /home/co-acfbarrios
rm -r /home/co-afloyola
rm -r /home/co-aisolivar
rm -r /home/co-dfrepollo
rm -r /home/co-dvbaseleres
rm -r /home/co-dvlongos
rm -r /home/co-ebpgianan
rm -r /home/co-feasprec
rm -r /home/co-gsgallardo
rm -r /home/co-jdbllarenas
rm -r /home/co-krtdelacruz
rm -r /home/co-lapanganiban
rm -r /home/co-lpsmacanip
rm -r /home/co-mdgonzaga
rm -r /home/co-mvrtabien
rm -r /home/co-qzdizon
rm -r /home/co-rrcifra
rm -r /home/co-rslimos
rm -r /home/co161993
rm -r /home/co163215
rm -r /home/co169602
rm -r /home/co169603
rm -r /home/co169604
rm -r /home/co170070170070
rm -r /home/co171562
rm -r /home/ddataguibao
rm -r /home/drhaleja
rm -r /home/fycanita
rm -r /home/ggnzales
rm -r /home/glvillareal
rm -r /home/guest
rm -r /home/jfcsevilla
rm -r /home/jlazatin
rm -r /home/jpppanlaqui
rm -r /home/jssaclolo
rm -r /home/kcunanan
rm -r /home/laabe
rm -r /home/lavabe
rm -r /home/ncmangalindan
rm -r /home/out.txt
rm -r /home/sredolme
rm -r /home/testing
rm -r /home/user1

#REMOVAL OF FILES AND FOLDERS ROUTINE ENDS HERE

 rcode=$?
 echo $rcode
 logrc
 }



#main script

drv=/sasprog/joblog
rdrv=/sasprog/joblog
batchname=deletion_of_Home_files
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

