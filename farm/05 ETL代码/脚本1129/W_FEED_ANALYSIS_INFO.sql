
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_FEED_ANALYSIS_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 饲养分析数仓数据
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

insert overwrite table BIGDATA_DW.W_FEED_ANALYSIS_INFO 

select actual_qty as fodder_cost
,remain_weight as fodder_lost
,actual_eat  
,group_price 
,actual_qty_period  as    fodder_cost_period
,remain_weight_period as fodder_lost_period
,actual_eat_period   as actual_eat_period
,group_price_period  as group_price_period
,if(total_milk_volume is null,0,total_milk_volume ) as total_milk
,if(total_milk_period is null,0,total_milk_period) as total_milk_period
,t8.cow_count as cows_count
,t8.cow_count_period as cows_count_period
,t5.user_grp_type_name as group_type


,case when t5.user_grp_type_name = '干奶牛' then group_price else 0 end as dry_milk_price
,case when t5.user_grp_type_name = '围产牛' then group_price else 0 end as perin_cows_price
,case when t5.user_grp_type_name = '泌乳牛' then group_price else 0 end as milk_cows_price
,case when t5.user_grp_type_name = '后备牛' then group_price else 0 end as reserve_cows_price
,case when t5.user_grp_type_name = '犊牛' then group_price else 0 end as calf_price

,case when t5.user_grp_type_name = '干奶牛' then actual_eat else 0 end as dry_milk_eat
,case when t5.user_grp_type_name = '围产牛' then actual_eat else 0 end as perin_cows_eat
,case when t5.user_grp_type_name = '泌乳牛' then actual_eat else 0 end as milk_cows_eat
,case when t5.user_grp_type_name = '后备牛' then actual_eat else 0 end as reserve_cows_eat
,case when t5.user_grp_type_name = '犊牛'   then actual_eat else 0 end as calf_eat

,case when t5.user_grp_type_name = '干奶牛' then group_price_period else 0 end as dry_milk_price_period
,case when t5.user_grp_type_name = '围产牛' then group_price_period else 0 end as perin_cows_price_period
,case when t5.user_grp_type_name = '泌乳牛' then group_price_period else 0 end as milk_cows_price_period
,case when t5.user_grp_type_name = '后备牛' then group_price_period else 0 end as reserve_cows_price_period
,case when t5.user_grp_type_name = '犊牛'   then group_price_period else 0 end as calf_price_period

,case when t5.user_grp_type_name = '干奶牛' then actual_eat_period else 0 end as dry_milk_eat_period
,case when t5.user_grp_type_name = '围产牛' then actual_eat_period else 0 end as perin_cows_eat_period
,case when t5.user_grp_type_name = '泌乳牛' then actual_eat_period else 0 end as milk_cows_eat_period
,case when t5.user_grp_type_name = '后备牛' then actual_eat_period else 0 end as reserve_cows_eat_period
,case when t5.user_grp_type_name = '犊牛'   then actual_eat_period else 0 end as calf_eat_period

