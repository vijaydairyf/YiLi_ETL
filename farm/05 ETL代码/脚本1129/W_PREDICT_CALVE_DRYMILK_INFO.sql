-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_PREDICT_CALVE_DRYMILK_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 预计产犊干奶数仓数据
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

insert overwrite table BIGDATA_DW.W_PREDICT_CALVE_DRYMILK_INFO 

select 
cow_id
,grow_stat
,pre_wean_milk_dt
,pre_calving_dt
-- 预计产犊时间大于等于下一个月  ，小于等于下三个月
,case when cast(regexp_replace(substr(pre_calving_dt,1,7),'-','') as bigint ) >= cast(regexp_replace(substr(add_months(current_date,1),1,7),'-','') as bigint ) 
and cast(regexp_replace(substr(pre_calving_dt,1,7),'-','') as bigint ) <=
cast(regexp_replace(substr(add_months(current_date,3),1,7),'-','') as bigint )  then 1 else 0 end as pre_3mon_calve_cows

,case when cast(regexp_replace(substr(pre_wean_milk_dt,1,7),'-','') as bigint ) >= cast(regexp_replace(substr(add_months(current_date,1),1,7),'-','') as bigint ) 
and  cast(regexp_replace(substr(pre_wean_milk_dt,1,7),'-','') as bigint ) <=
cast(regexp_replace(substr(add_months(current_date,3),1,7),'-','') as bigint )  then 1 else 0 end as pre_3mon_dry_cows

,case when cast(regexp_replace(substr(pre_calving_dt,1,7),'-','') as bigint ) = cast(regexp_replace(substr(add_months(current_date,1),1,7),'-','') as bigint )   then 1 else 0 end as next_1mon_calve_cows

,case when cast(regexp_replace(substr(pre_wean_milk_dt,1,7),'-','') as bigint ) = cast(regexp_replace(substr(add_months(current_date,1),1,7),'-','') as bigint )   then 1 else 0 end as next_1mon_dry_cows

,case when cast(regexp_replace(substr(pre_calving_dt,1,7),'-','') as bigint ) = cast(regexp_replace(substr(add_months(current_date,2),1,7),'-','') as bigint )   then 1 else 0 end as next_2mon_calve_cows

,case when cast(regexp_replace(substr(pre_wean_milk_dt,1,7),'-','') as bigint ) = cast(regexp_replace(substr(add_months(current_date,2),1,7),'-','') as bigint )   then 1 else 0 end as next_2mon_dry_cows
,case when cast(regexp_replace(substr(pre_calving_dt,1,7),'-','') as bigint ) = cast(regexp_replace(substr(add_months(current_date,3),1,7),'-','') as bigint )   then 1 else 0 end as next_3mon_calve_cows
,case when cast(regexp_replace(substr(pre_wean_milk_dt,1,7),'-','') as bigint ) = cast(regexp_replace(substr(add_months(current_date,3),1,7),'-','') as bigint )   then 1 else 0 end as next_3mon_dry_cows
,current_date as report_date
,substr(current_date,1,7) as report_month
,t1.farm_name
,t2.farm_org_name2 as big_area_name
,t2.farm_org_name3 as area_name
,t2.farm_org_name4 as cities_name

from data_lake.d_sts_cow_daily_stat_info t1
left join data_lake.d_pty_farm_base t2 
on t1.farm_code = t2.farm_code;
