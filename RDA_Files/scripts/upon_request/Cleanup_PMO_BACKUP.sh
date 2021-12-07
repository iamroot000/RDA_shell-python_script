cd /sasdata/${lev}/BACKUP/MISMART
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 
rm -r MISMART_20100728
rm -r MISMART_20100701
rm -r MISMART_20100531
cd /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
gzip *
cd /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_GL
gzip *
cd /sasdata/${lev}/BACKUP/MISMART/MISMART_20101030/MIS_BACKUP_DET1
gzip *
cd /sasdata/${lev}/BACKUP/MISMART/MISMART_20101030/MIS_BACKUP_AGGR1
gzip *
cd /sasdata/${lev}/BACKUP/MISMART/MISMART_20101030/MIS_BACKUP_AGGR2
gzip *
cd /sasdata/${lev}/MISMART/BKUP_20100729
gzip *
cd /sasdata/${lev}/MISMART/BACKUP_FEB2010
gzip *