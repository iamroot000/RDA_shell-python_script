cd /sasdata/${lev}/BACKUP/MISMART
# You may declare your common variable in the script below. 
. /BASLSTSP/CDSelect_Script/sasprog/sasprog/scripts/basel.property 
mkdir MISMART_20101029
cd MISMART_20101029
mkdir MIS_BACKUP_FACT
cd /sasdata/${lev}/MISMART
cp -p mis_crm.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_crr.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_borrower_type.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_bsp_industry_group.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_business_center.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_credit_risk_mitigant.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_credit_risk_rating.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_currency.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_firm_size.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_industry_type.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_interest_rate.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_internal_org.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_loan_size.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_product_type.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_dim_residual_maturity.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_firmsize.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_industry.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_interestrate.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_loansize.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_loanterm.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_maturity.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_ref_borrower_group.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_ref_gl_map.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_ref_param_etl.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_ref_samd_accts.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_top1000.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cp -p mis_tportfolio_bcenter.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cd /sasdata/${lev}/ADMIN
cp -p run_dates_mis.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT
cd /sasdata/${lev}/MISMART
cp -p mis_fct_final.sas7bdat /sasdata/${lev}/BACKUP/MISMART/MISMART_20101029/MIS_BACKUP_FACT