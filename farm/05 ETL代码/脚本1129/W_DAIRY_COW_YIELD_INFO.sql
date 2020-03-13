
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_DAIRY_COW_YIELD_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牛只日产奶数据
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

  insert overwrite table BIGDATA_DW.W_DAIRY_COW_YIELD_INFO 

select ear_no

,milk_daily_yield
, 1 as cows_count
,case when milk_daily_yield <15 then '小于15kg'
      when milk_daily_yield >=15 and  milk_daily_yield <25 then '15-25kg'
      when milk_daily_yield >=25 and  milk_daily_yield <35 then '25-35kg'
      when milk_daily_yield >=35  then '大于35kg'
end as milk_type
,case when milk_daily_yield <15 then 1 else 0 end as less15_cows
,case when milk_daily_yield >=15 and milk_daily_yield <25 then 1 else 0 end as less25_cows
,case when milk_daily_yield >=25 and milk_daily_yield <35  then 1 else 0 end as less35_cows
,case when milk_daily_yield >=35 then 1 else 0 end as more35_cows
,cast(regexp_replace(substr(t1.milk_dt,1,10),'-','') as bigint ) as report_date
,cast(regexp_replace(substr(t1.milk_dt,1,7),'-','') as bigint ) as report_month
,t1.farm_id
,t2.farm_code as  farm_code
,t2.farm_name as  farm_name
,t2.farm_org_id2 as big_area_id
,t2.farm_org_code2 as big_area_code
,t2.farm_org_name2 as big_area_name
,t2.farm_org_id3 as area_id
,t2.farm_org_code3 as area_code
,t2.farm_org_name3 as area_name
,t2.farm_org4_id as cities_id
,t2.farm_org_code4 as cities_code
,t2.farm_org_name4 as cities_name

from(select * from  data_lake.d_sts_dairy_cow_yield where milk_daily_yield is not null )t1

left join data_lake.d_pty_farm_base t2 
on t1.farm_code = t2.farm_code

;



