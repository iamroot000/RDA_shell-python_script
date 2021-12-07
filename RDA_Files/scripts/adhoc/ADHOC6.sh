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
 desc="RESTORE CAR_COPY programs"

 cp -p /sasprog/${lev}/excel/CAR_TEMPLATE_LAYOUT_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/CAR_TEMPLATE_LAYOUT_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/CAR_TEMPLATE_LAYOUT_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/CAR_TEMPLATE_LAYOUT_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BCC_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BCC_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BCC_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BCC_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BCC_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BLC_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BLC_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BLC_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BLC_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BPI_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BPI_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BPI_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_CONSO_LV_1BPI_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BAB_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BAB_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BAB_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BAB_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCC_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCC_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCC_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCC_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCF_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCF_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCF_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BCF_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BFB_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BFB_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BFB_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BFB_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BLC_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BLC_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BLC_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BLC_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BPI_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BPI_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BPI_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1BPI_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1PSB_1.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1PSB_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1PSB_3.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_ADJUSTMENTS_SOLO_LV_1PSB_4.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_DOSRI_1BAB.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_DOSRI_1BCC.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_DOSRI_1BFB.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_DOSRI_1BLC.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_DOSRI_1BPI.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_2IFL_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_DERC_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_DEUR_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_DRRC_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_DSHK_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_DSLN_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_FOREIGN_SUBS_DSSP_2.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_1BAB.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_1BCC.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_1BFB.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_1BFC.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_1BPI.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_2IFL.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_DERC.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_DEUR.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_DRRC.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_DSHK.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_MARKET_RISK_DSSP.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_OPRISK.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_CAR_SUBSIDIARIES.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_FRP_CAR_MAP_P_III_1_SUCCEEDING.sas /sasprog/${lev}/car_copy
 cp -p /sasprog/${lev}/excel/LOAD_FRP_CAR_MAP_P_II_SUCCEEDING.sas /sasprog/${lev}/car_copy

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
 desc="Restore SOURCE_COPY SAS programs"

 cp -p /sasprog/${lev}/excel/LOAD_COPY_ACCOUNT_CREDIT_ASSESSMENT.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_ASSESSMENT_RATING_GRADE.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_BPI_GROUPS.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_CORPORATE_CUSTOMER_SOV.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_COUNTERPARTY_CREDIT_ASSESSMENT.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_EMPLOYEE.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_EMPLOYEE_X_GROUP.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_EXT_OPICS_MTM.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_FINANCIAL_COLLATERAL_IMEX.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_FINANCIAL_COLLATERAL_SICL.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_GUARANTEE_IMEX.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_GUARANTEE_SICL.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_INTERNAL_ORG.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_LANDBANK_INFO.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_SPECIFIC_RESERVES_AUTOMATED.sas /sasprog/${lev}/src_copy
 cp -p /sasprog/${lev}/excel/LOAD_COPY_SPECIFIC_RESERVES_MANUAL.sas /sasprog/${lev}/src_copy

 rcode=$?
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
 desc="Restore COPY_STG SAS programs"

 cp -p /sasprog/${lev}/excel/POPULATE_MAP_MTM_INSTTYPE.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_ACA_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_ACCOUNT_STATUS_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_ADDRESS_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_ASSET_SIZE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_BLOCK_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_CLOSE_REASON_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_COMMITMENT_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_COUNTERPARTY_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_COUNTRY_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_CREDIT_RISK_RATING_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_CRM_SUBTYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_CRM_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_CURRENCY_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_DEPOSIT_ACCOUNT_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_DOSRI_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_ELIGIBLE_CRM_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_FIN_POSITION_STATUS_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_FIN_POSITION_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_INDUSTRY_GROUPS.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_INDUSTRY_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_MTM_FREQ_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_OBSI_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_PAYMENT_FREQUENCY_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_POSTAL_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_PRODUCT_TYPE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_REGULATORY_CNTRPRTY_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_REGULATORY_PRODUCT_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_SENIORITY_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_SOURCE_SYSTEM_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_STATE_CD.sas /sasprog/${lev}/copy_stg
 cp -p /sasprog/${lev}/excel/STG_REF_SUB_PRODUCT_TYPE_CD.sas /sasprog/${lev}/copy_stg

 rcode=$?
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
 desc="Backup MIS SAS programs after makerchecker application migration"

 cp -p /sasprog/${lev}/excel/POPULATE_MIS_DIM_FIRM_SIZE.sas /sasprog/${lev}/mis
 cp -p /sasprog/${lev}/excel/POPULATE_MIS_DIM_INTEREST_RATE.sas /sasprog/${lev}/mis
 cp -p /sasprog/${lev}/excel/POPULATE_MIS_DIM_LOAN_SIZE.sas /sasprog/${lev}/mis
 cp -p /sasprog/${lev}/excel/POPULATE_MIS_DIM_PRODUCT_TYPE.sas /sasprog/${lev}/mis
 cp -p /sasprog/${lev}/excel/POPULATE_MIS_DIM_RESIDUAL_MATURITY.sas /sasprog/${lev}/mis

 rcode=$?
 logrc
 }


#main script

drv=/sasprog/joblog
rdrv=/sasprog/${lev}/rdrv
batchname=ADHOC6
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
