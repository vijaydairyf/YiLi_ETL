

-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_COW_BREEDING_INDEX_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 繁殖率其他指标表数据
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

insert overwrite table BIGDATA_DW.W_COW_BREEDING_INDEX_INFO 
select cows_count,cows_count_period,index_days,index_days_period,data_type,report_date
,t8.farm_name

,t8.farm_org_name2 as big_area_name

,t8.farm_org_name3 as area_name

,t8.farm_org_name4 as cities_name

from (
-- 产犊间隔数据
select 
sum(cows_count) as cows_count
,sum(cows_count_period) as cows_count_period
,sum(index_days) as index_days
,sum(index_days_period) as index_days_period
,'产犊间隔' as data_type
,report_date
,farm_code 
from (
 select 
   count(ear_no) as cows_count
   ,0 as cows_count_period
   ,sum(index_days) as index_days
   , 0 as index_days_period
   
   ,report_date
   ,farm_code
   from (
   
       select t1.ear_no
    , datediff(t1.calving_dt,t2.calving_dt)  as index_days
    , substr(t1.calving_dt,1,10) as report_date
    ,t1.farm_code
    from (
    select cow_id,ear_no,farm_code,pregant_days,calving_time,calving_dt,data_calving_dt ,Row_Number() OVER (partition by cow_id,farm_code ORDER BY calving_dt asc) rank from  data_lake.d_evt_dairy_cow_calving
    ) t1 left join (select ear_no,farm_code,pregant_days,calving_time,calving_dt,data_calving_dt ,Row_Number() OVER (partition by cow_id,farm_code ORDER BY calving_dt asc) rank from  data_lake.d_evt_dairy_cow_calving
    ) t2 on t1.ear_no = t2.ear_no and t1.farm_code = t2.farm_code and (t1.rank-1) = t2.rank
    where t2.calving_dt is not null 
   )t1 group by report_date,farm_code
   
   union all 
   
   select 
    0 as cows_count
   ,count(ear_no) as cows_count_period
   ,0 as index_days
   ,sum(index_days) as index_days_period
   ,add_months(substr(report_date,1,10),12)as report_date
   ,farm_code
   from (
   
       select t1.ear_no
    , datediff(t1.calving_dt,t2.calving_dt)  as index_days
    , substr(t1.calving_dt,1,10) as report_date
    ,t1.farm_code
    from (
    select cow_id,ear_no,farm_code,pregant_days,calving_time,calving_dt,data_calving_dt ,Row_Number() OVER (partition by cow_id,farm_code ORDER BY calving_dt asc) rank from  data_lake.d_evt_dairy_cow_calving
    ) t1 left join (select ear_no,farm_code,pregant_days,calving_time,calving_dt,data_calving_dt ,Row_Number() OVER (partition by cow_id,farm_code ORDER BY calving_dt asc) rank from  data_lake.d_evt_dairy_cow_calving
    ) t2 on t1.ear_no = t2.ear_no and t1.farm_code = t2.farm_code and (t1.rank-1) = t2.rank
    where t2.calving_dt is not null 
   )t1 group by report_date,farm_code
) t2 group by report_date,farm_code 

union all  


-- 配准天数 数据
select sum(cow_count) as cow_count
,sum(cow_count_period) as cow_count_period
,sum(index_days) as index_days
,sum(index_days_period) as index_days_period
,'配准天数' as data_type
,report_date
,farm_code

from 
 ( select count(ear_no) as cow_count
  , 0 as cow_count_period
  ,sum(index_days)as index_days
  , 0 as index_days_period
  ,report_date
  ,farm_code
  from (
  
  
  
   select t1.ear_no
    ,min(datediff(t1.insem_dt,t0.calving_dt)) as index_days
    ,substr(t1.insem_dt,1,10) as report_date
    ,t1.farm_code
  from 
  (
    -- 查询出的所有的确认怀孕的牛只初检时间，耳号
    select t1.cow_id,t1.ear_no,t1.farm_code, t1.initial_inspection_dt,
   t1.insem_dt,

   --- 初检+ 且复检+ 则初检时间为确认怀孕时间 再减去配种时间 
   case  when t1.initial_inspection_result = '初检+' and t2.review_inspection_result = '复检+' then datediff(t1.initial_inspection_dt,t1.insem_dt) 
  --- 初检- 复检+ 则复检时间为确认怀孕时间  
   when t1.initial_inspection_result = '初检-' and t2.review_inspection_result = '复检+' then datediff(t2.review_inspection_dt,t2.insem_dt)
   --- 其余情况 则初检时间为确认怀孕时间
   else datediff(t1.initial_inspection_dt,t1.insem_dt) 
   end  as index_days -- 配准天数
  

    ,Row_Number() OVER (partition by t1.ear_no,t1.farm_code ORDER BY t1.initial_inspection_dt asc) rank 
    from data_lake.d_evt_dairy_cow_initial_inspection t1 
    left join data_lake.d_evt_dairy_cow_review_inspection t2
    on t1.ear_no = t2.ear_no and t1.insem_dt = t2.insem_dt and t1.farm_code = t2.farm_code
    where (t1.initial_inspection_result is not null and t2.review_inspection_result = '复检+')
      or  (t1.initial_inspection_result = '初检+' and t2.review_inspection_id is null)
   )t1 
     --- 关联产犊表 取怀孕时间 - 上次产犊时间最小值
  left join data_lake.d_evt_dairy_cow_calving  t0 
  on t1.farm_code = t0.farm_code and t1.ear_no = t0.ear_no
  where datediff(t1.insem_dt,t0.calving_dt) >0
  group by substr(t1.insem_dt,1,10) ,t1.farm_code,t1.ear_no
  
  )t2 group by report_date ,farm_code

   union all 
   --- 计算同期 配准天数 
  select 0 as cow_count
  ,count(ear_no) as cow_count_period
  ,0 as index_days
  , sum(index_days) as index_days_period
  ,add_months(report_date,12) as report_date
  ,farm_code
  from (
   select t1.ear_no
    ,min(datediff(t1.insem_dt,t0.calving_dt)) as index_days
    ,substr(t1.insem_dt,1,10) as report_date
    ,t1.farm_code
  from 
  (
    -- 查询出的所有的确认怀孕的牛只初检时间，耳号
    select t1.cow_id,t1.ear_no,t1.farm_code, t1.initial_inspection_dt,
   t1.insem_dt,

   --- 初检+ 且复检+ 则初检时间为确认怀孕时间 再减去配种时间 
   case  when t1.initial_inspection_result = '初检+' and t2.review_inspection_result = '复检+' then datediff(t1.initial_inspection_dt,t1.insem_dt) 
  --- 初检- 复检+ 则复检时间为确认怀孕时间  
   when t1.initial_inspection_result = '初检-' and t2.review_inspection_result = '复检+' then datediff(t2.review_inspection_dt,t2.insem_dt)
   --- 其余情况 则初检时间为确认怀孕时间
   else datediff(t1.initial_inspection_dt,t1.insem_dt) 
   end  as index_days -- 配准天数
    ,Row_Number() OVER (partition by t1.ear_no,t1.farm_code ORDER BY t1.initial_inspection_dt asc) rank 
    from data_lake.d_evt_dairy_cow_initial_inspection t1 
    left join data_lake.d_evt_dairy_cow_review_inspection t2
    on t1.ear_no = t2.ear_no and t1.insem_dt = t2.insem_dt and t1.farm_code = t2.farm_code
    where (t1.initial_inspection_result is not null and t2.review_inspection_result = '复检+')
      or  (t1.initial_inspection_result = '初检+' and t2.review_inspection_id is null)
   )t1 
     --- 关联产犊表 取怀孕时间 - 上次产犊时间最小值
  left join data_lake.d_evt_dairy_cow_calving  t0 
  on t1.farm_code = t0.farm_code and t1.ear_no = t0.ear_no
  where datediff(t1.insem_dt,t0.calving_dt) >0
  group by substr(t1.insem_dt,1,10) ,t1.farm_code,t1.ear_no
 )t2 group by report_date,farm_code
 
  )t3 group by report_date,farm_code

 
 union all 
 
 --- 怀孕天数 
select sum(cow_num) as cow_num
,sum(cow_num_period) as cow_num_period
,sum(index_days) as index_days
,sum(index_days_period) as index_days_period
,'怀孕天数' as data_type
,report_date
,farm_code
from (
  select count(ear_no) as cow_num
  , 0 as cow_num_period
  ,sum(pregant_days) as index_days
  ,0 as index_days_period
  ,substr(calving_dt,1,10)  as report_date
  ,farm_code
   from  data_lake.d_evt_dairy_cow_calving 
   where pregant_days is not null 
   and calving_type is not null
   and calving_type!= '流产'
  group by substr(calving_dt,1,10)  ,farm_code
  
  union all 
  
  select 0 as cow_num
  , count(ear_no) as cow_num_period
  ,0 as index_days
  ,sum(pregant_days)  as index_days_period
  ,add_months(substr(calving_dt,1,10),12)  as report_date
  ,farm_code
   from  data_lake.d_evt_dairy_cow_calving 
   where pregant_days is not null
   and calving_type is not null
   and calving_type!= '流产'
  group by substr(calving_dt,1,10)  ,farm_code
  ) t1 
  group by report_date,farm_code 
  
  
  union all 
-- 首配天数

 select sum(cows_count) as cows_count
 ,sum(cows_count_period) as cows_count_period
 ,sum(index_days) as index_days
 ,sum(index_days_period) as index_days_period
 ,'首配天数' as data_type
 ,report_date
 ,farm_code
 from (
 select count(ear_no) as cows_count
 , 0 as cows_count_period
 ,sum(index_days) as index_days
 ,0 as index_days_period
 ,insem_dt as report_date
 ,farm_code
 from(
    select ear_no,farm_code,insem_days as index_days,substr(date_add(calving_dt,insem_days),1,10) as insem_dt
     ,Row_Number() OVER( PARTITION BY ear_no,farm_code ORDER BY calving_dt asc) rank 
     from (
          -- 根据 牛只，牧场，产犊时间进行分组获取到首次配种天数
          select min(insem_days) as insem_days ,calving_dt,farm_code,ear_no 
         from (
         select t1.calving_dt,t2.insem_dt 
         -- 让配种时间减去 产犊时间 再筛选出间隔天数大于0 的就是产后配种时间
         ,datediff(t2.insem_dt,t1.calving_dt) as insem_days
         ,t1.farm_code,t1.ear_no from data_lake.d_evt_dairy_cow_calving t1
         left join data_lake.d_evt_farm_insemination_dtl t2  on t1.farm_code = t2.farm_code and t1.ear_no = t2.ear_no
         where datediff(t2.insem_dt,t1.calving_dt) >0
         )t3 group by farm_code,ear_no ,calving_dt
       ) t4  where insem_days is not null 
  ) t5 group by insem_dt  ,farm_code
  
  union all 
--- 首配天数 同期数据

 select 0 as cows_count
 , count(ear_no) as cows_count_period
 ,0 as index_days
 ,sum(index_days) as index_days_period
 ,add_months(insem_dt,12) as report_date
 ,farm_code
 from(
    select ear_no,farm_code,insem_days as index_days,substr(date_add(calving_dt,insem_days),1,10) as insem_dt
     ,Row_Number() OVER( PARTITION BY ear_no,farm_code ORDER BY calving_dt asc) rank 
     from (
          -- 根据 牛只，牧场，产犊时间进行分组获取到首次配种天数
          select min(insem_days) as insem_days ,calving_dt,farm_code,ear_no 
         from (
         select t1.calving_dt,t2.insem_dt 
         -- 让配种时间减去 产犊时间 再筛选出间隔天数大于0 的就是产后配种时间
         ,datediff(t2.insem_dt,t1.calving_dt) as insem_days
         ,t1.farm_code,t1.ear_no from data_lake.d_evt_dairy_cow_calving t1
         left join data_lake.d_evt_farm_insemination_dtl t2  on t1.farm_code = t2.farm_code and t1.ear_no = t2.ear_no
         where datediff(t2.insem_dt,t1.calving_dt) >0
         )t3 group by farm_code,ear_no ,calving_dt
       ) t4  where insem_days is not null 
  ) t5 group by insem_dt  ,farm_code
 )t6 group by report_date ,farm_code
 
 
 union all 
 
  --- 空怀天数  怀孕时间-上次产犊时间
   
select sum(cows_count) as cows_count
  ,sum(cows_count_period) as cows_count_period
  ,sum(index_days) as index_days
  ,sum(index_days_period) as index_days_period
  ,'空怀天数' as data_type
 ,report_date
 ,farm_code
from (
   select count(ear_no) as cows_count
   ,0 as cows_count_period
   ,sum(index_days) as index_days
   , 0 as index_days_period
   ,farm_code
   ,report_date
  from (
   select ear_no,farm_code
   --- 取值最小的天数为 怀孕天数
   ,min(calve_days) as index_days
   ,report_date from (
  select t1.ear_no,t1.initial_inspection_result,t1.review_inspection_result,t2.calving_dt,report_date,t1.farm_code
-- 怀孕时间 减去产犊时间
,datediff(t1.report_date,t2.calving_dt) as calve_days

from (
   -- 检测怀孕牛数据 
  select t1.ear_no -- 牛只
     ,t1.lactation_cnt -- 胎次
     ,t1.grow_stat
     ,t1.farm_code -- 牧场id
     ,t1.insem_dt, -- 配种时间
     t1.initial_inspection_result,  -- 初检结果
     cast(regexp_replace(substr(t1.initial_inspection_dt,1,7),'-','') as bigint ) as report_month ,-- 初检月份
     
    --- 初检+ 且复检+ 则初检时间为确认怀孕时间  
   case  when t1.initial_inspection_result = '初检+' and t2.review_inspection_result = '复检+' then  substr(t1.initial_inspection_dt,1,10)
  --- 初检- 复检+ 则复检时间为确认怀孕时间  
   when t1.initial_inspection_result = '初检-' and t2.review_inspection_result = '复检+' then substr(t2.review_inspection_dt,1,10)
   --- 其余情况 则初检时间为确认怀孕时间
   else substr(t1.initial_inspection_dt,1,10)
   end  as report_date , -- 确认怀孕时间
 
 
     t2.review_inspection_result,  -- 复检结果
     t2.review_inspection_id  -- 复检数据id
     from data_lake.d_evt_dairy_cow_initial_inspection t1 
     left join data_lake.d_evt_dairy_cow_review_inspection t2
     on t1.ear_no = t2.ear_no and t1.insem_dt = t2.insem_dt and t1.farm_code = t2.farm_code
     where (t1.initial_inspection_result is not null and t2.review_inspection_result = '复检+')
     or  (t1.initial_inspection_result = '初检+' and t2.review_inspection_id is null)
)t1 left join data_lake.d_evt_dairy_cow_calving t2 -- 产犊表
on t1.farm_code = t2.farm_code 
and t1.ear_no = t2.ear_no 

) t5 where calve_days >0 group by ear_no,farm_code,report_date

)t6 group by farm_code,report_date

union all 

--- 计算同期数据值
   select 0 as cows_count
   ,count(ear_no) as cows_count_period
   ,0 as index_days
   , sum(index_days) as index_days_period
   ,farm_code
   ,add_months(report_date,12) as report_date
  from (
   select ear_no,farm_code,min(calve_days) as index_days,report_date from (
  select t1.ear_no,t1.initial_inspection_result,t1.review_inspection_result,t2.calving_dt,report_date,t1.farm_code
-- 怀孕时间 减去产犊时间
,datediff(t1.report_date,t2.calving_dt) as calve_days

from (
   -- 检测怀孕牛数据 
  select t1.ear_no -- 牛只
     ,t1.lactation_cnt -- 胎次
     ,t1.grow_stat
     ,t1.farm_code -- 牧场id
     ,t1.insem_dt, -- 配种时间
     t1.initial_inspection_result,  -- 初检结果
     cast(regexp_replace(substr(t1.initial_inspection_dt,1,7),'-','') as bigint ) as report_month ,-- 初检月份
   
     --- 初检+ 且复检+ 则初检时间为确认怀孕时间  
   case  when t1.initial_inspection_result = '初检+' and t2.review_inspection_result = '复检+' then  substr(t1.initial_inspection_dt,1,10)
  --- 初检- 复检+ 则复检时间为确认怀孕时间  
   when t1.initial_inspection_result = '初检-' and t2.review_inspection_result = '复检+' then substr(t2.review_inspection_dt,1,10)
   --- 其余情况 则初检时间为确认怀孕时间
   else substr(t1.initial_inspection_dt,1,10)
   end  as report_date , -- 确认怀孕时间
   
     t2.review_inspection_result,  -- 复检结果
     t2.review_inspection_id  -- 复检数据id
     from data_lake.d_evt_dairy_cow_initial_inspection t1 
     left join data_lake.d_evt_dairy_cow_review_inspection t2
     on t1.ear_no = t2.ear_no and t1.insem_dt = t2.insem_dt and t1.farm_code = t2.farm_code
     where (t1.initial_inspection_result is not null and t2.review_inspection_result = '复检+')
     or  (t1.initial_inspection_result = '初检+' and t2.review_inspection_id is null)
)t1 left join data_lake.d_evt_dairy_cow_calving t2 -- 产犊表
on t1.farm_code = t2.farm_code 
and t1.ear_no = t2.ear_no 
) t5 where calve_days >0 group by ear_no,farm_code,report_date

)t6 group by farm_code,report_date

) ts group by farm_code,report_date



 ) t7 left join  data_lake.d_pty_farm_base t8 on t7.farm_code = t8.farm_code
 
 ;