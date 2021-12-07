cd /tmp
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 

mkdir OLAP_Cube

cd /sasprog/${lev}/mis

echo "/sasprog/${lev}/mis"

cp -rp LOAN_PORTFOLIO_R1.sas LOAN_PORTFOLIO_R2.sas LOAN_PORTFOLIO_R1_R2.sas NPA_HISTORICALLEVEL.sas /tmp/OLAP_Cube

cd /tmp/OLAP_Cube

chmod -R 777 *

scp -r /tmp/OLAP_Cube/ aixcpid@133.100.205.213:/cygdrive/v/basel_pmo/
