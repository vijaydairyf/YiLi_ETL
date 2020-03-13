

-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_MONTH_COW_YIELD_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牛只单产数据
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

insert overwrite table BIGDATA_DM.PJ_MONTH_COW_YIELD_INFO


SELECT SUM(cows_count) AS cows_count
,sum(less15_cows) as less15_cows
,sum(less25_cows) as less25_cows
,sum(less35_cows) as less35_cows
,sum(more35_cows) as more35_cows
, null as report_date
,report_month
,farm_id      
,farm_code    
,farm_name    
,big_area_id  
,big_area_code
,big_area_name
,area_id      
,area_code    
,area_name    
,cities_id    
,cities_code  
,cities_name  
from(select * from  BIGDATA_DW. W_MONTH_COW_YIELD_INFO 
)t1 group by report_month
,farm_id      
,farm_code    
,farm_name    
,big_area_id  
,big_area_code
,big_area_name
,area_id      
,area_code    
,area_name    
,cities_id    
,cities_code  
,cities_name 



;




--- 牛只分析 数据单产视角
--
----

insert overwrite table BIGDATA_DM.PJ_MONTH_COW_YIELD_TABLE


select t2.cows_count as cows_total
,t1.cows_count as cows_count
,t1.milk_type
, null as report_date
,t1.report_month
,t1.farm_name
,t1.big_area_name
,t1.area_name
,t1.cities_name
from (
 select sum(cows_count) as cows_count
 ,milk_type

 ,report_month
 ,farm_name
 ,big_area_name
 ,area_name
 ,cities_name
 from BIGDATA_DW.W_MONTH_COW_YIELD_INFO 
 group by milk_type

 ,report_month
 ,farm_name
 ,big_area_name
 ,area_name
 ,cities_name
) t1
  left join (
  select sum(cows_count) as cows_count
  ,report_month
  ,farm_name
  ,big_area_name
  ,area_name
  ,cities_name
  from BIGDATA_DW.W_MONTH_COW_YIELD_INFO 
  group by report_month
  ,farm_name
  ,big_area_name
  ,area_name
  ,cities_name

)t2 on t1.report_month = t2.report_month and t1.farm_name = t2.farm_name

;