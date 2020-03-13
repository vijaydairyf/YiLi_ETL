-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_RESERVE_COWS_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 后备牛 柱状图 日报/月报数据
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

insert overwrite table  bigdata_dm.PJ_RESERVE_COWS_INFO
 
 select cow_count,reserve_cows,grow_stat,
 

 cast(regexp_replace(substr(report_date,1,10),'-','') as bigint ),
 cast(regexp_replace(substr(report_month,1,7),'-','') as bigint )
 ,data_type,farm_name,big_area_name,area_name, cities_name  from (

select  lactation_calf as cow_count,reserve_cows ,'哺乳犊牛' as grow_stat,report_date,'0' as report_month,1 as  data_type ,farm_name,big_area_name,area_name, cities_name from BIGDATA_DW.W_COW_HERD_INFO
union all 
select  weaning_calf as cow_count,reserve_cows ,'断奶犊牛' as grow_stat,report_date,'0' as report_month,1 as  data_type ,farm_name,big_area_name,area_name, cities_name from BIGDATA_DW.W_COW_HERD_INFO 
union all 
select  bred_cows as cow_count,reserve_cows ,'育成牛' as grow_stat,report_date,'0' as report_month,1 as  data_type ,farm_name,big_area_name,area_name, cities_name from BIGDATA_DW.W_COW_HERD_INFO 
union all 
select  youth_cows as cow_count,reserve_cows ,'青年牛' as grow_stat,report_date,'0' as report_month,1 as  data_type ,farm_name,big_area_name,area_name, cities_name from BIGDATA_DW.W_COW_HERD_INFO 


--  月度数据  哺乳犊牛
union all 
select t2.lactation_calf as cow_count,t2.reserve_cows ,'哺乳犊牛' as grow_stat,substr(t2.report_date,1,10) as report_date,substr(t2.report_date,1,7) as report_month,2 as  data_type ,farm_name,big_area_name,area_name, cities_name
from (
  select farm_code,substr(report_date,1,7) as report_month ,count(1) 
  from BIGDATA_DW.W_COW_HERD_INFO 
  group by farm_code,substr(report_date,1,7)
)t1 inner join (select * from BIGDATA_DW.W_COW_HERD_INFO  ) t2
  on last_day(concat(report_month,'-01')) = substr(t2.report_date,1,10)
  and t1.farm_code = t2.farm_code

--  月度数据  断奶犊牛
union all 
select t2.weaning_calf as cow_count,t2.reserve_cows ,'断奶犊牛' as grow_stat,substr(t2.report_date,1,10) as report_date,substr(t2.report_date,1,7) as report_month,2 as  data_type ,farm_name,big_area_name,area_name, cities_name
from (
  select farm_code,substr(report_date,1,7) as report_month ,count(1) 
  from BIGDATA_DW.W_COW_HERD_INFO 
  group by farm_code,substr(report_date,1,7)
)t1 inner join (select * from BIGDATA_DW.W_COW_HERD_INFO  ) t2
  on last_day(concat(report_month,'-01')) = substr(t2.report_date,1,10)
  and t1.farm_code = t2.farm_code

--  月度数据  育成牛
union all 
select t2.bred_cows as cow_count,t2.reserve_cows ,'育成牛' as grow_stat,substr(t2.report_date,1,10) as report_date,substr(t2.report_date,1,7) as report_month,2 as  data_type ,farm_name,big_area_name,area_name, cities_name
from (
  select farm_code,substr(report_date,1,7) as report_month ,count(1) 
  from BIGDATA_DW.W_COW_HERD_INFO 
  group by farm_code,substr(report_date,1,7)
)t1 inner join (select * from BIGDATA_DW.W_COW_HERD_INFO  ) t2
  on last_day(concat(report_month,'-01')) = substr(t2.report_date,1,10)
  and t1.farm_code = t2.farm_code
  
--  月度数据  青年牛
union all 
select t2.youth_cows as cow_count,t2.reserve_cows ,'青年牛' as grow_stat,substr(t2.report_date,1,10) as report_date,substr(t2.report_date,1,7) as report_month,2 as  data_type ,farm_name,big_area_name,area_name, cities_name
from (
  select farm_code,substr(report_date,1,7) as report_month ,count(1) 
  from BIGDATA_DW.W_COW_HERD_INFO 
  group by farm_code,substr(report_date,1,7)
)t1 inner join (select * from BIGDATA_DW.W_COW_HERD_INFO  )  t2
  on last_day(concat(report_month,'-01')) = substr(t2.report_date,1,10)
  and t1.farm_code = t2.farm_code
  
  ) tr;
  
  