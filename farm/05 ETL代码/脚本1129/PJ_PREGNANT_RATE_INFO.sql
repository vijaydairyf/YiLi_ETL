

-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_PREGNANT_RATE_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 繁殖分析怀孕率数据
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

insert overwrite table BIGDATA_DM.PJ_PREGNANT_RATE_INFO

select to_pregnancy_cow_qty  -- 应怀孕牛数
,actual_pregnancy_cow_qty  -- 实际怀孕牛数
,to_estrus_young_cow_qty  -- 应发情牛
,actual_insem_cow_qty  -- 实际参配牛
,to_pregnancy_cow_qty_period

,actual_pregnancy_cow_qty_period
,to_estrus_young_cow_qty_period

,actual_insem_cow_qty_period

,cast(regexp_replace(substr(estrus_period_start,1,10),'-','') as bigint ) as estrus_period_start
,cast(regexp_replace(substr(estrus_period_end,1,10),'-','') as bigint ) as estrus_period_end

 ,concat(regexp_replace(estrus_period_start,'-',''),'-',regexp_replace(estrus_period_end, '-','')) as estrus_period
,year
,rank_num
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

from BIGDATA_DW.W_PREGNANT_RATE_INFO


;
