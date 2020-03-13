-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_RESERVE_COWS_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 兽药分析 日报/月报数据
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
insert overwrite table BIGDATA_DM.PJ_VETERINARY_ANALYZE_INFO

select  morbidity_count
, drug_count
,calving_count
,cast(regexp_replace(report_date,'-','') as bigint ) as report_date
,farm_id
,farm_code
, farm_name
, big_area_id
, big_area_code
, big_area_name
, area_id
, area_code
, area_name
, cities_id
, cities_code
, cities_name
from BIGDATA_DW.W_VETERINARY_ANALYZE_INFO
;



