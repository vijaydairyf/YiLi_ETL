-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_BUY_COW_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 新购牛信息 柱状图 日报/月报数据
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

insert overwrite table BIGDATA_DM.PJ_BUY_COW_INFO
   select sum(new_cows) as new_cows
   ,sum(new_adult_cows) as new_adult_cows
   ,sum(new_reserve_cows) as new_reserve_cows
   ,cast(regexp_replace(report_date,'-','') as bigint ) as report_date
   ,cast(regexp_replace(report_month,'-','') as bigint ) as report_month
   ,farm_name
   ,big_area_name
   ,area_name
   ,cities_name
   from BIGDATA_DW.W_BUY_COW_INFO 

   group by report_date
   ,report_month
   ,farm_name
   ,big_area_name
   ,area_name
   ,cities_name
   
   ;
   
   
   
  insert overwrite table  BIGDATA_DM.PJ_BUY_COW_TABLE
   
   SELECT sum(new_cows) as new_cows
   ,grow_stat
   ,cast(regexp_replace(report_date,'-','') as bigint ) as report_date
   ,cast(regexp_replace(report_month,'-','') as bigint ) as report_month
   ,farm_name
   ,big_area_name
   ,area_name
   ,cities_name
   from BIGDATA_DW.W_BUY_COW_INFO

   group by 
   grow_stat
   ,report_date   
   ,report_month
   ,farm_name
   ,big_area_name
   ,area_name
   ,cities_name
   

   ;
   
   
   
   