,case when t6.farm_type in  ('A类小区','A类牧场','A类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price else 0 end  as atype_fodder_price
,case when t6.farm_type in  ('B类小区','B类牧场','B类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price else 0 end  as btype_fodder_price 
,case when t6.farm_type in  ('C类小区','C类牧场','C类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price else 0 end  as ctype_fodder_price 
,case when t6.farm_type in  ('D类小区','D类牧场','D类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price else 0 end  as dtype_fodder_price

,case when t6.farm_type in  ('A类小区','A类牧场','A类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_volume else 0 end  as atype_milk_prod
,case when t6.farm_type in  ('B类小区','B类牧场','B类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_volume else 0 end  as btype_milk_prod 
,case when t6.farm_type in  ('C类小区','C类牧场','C类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_volume else 0 end  as ctype_milk_prod 
,case when t6.farm_type in  ('D类小区','D类牧场','D类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_volume else 0 end  as dtype_milk_prod

,case when t6.farm_type in  ('A类小区','A类牧场','A类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price_period else 0 end  as atype_fodder_price
,case when t6.farm_type in  ('B类小区','B类牧场','B类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price_period else 0 end  as btype_fodder_price 
,case when t6.farm_type in  ('C类小区','C类牧场','C类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price_period else 0 end  as ctype_fodder_price 
,case when t6.farm_type in  ('D类小区','D类牧场','D类供应商') and t5.user_grp_type_name = '泌乳牛'  then  group_price_period else 0 end  as dtype_fodder_price

,case when t6.farm_type in  ('A类小区','A类牧场','A类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_period else 0 end  as atype_milk_period
,case when t6.farm_type in  ('B类小区','B类牧场','B类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_period else 0 end  as btype_milk_period 
,case when t6.farm_type in  ('C类小区','C类牧场','C类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_period else 0 end  as ctype_milk_period 
,case when t6.farm_type in  ('D类小区','D类牧场','D类供应商') and t5.user_grp_type_name = '泌乳牛'  then  total_milk_period else 0 end  as dtype_milk_period

,case when t8.group_type = '干奶牛'   then t8.cow_count else 0 end as dry_cows
,case when t8.group_type = '泌乳牛'   then t8.cow_count else 0 end as locating_cows
,case when t8.group_type = '后备牛'   then t8.cow_count else 0 end as reserve_cows
,case when t8.group_type = '犊牛'     then t8.cow_count else 0 end as calf
,case when t8.group_type = '干奶牛'   then t8.cow_count_period else 0 end as dry_cows_period
,case when t8.group_type = '泌乳牛'   then t8.cow_count_period else 0 end as locating_cows_period
,case when t8.group_type = '后备牛'   then t8.cow_count_period else 0 end as reserve_cows_period
,case when t8.group_type = '犊牛'     then t8.cow_count_period else 0 end as calf_period


,case when t6.farm_type in('A类小区','A类牧场','A类供应商') then 'A级'
      when t6.farm_type in('B类小区','B类牧场','B类供应商') then 'B级'
      when t6.farm_type in('C类小区','C类牧场','C类供应商') then 'C级'
      when t6.farm_type in('D类小区','D类牧场','D类供应商') then 'D级'
ELSE '其他等级' end as farm_type
,mix_dt as report_date
,t5.farm_code
,t7.farm_name
,t7.farm_org_name2 as big_area_name
,t7.farm_org_name3 as area_name
,t7.farm_org_name4 as cities_name

from 
(-- t5 前半括号
--- 各分群 饲料搅拌，成本计算 开始

select sum(actual_qty) as actual_qty
,sum(remain_weight) as remain_weight
,sum(actual_eat) as  actual_eat
,sum(group_price) as group_price
,sum(actual_qty_period   ) as actual_qty_period   
,sum(remain_weight_period) as remain_weight_period
,sum(actual_eat_period   ) as actual_eat_period   
,sum(group_price_period) as group_price_period
,user_grp_type_name
,mix_dt
,farm_code  from (

select t2.actual_qty as  actual_qty
,t3.remain_weight as remain_weight 
,(t2.actual_qty-t3.remain_weight) as actual_eat 
,t2.group_price as group_price
,0 as actual_qty_period
,0 as remain_weight_period 
,0 as actual_eat_period
,0 as group_price_period
,t2.user_grp_type_name
,t2.mix_dt 
,t2.farm_code
from  
(
---03 通过 对群组进行分组聚合 获取到各个群组的成本 和 搅拌量
     select t1.user_grp_type_name
     ,t1.mix_dt as mix_dt
   
     ,sum(t1.actual_qty) as actual_qty
     -- 将 各材料 乘以单价 获取总
     ,sum((t1.actual_qty * t2.cal_price )) as group_price
     ,t1.farm_code
    from 
   ( 
     ---01 将搅拌数据进行 统计获取各分群 各材料使用量
      select sum(actual_qty)  as actual_qty ,user_grp_type_name,farm_code,substr(mix_dt,1,10) as mix_dt
        ,fodder_name
        from (
        select actual_qty,farm_code,mix_dt,fodder_name
        ,case when user_grp_type_name like '%高产%' then '泌乳牛'
              when user_grp_type_name like '%中产%' then '泌乳牛'
              when user_grp_type_name like '%低产%' then '泌乳牛'
              when user_grp_type_name like '%泌乳%' then '泌乳牛'
              when user_grp_type_name like '%围产%' then '围产牛'
              when user_grp_type_name like '%干奶%' then '干奶牛'
              when user_grp_type_name like '%后备%' then '后备牛'
              when user_grp_type_name like '%育成%' then '后备牛'
              when user_grp_type_name like '%青年%' then '后备牛'
              when user_grp_type_name like '%断奶%' then '后备牛'  
              when user_grp_type_name like '%哺乳%' then '后备牛'  
              when user_grp_type_name like '%犊牛%' then '犊牛'    
      else '其他分群' end as user_grp_type_name
      from data_lake.d_evt_tmr_mix_dtl  where mix_dt is not null and actual_qty is not null 
      )t1 group by user_grp_type_name,farm_code,mix_dt
      ,fodder_name  
       ---01 将搅拌数据进行 统计获取各分群 各材料使用量 结束
      ) t1
   
   left join 
   
   (
  ----02  关联 搅拌表  饲料购入表 取最接近搅拌时间的饲料价格
      select fodder_name,farm_code,mix_dt,max(cal_price) as cal_price from (
     --- 拿到最接近搅拌时间的饲料价格 但是 同一天同种货物可能会多个价格
    select t1.fodder_name,t1.farm_code,t1.mix_dt,t2.cal_price,max(t2.cal_price_dt) as cal_price_dt  

  from 

 (
       select farm_code
         ,substr(mix_dt,1,10) as mix_dt
        
         ,fodder_name,count(1) 
       from data_lake.d_evt_tmr_mix_dtl  where mix_dt is not null and actual_qty is not null 
       group by farm_code,mix_dt,fodder_name
       ) t1  left join (
       select count(1)

         ,substr(cal_price_dt,1,10) as cal_price_dt
         ,cal_price,goods_name,farm_code from data_lake.d_fin_inventory_cal_price_dtl 
       where goods_type_name = '饲料'
       group by cal_price_dt,cal_price,goods_name,farm_code
      
       
       )t2 on t1.farm_code = t2.farm_code and t1.fodder_name = t2.goods_name
      where t1.mix_dt >= t2.cal_price_dt 

      group by t1.farm_code, t1.fodder_name ,t2.cal_price,t1.mix_dt 
) ss group by fodder_name,farm_code,mix_dt
        ---- 02 关联 搅拌表  查询价格结束
   )t2 on t1.farm_code = t2.farm_code 
       and t1.fodder_name = t2.fodder_name 
       and t1.mix_dt = t2.mix_dt
  --- 根据 饲料名称进行匹配 单价为 null 的数据过滤
 where t2.cal_price is not null 

   group by t1.user_grp_type_name
           ,t1.mix_dt
           ,t1.farm_code
 ---03 通过 对群组进行分组聚合 获取到各个群组的成本 和 搅拌量 结束
) t2

 left join 
  (
     --- 按分群统计剩料量
  select sum(remain_weight) as remain_weight,farm_code,user_grp_type_name ,substr(feed_dt,1,10) as feed_dt
  from (
  select  remain_weight ,farm_code,feed_dt
  ,case when user_grp_type_name like '%高产%' then '泌乳牛'
        when user_grp_type_name like '%中产%' then '泌乳牛'
        when user_grp_type_name like '%低产%' then '泌乳牛'
        when user_grp_type_name like '%泌乳%' then '泌乳牛'
        when user_grp_type_name like '%围产%' then '围产牛'
        when user_grp_type_name like '%干奶%' then '干奶牛'
        when user_grp_type_name like '%后备%' then '后备牛'
        when user_grp_type_name like '%育成%' then '后备牛'
        when user_grp_type_name like '%青年%' then '后备牛'
        when user_grp_type_name like '%断奶%' then '后备牛'  
        when user_grp_type_name like '%哺乳%' then '后备牛'  
        when user_grp_type_name like '%犊牛%' then '犊牛'    
else '其他分群' end as user_grp_type_name
  from data_lake.d_evt_feed_dairy_cost_dtl
  ) t1 group by farm_code,feed_dt,user_grp_type_name 
  --- 按分群统计 剩料量 结束
 ) t3  on t2.user_grp_type_name = t3.user_grp_type_name 
 and t2.mix_dt = t3.feed_dt and t2.farm_code = t3.farm_code and t2.user_grp_type_name =t2.user_grp_type_name

 union all 
 
 
--- 计算 同比数据

select 

0 as actual_qty
,0 as remain_weight 
,0 as actual_eat
,0 as group_price
,t2.actual_qty as actual_qty_period
,t3.remain_weight as remain_weight_period
,(t2.actual_qty-t3.remain_weight) as actual_eat_period 
,t2.group_price as group_price_period
,t2.user_grp_type_name
,add_months (t2.mix_dt ,12) as mix_dt
,t2.farm_code

from  
(
---03 通过 对群组进行分组聚合 获取到各个群组的成本 和 搅拌量
     select t1.user_grp_type_name
     ,t1.mix_dt as mix_dt
   
     ,sum(t1.actual_qty) as actual_qty
     -- 将 各材料 乘以单价 获取总
     ,sum((t1.actual_qty * t2.cal_price )) as group_price
     ,t1.farm_code
    from 
   ( 
     ---01 将搅拌数据进行 统计获取各分群 各材料使用量
      select sum(actual_qty)  as actual_qty ,user_grp_type_name,farm_code,substr(mix_dt,1,10) as mix_dt
        ,fodder_name
        from (
        select actual_qty,farm_code,mix_dt,fodder_name
        ,case when user_grp_type_name like '%高产%' then '泌乳牛'
              when user_grp_type_name like '%中产%' then '泌乳牛'
              when user_grp_type_name like '%低产%' then '泌乳牛'
              when user_grp_type_name like '%泌乳%' then '泌乳牛'
              when user_grp_type_name like '%围产%' then '围产牛'
              when user_grp_type_name like '%干奶%' then '干奶牛'
              when user_grp_type_name like '%后备%' then '后备牛'
              when user_grp_type_name like '%育成%' then '后备牛'
              when user_grp_type_name like '%青年%' then '后备牛'
              when user_grp_type_name like '%断奶%' then '后备牛'  
              when user_grp_type_name like '%哺乳%' then '后备牛'  
              when user_grp_type_name like '%犊牛%' then '犊牛'    
      else '其他分群' end as user_grp_type_name
      from data_lake.d_evt_tmr_mix_dtl  where mix_dt is not null and actual_qty is not null 
      )t1 group by user_grp_type_name,farm_code,mix_dt
      ,fodder_name  
       ---01 将搅拌数据进行 统计获取各分群 各材料使用量 结束
      ) t1
   
   left join 
   
   (
  ----02  关联 搅拌表  饲料购入表 取最接近搅拌时间的饲料价格
      select fodder_name,farm_code,mix_dt,max(cal_price) as cal_price from (
     --- 拿到最接近搅拌时间的饲料价格 但是 同一天同种货物可能会多个价格
    select t1.fodder_name,t1.farm_code,t1.mix_dt,t2.cal_price,max(t2.cal_price_dt) as cal_price_dt  

  from 

 (
       select farm_code
         ,substr(mix_dt,1,10) as mix_dt
        
         ,fodder_name,count(1) 
       from data_lake.d_evt_tmr_mix_dtl  where mix_dt is not null and actual_qty is not null 
       group by farm_code,mix_dt,fodder_name
       ) t1  left join (
       select count(1)

         ,substr(cal_price_dt,1,10) as cal_price_dt
         ,cal_price,goods_name,farm_code from data_lake.d_fin_inventory_cal_price_dtl 
       where goods_type_name = '饲料'
       group by cal_price_dt,cal_price,goods_name,farm_code
      
       
       )t2 on t1.farm_code = t2.farm_code and t1.fodder_name = t2.goods_name
      where t1.mix_dt >= t2.cal_price_dt 

      group by t1.farm_code, t1.fodder_name ,t2.cal_price,t1.mix_dt 
) ss group by fodder_name,farm_code,mix_dt
        ---- 02 关联 搅拌表  查询价格结束
   )t2 on t1.farm_code = t2.farm_code 
       and t1.fodder_name = t2.fodder_name 
       and t1.mix_dt = t2.mix_dt
  --- 根据 饲料名称进行匹配 单价为 null 的数据过滤
 where t2.cal_price is not null 

   group by t1.user_grp_type_name
           ,t1.mix_dt
           ,t1.farm_code
 ---03 通过 对群组进行分组聚合 获取到各个群组的成本 和 搅拌量 结束
) t2

 left join 
  (
     --- 按分群统计剩料量
  select sum(remain_weight) as remain_weight,farm_code,user_grp_type_name ,substr(feed_dt,1,10) as feed_dt
  from (
  select  remain_weight ,farm_code,feed_dt
  ,case when user_grp_type_name like '%高产%' then '泌乳牛'
        when user_grp_type_name like '%中产%' then '泌乳牛'
        when user_grp_type_name like '%低产%' then '泌乳牛'
        when user_grp_type_name like '%泌乳%' then '泌乳牛'
        when user_grp_type_name like '%围产%' then '围产牛'
        when user_grp_type_name like '%干奶%' then '干奶牛'
        when user_grp_type_name like '%后备%' then '后备牛'
        when user_grp_type_name like '%育成%' then '后备牛'
        when user_grp_type_name like '%青年%' then '后备牛'
        when user_grp_type_name like '%断奶%' then '后备牛'  
        when user_grp_type_name like '%哺乳%' then '后备牛'  
        when user_grp_type_name like '%犊牛%' then '犊牛'    
else '其他分群' end as user_grp_type_name
  from data_lake.d_evt_feed_dairy_cost_dtl
  ) t1 group by farm_code,feed_dt,user_grp_type_name 
  --- 按分群统计 剩料量 结束
 ) t3  on t2.user_grp_type_name = t3.user_grp_type_name 
 and t2.mix_dt = t3.feed_dt and t2.farm_code = t3.farm_code and t2.user_grp_type_name =t2.user_grp_type_name
) t4 group by user_grp_type_name
,mix_dt,farm_code
--- 各分群 饲料搅拌，成本计算 结束
)t5
-- 查询 各个牧场产奶量
left join( 

  select sum(total_milk_volume)as total_milk_volume,sum(total_milk_period) as total_milk_period 
  ,product_dt,farm_code,farm_type, user_grp_type_name from (
  select total_milk_volume,'0' as total_milk_period,substr(product_dt,1,10) as product_dt,farm_code,farm_type,'泌乳牛' as user_grp_type_name
  from data_lake.d_sts_milk_volume_sum  
  union all 
  select '0' as total_milk_volume,total_milk_volume as total_milk_period,add_months(substr(product_dt,1,10),12) as product_dt,farm_code,farm_type,'泌乳牛' as user_grp_type_name
  from data_lake.d_sts_milk_volume_sum  
  ) t1 group by product_dt,farm_code,farm_type,user_grp_type_name
   --所有奶量都为泌乳牛 群组所产所以关联群组要关联泌乳牛
)t6 on t5.farm_code = t6.farm_code and t5.mix_dt = t6.product_dt and t5.user_grp_type_name=t6.user_grp_type_name
left join data_lake.d_pty_farm_base t7 on t5.farm_code = t7.farm_code

--- 关联牛只信息表
left join
(

select sum(cow_count) as cow_count
,sum(cow_count_period) as cow_count_period,group_type,farm_code,report_date
from 
 (
 
   select t2.dry_cow_qty as cow_count,'0' as cow_count_period,'干奶牛' as group_type,t2.farm_code,substr(query_dt,1,10) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
 union all 
 
   select t2.lactating_cow_qty as cow_count,'0' as cow_count_period,'泌乳牛' as group_type,t2.farm_code,substr(query_dt,1,10) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
  union all 
 
   select cast((t2.young_cow_qty+t2.mature_cow_qty+t2.weaning_cow_qty+t2.breast_feeding_cow_qty) as string )as cow_count,'0' as cow_count_period,'后备牛' as group_type,t2.farm_code,substr(query_dt,1,10) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
   union all 
 --- 哺乳犊牛 + 断奶犊牛 
   select cast((t2.weaning_cow_qty+t2.breast_feeding_cow_qty)as string ) as cow_count,'0' as cow_count_period,'犊牛' as group_type,t2.farm_code,substr(query_dt,1,10) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code

  union all 

 ----- 计算 同期牛只信息
 
-- 牛只信息
  select '0' as cow_count,t2.dry_cow_qty  as cow_count_period,'干奶牛' as group_type,t2.farm_code,add_months(substr(query_dt,1,10),12) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
 union all 
 
   select '0' as cow_count,t2.lactating_cow_qty as cow_count_period,'泌乳牛' as group_type,t2.farm_code,add_months(substr(query_dt,1,10),12) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
  union all 
 
   select '0' as cow_count,cast((t2.young_cow_qty+t2.mature_cow_qty+t2.weaning_cow_qty+t2.breast_feeding_cow_qty)as string )as cow_count_period,'后备牛' as group_type,t2.farm_code,add_months(substr(query_dt,1,10),12) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
   union all 
 --- 哺乳犊牛 + 断奶犊牛 
   select '0' as cow_count,cast((t2.weaning_cow_qty+t2.breast_feeding_cow_qty)as string )as cow_count_period,'犊牛' as group_type,t2.farm_code,add_months(substr(query_dt,1,10),12) as report_date from 
   (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt  group by substr(query_dt,1,10),farm_code
   )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code
 
 ) t8 group by farm_code,group_type,report_date
 


)t8 on t5.farm_code = t8.farm_code and t5.mix_dt = t8.report_date and t5.user_grp_type_name=t8.group_type

;

