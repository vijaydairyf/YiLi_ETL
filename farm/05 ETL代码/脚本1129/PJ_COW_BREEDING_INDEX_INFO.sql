-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_COW_BREEDING_INDEX_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 繁殖率其他指标数据
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

insert overwrite table BIGDATA_DM.PJ_COW_BREEDING_INDEX_INFO


select 
 case when data_type = '配准天数' then cows else 0 end as hybrid_cow_count
,case when data_type = '首配天数' then cows else 0 end as first_cow_count
,case when data_type = '空怀天数' then cows else 0 end as no_fetation_cow_count
,case when data_type = '产犊间隔' then cows else 0 end as calving_cow_count
,case when data_type = '怀孕天数' then cows else 0 end as fetation_cow_count

,case when data_type = '配准天数' then cows_period else 0 end as hybrid_count_period
,case when data_type = '首配天数' then cows_period else 0 end as first_count_period
,case when data_type = '空怀天数' then cows_period else 0 end as no_feta_count_period
,case when data_type = '产犊间隔' then cows_period else 0 end as calving_count_period
,case when data_type = '怀孕天数' then cows_period else 0 end as fetation_count_period

,case when data_type = '配准天数' then index_days else 0 end as hybrid_days
,case when data_type = '配准天数' then index_days_period else 0 end as hybrid_days_period
,case when data_type = '首配天数' then index_days else 0 end as first_hybrid_days
,case when data_type = '首配天数' then index_days_period else 0 end as first_hybrid_days_period
,case when data_type = '空怀天数' then index_days else 0 end as no_fetation_days
,case when data_type = '空怀天数' then index_days_period else 0 end as no_fetation_days_period
,case when data_type = '产犊间隔' then index_days else 0 end as calving_days
,case when data_type = '产犊间隔' then index_days_period else 0 end as calving_days_period
,case when data_type = '怀孕天数' then index_days else 0 end as fetation_days
,case when data_type = '怀孕天数' then index_days_period else 0 end as fetation_days_period



,cast(regexp_replace(substr(report_date,1,10),'-','') as bigint ) as report_date

,cast(regexp_replace(substr(report_date,1,7),'-','') as bigint ) as report_month

,farm_name

,big_area_name

,area_name

,cities_name

from BIGDATA_DW.W_COW_BREEDING_INDEX_INFO
;