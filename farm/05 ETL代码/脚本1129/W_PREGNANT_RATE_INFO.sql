-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_PREGNANT_RATE_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 怀孕率数仓数据
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
  insert overwrite table BIGDATA_DW.W_PREGNANT_RATE_INFO 
  select 
   t0.to_pregnancy_cow_qty 
  ,t0.actual_pregnancy_cow_qty 
  ,t0.to_estrus_young_cow_qty
  ,t0.actual_insem_cow_qty
   --- 根据查询的数据判断同期值
,t1.to_pregnancy_cow_period
,t1.actual_pregnancy_cow_period
,t1.to_estrus_young_cow_period
,t1.actual_insem_cow_period

  ,t0.estrus_period_start
  ,t0.estrus_period_end
  ,t0.estrus_period
  ,t0.year
  ,t0.rank_num
  ,t6.farm_id
  ,t6.farm_code
  ,t6.farm_name 
  ,farm_org_id2 as big_area_id
  ,farm_org_code2 as big_area_code
  ,farm_org_name2 as big_area_name
  ,farm_org_id3 as area_id
  ,farm_org_code3 as area_code
  ,farm_org_name3 as area_name
  ,farm_org4_id as cities_id
  ,farm_org_code4 as cities_code
  ,farm_org_name4 as cities_name 
  from (
  --- 查询当期 怀孕率数据开始
  
  select to_pregnancy_cow_qty
  ,t1.actual_pregnancy_cow_qty
  ,t1.to_estrus_young_cow_qty
  ,t1.actual_insem_cow_qty
  ,t1.farm_code
  ,t1.estrus_period
  ,t1.estrus_period_start
  ,t1.estrus_period_end
  ,t2.year
  ,t2.rank_num
  from (
select sum(to_pregnancy_cow_qty ) as to_pregnancy_cow_qty
  ,sum(actual_pregnancy_cow_qty) as actual_pregnancy_cow_qty
  ,sum(to_estrus_young_cow_qty) as to_estrus_young_cow_qty
  ,sum(actual_insem_cow_qty) as actual_insem_cow_qty
  ,t1.farm_code
  ,t1.estrus_period
  ,t1.estrus_period_start
  ,t1.estrus_period_end

   from (
  select * from data_lake.d_sts_dairy_cow_21day_rpt2017_fx 
  where cow_type  = '青年牛' and lactation_stage = '合计' and breed = '合计' 
  union all 
  select * from data_lake.d_sts_dairy_cow_21day_rpt2017_fx 
  where cow_type  = '成母牛' and lactation_stage = '合计' and breed = '合计'  
  ) t1   
  group by t1.farm_code,t1.estrus_period,t1.estrus_period_start,t1.estrus_period_end
  )t1
  --- 关联情期维度表
  left join BIGDATA_DW.W_ESTRUS_PERIOD_INFO t2
  on t1.estrus_period_start = t2.estrus_period_start

  --- 当期数据查询结束
  )t0 left join 

(
---- 查找同期数据 开始
select 
0 as to_pregnancy_cow_qty
,if(t1.to_pregnancy_cow_qty     is null,0, t1.to_pregnancy_cow_qty     ) as to_pregnancy_cow_period
,0 as actual_pregnancy_cow
,if(t1.actual_pregnancy_cow_qty is null,0, t1.actual_pregnancy_cow_qty ) as actual_pregnancy_cow_period
,0 as to_estrus_young_cow
,if(t1.to_estrus_young_cow_qty  is null,0, t1.to_estrus_young_cow_qty  ) as to_estrus_young_cow_period
,0 as actual_insem_cow
,if(t1.actual_insem_cow_qty     is null,0, t1.actual_insem_cow_qty     ) as actual_insem_cow_period
,t1.estrus_period_start
,t1.farm_code
,substr(t2.year+1,1,4) as year 
,t2.rank_num
from (
select 
   sum(to_pregnancy_cow_qty ) as to_pregnancy_cow_qty
  ,sum(actual_pregnancy_cow_qty) as actual_pregnancy_cow_qty
  ,sum(to_estrus_young_cow_qty) as to_estrus_young_cow_qty
  ,sum(actual_insem_cow_qty) as actual_insem_cow_qty
  ,t1.farm_code
  ,t1.estrus_period
  ,t1.estrus_period_start
  ,t1.estrus_period_end


   from (
  select * from data_lake.d_sts_dairy_cow_21day_rpt2017_fx 
  where cow_type  = '青年牛' and lactation_stage = '合计' and breed = '合计' 
  union all 
  select * from data_lake.d_sts_dairy_cow_21day_rpt2017_fx 
  where cow_type  = '成母牛' and lactation_stage = '合计' and breed = '合计'  
  ) t1 group by farm_code,estrus_period,estrus_period_start,estrus_period_end
)t1   
  --- 通过当期数据 关联情期维度表
  left join BIGDATA_DW.W_ESTRUS_PERIOD_INFO t2
  on t1.estrus_period_start = t2.estrus_period_start

  ---- 查找情期同期数据 结束
  )t1 on t0.year = t1.year and t0.farm_code = t1.farm_code
  
     --- 通过farm_code 获取区域维度信息
  left join data_lake.d_pty_farm_base t6 
  on t0.farm_code = t6.farm_code 
;