-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_FODDER_SUPPLIER_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 供应商数据
--=============================================================================
-- creation date:       2019-11-29
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
--2019-11-29 capgemini       
-------------------------------------------------------------------------------
INSERT OVERWRITE TABLE BIGDATA_DW.W_FODDER_SUPPLIER_INFO
select in_inv_amt
,if(supplier_name is null ,'其他',supplier_name)
, cal_price_dt as report_date
,substr(cal_price_dt,1,7) as report_month
,add_months(cal_price_dt,12) as report_date_period
,substr(add_months(cal_price_dt,12),1,7) as report_month_period
,t1.farm_code
,t2.farm_name    
,t2.farm_org_name2 as big_area_name
,t2.farm_org_name3 as area_name
,t2.farm_org_name4 as cities_name
from (
select sum(enter_amt) as in_inv_amt,supplier_name,substr(cal_price_dt,1,10) as cal_price_dt,farm_code
from data_lake.d_fin_inventory_cal_price_dtl 
where goods_type_name = '饲料' and enter_amt is not null 
group by supplier_name,substr(cal_price_dt,1,10) ,farm_code
) t1 left join data_lake.d_pty_farm_base t2 on t1.farm_code = t2.farm_code
where t1.cal_price_dt between t2.open_station_dt and t2.close_station_dt
;




