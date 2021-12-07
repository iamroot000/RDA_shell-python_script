cd /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/log/schedule_credit_scoring
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 
echo "/sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/log/schedule_credit_scoring"

cp -rp * /sasprog/sasjoblog/DDS_SDM_LOGS

cd /sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/log/schedule_star_schema
echo "/sasconfig/BPICRMS/${lev}/BPIApp/Data/bisdata/log/schedule_star_schema"

cp -rp * /sasprog/sasjoblog/DDS_SDM_LOGS

cd /sasdata/${lev}/Data/bisdata/control

cp -p load_control.sas7bdat parameter_list_star_schema.sas7bdat /sasprog/sasjoblog/DDS_SDM_LOGS

