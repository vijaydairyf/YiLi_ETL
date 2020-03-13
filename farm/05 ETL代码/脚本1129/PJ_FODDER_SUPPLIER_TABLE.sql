
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_FODDER_SUPPLIER_TABLE.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 供应商数据
--=============================================================================
-- creation date:       2019-11-27
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
--2019-11-27 capgemini       
-------------------------------------------------------------------------------


INSERT OVERWRITE TABLE BIGDATA_DM.PJ_FODDER_SUPPLIER_TABLE 
select in_inv_amt
,supplier_name
,cast(regexp_replace(report_date,'-','') as bigint ) as report_date
,cast(regexp_replace(report_month,'-','') as bigint ) as report_month
,cast(regexp_replace(report_date_period,'-','') as bigint ) as report_date_period
,cast(regexp_replace(report_month_period,'-','') as bigint ) as report_month_period
,farm_code
,farm_name    
,big_area_name
,area_name
,cities_name
from BIGDATA_DW.W_FODDER_SUPPLIER_INFO
;