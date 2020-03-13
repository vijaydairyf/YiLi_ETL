-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_COW_HERD_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牛群分析数据
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


insert overwrite table BIGDATA_DW.W_COW_HERD_INFO 

select 
cow_total_qty-retain_bull_qty as total_cows
,lactating_cow_qty+ dry_cow_qty as adult_cows
,dry_cow_qty as dry_cows
,lactating_cow_qty as locating_cows
,0 as milk_cows
,0 as perinatal_cows
,(t2.medcine_cows+ t2.quar_other_cows) as gl_cows
,0 as new_born_unresist
,t2.medcine_cows as medcine_cows
,quar_other_cows as quar_other_cows
,young_cow_qty + mature_cow_qty+weaning_cow_qty+breast_feeding_cow_qty as reserve_cows
,breast_feeding_cow_qty as  lactation_calf
,weaning_cow_qty as weaning_calf
,mature_cow_qty as bred_cows
,young_cow_qty as  youth_cows
,0 AS new_cows
,0 AS new_adult_cows
,0 AS new_reserve_cows
,0 AS new_lactation_calf
,0 AS new_weaning_calf
,0 AS new_bred_cows
,0 AS new_youth_cows
,first_born_cow_qty as amount_1Lac
,second_born_cow_qty as amount_2Lac
,third_born_cow_qty as amount_3Lac
,fourth_born_cow_qty as amount_4Lac
,fifth_born_cow_qty+sixth_born_above_qty as amount_5Lac
,t4.contract_start_dt as fixed_start_date
,t4.contract_end_dt as fixed_end_date
,t1.query_dt as report_date
,t4.farm_id
,t4.farm_code
,t4.farm_name
,t4.farm_org_id2 as big_area_id
,t4.farm_org_code2 as big_area_code
,t4.farm_org_name2 as big_area_name
,t4.farm_org_id3 as area_id
,t4.farm_org_code3 as area_code
,t4.farm_org_name3 as area_name
,t4.farm_org4_id as cities_id
,t4.farm_org_code4 as cities_code
,t4.farm_org_name4 as cities_name


from (

-- 牛只快照表 去重
  select t2.* from 
 (select max(cow_herd_id) as cow_herd_id ,substr(query_dt,1,10)as report_date,farm_code from data_lake.d_sts_cow_herd_daily_rpt where farm_type not in ('大型牧业','优然牧业')  group by substr(query_dt,1,10),farm_code
 
 )t1 inner join data_lake.d_sts_cow_herd_daily_rpt  t2 
 on t1.cow_herd_id = t2.cow_herd_id and  t1.report_date =substr(t2.query_dt,1,10)
 and t1.farm_code = t2.farm_code


) t1
 left join 
 -- 用药牛和其他隔离牛数量统计
 (
      select if(t2.medicine_cow_qty is null ,0,t2.medicine_cow_qty  ) as medcine_cows
      ,if(t2.other_quarantine_cow_qty is null ,0,t2.other_quarantine_cow_qty) as quar_other_cows
      ,t1.report_date
      ,t2.farm_code
       from 
      (   select max(id) as id ,substr(product_dt,1,10)as report_date,farm_code from    
	  data_lake.d_sts_milk_volume_sum  group by substr(product_dt,1,10),farm_code
 
      )t1 inner join data_lake.d_sts_milk_volume_sum  t2 
       on t1.id = t2.id 
       and t1.report_date = substr(t2.product_dt,1,10) 
       and t1.farm_code = t2.farm_code
 
 ) t2  on t1.farm_code = t2.farm_code and substr(t1.query_dt,1,10) = t2.report_date
 

  
left join data_lake.d_pty_farm_base t4 on t1.farm_code = t4.farm_code

  
  ;