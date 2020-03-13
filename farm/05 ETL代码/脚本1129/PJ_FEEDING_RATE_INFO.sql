-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_FEEDING_RATE_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 繁殖率数据
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


insert  overwrite table BIGDATA_DM.PJ_FEEDING_RATE_INFO 

select t1.breed_youth_cows
,t1.breed_adult_cows
--繁殖牛头数
,t1.breed_cows
,t1.breed_youth_cows_period
,t1.breed_adult_cows_period
,t1.breed_cows_period
,t1.report_month
,substr(t1.report_month,1,4) as report_year
,t1.farm_name
,t1.big_area_name
,t1.area_name
,t1.cities_name
 from (
--- 产犊牛只 当期/同期 数据
 select 
 sum(breed_youth_cows) as breed_youth_cows
 ,sum(breed_adult_cows) as breed_adult_cows
 
 ,sum(breed_cows) as breed_cows
 ,sum(breed_youth_cows_period) as breed_youth_cows_period
 ,sum(breed_adult_cows_period) as breed_adult_cows_period
 ,sum(breed_cows_period) as breed_cows_period
 ,report_month as year_month
 ,cast(regexp_replace(report_month,'-','') as bigint ) as report_month
 ,farm_name
 ,cities_name
 ,area_name
 ,big_area_name


 from 
(
select breed_youth_cows
   ,breed_adult_cows
   ,breed_cows
   ,0 as breed_youth_cows_period
   ,0 as breed_adult_cows_period
   ,0 as breed_cows_period
   ,farm_name
   ,cities_name
   ,area_name
   ,big_area_name
   ,report_date
   ,substr(report_date,1,7) as report_month
    from
    BIGDATA_DW.W_FEEDING_RATE_INFO
    
 union all   

select 0 as breed_youth_cows
   , 0 as breed_adult_cows
   , 0 as  breed_cows
   ,breed_youth_cows as breed_youth_cows_period
   ,breed_adult_cows as breed_adult_cows_period
   ,breed_cows       as  breed_cows_period
   ,farm_name
   ,cities_name
   ,area_name
   ,big_area_name
   -- 将去年时间变为今年
   ,add_months(report_date,12) as report_date
   ,substr(add_months(report_date,12),1,7) as report_month
    from
    BIGDATA_DW.W_FEEDING_RATE_INFO
   
)t1 group by farm_name,cities_name,area_name,big_area_name,report_month

) t1

;


