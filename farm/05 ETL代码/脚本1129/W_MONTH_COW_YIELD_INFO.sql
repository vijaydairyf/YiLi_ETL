-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_MONTH_COW_YIELD_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牛只产奶量月报数据
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
 insert overwrite table BIGDATA_DW.W_MONTH_COW_YIELD_INFO 
   select ear_no
   ,avg_milk

, 1 as cows_count
,case when avg_milk <15 then '小于15kg'
      when avg_milk >=15 and  avg_milk <25 then '15-25kg'
      when avg_milk >=25 and  avg_milk <35 then '25-35kg'
      when avg_milk >=35  then '大于35kg'
end as milk_type
,case when avg_milk <15 then 1 else 0 end as less15_cows
,case when avg_milk >=15 and avg_milk <25 then 1 else 0 end as less25_cows
,case when avg_milk >=25 and avg_milk <35  then 1 else 0 end as less35_cows
,case when avg_milk >=35 then 1 else 0 end as more35_cows

,cast(regexp_replace(t3.report_month,'-','') as bigint ) as report_month
,t4.farm_id
,t4.farm_code as  farm_code
,t4.farm_name as  farm_name
,t4.farm_org_id2 as big_area_id
,t4.farm_org_code2 as big_area_code
,t4.farm_org_name2 as big_area_name
,t4.farm_org_id3 as area_id
,t4.farm_org_code3 as area_code
,t4.farm_org_name3 as area_name
,t4.farm_org4_id as cities_id
,t4.farm_org_code4 as cities_code
,t4.farm_org_name4 as cities_name

   
   from (
   select milk_sum/count_num as avg_milk,t1.farm_code,t1.ear_no,t1.report_month from (
   -- 每头牛每月 挤奶次数
   select count(1) as count_num ,t1.farm_code,ear_no,substr(milk_dt,1,7) as report_month from 
   (
   select sum(milk_daily_yield) as milk_daily_yield,farm_code,ear_no,substr(milk_dt,1,10) as milk_dt  
   from  data_lake.d_sts_dairy_cow_yield 
   where milk_daily_yield is not null 
   group by farm_code,ear_no,substr(milk_dt,1,10),cow_id
   ) t1 group by farm_code,ear_no,substr(milk_dt,1,7)
  )t1 left join (
   -- 每头牛每月 挤奶量
   select sum(milk_daily_yield) as milk_sum ,farm_code,ear_no,substr(milk_dt,1,7) as report_month from 
   (
   select sum(milk_daily_yield) as milk_daily_yield,farm_code,ear_no,substr(milk_dt,1,10) as milk_dt  
   from  data_lake.d_sts_dairy_cow_yield 
   where milk_daily_yield is not null 
   group by farm_code,ear_no,substr(milk_dt,1,10),cow_id
   ) t1 group by farm_code,ear_no,substr(milk_dt,1,7)
  )t2 on t1.farm_code = t2.farm_code and t1.ear_no = t2.ear_no and t1.report_month = t2.report_month
   )t3  left join data_lake.d_pty_farm_base t4 
on t3.farm_code = t4.farm_code

;
   





