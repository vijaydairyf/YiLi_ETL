
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_FARM_GREEN_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牧场环保设施数据
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



insert overwrite table BIGDATA_DM.PJ_FARM_GREEN_INFO 
select 

t1.eve_pro_farm
,t1.year_month
,t1.farm_pro_type
,t1.farm_pro_fac_type
,t1.farm_pro_fac_year_type
,t1.big_area_id
,t1.big_area_name
,t1.area_id
,t1.area_name

FROM (
select 
  
sum(if(eve_pro_farm is null,0,eve_pro_farm)) as eve_pro_farm 
,cast(regexp_replace(year_month,'-','') as bigint ) as year_month
,farm_pro_type
,farm_pro_fac_type
,farm_pro_fac_year_type
,big_area_id
,big_area_name
,area_id
,area_name
 FROM BIGDATA_DW.W_FARM_GREEN_INFO
 where   
 -- 过滤掉安装年月为 空的数据
  year_month is not null 
 and length(year_month)>=6
 group by year_month
,farm_pro_type
,farm_pro_fac_type
,farm_pro_fac_year_type
,big_area_id
,big_area_name
,area_id
,area_name) t1


;



