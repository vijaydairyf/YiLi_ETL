
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_FEEDING_RATE_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 繁殖率数仓数据
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

  
  insert overwrite table BIGDATA_DW.W_FEEDING_RATE_INFO 
  select cow_id
  ,ear_no
  ,grow_stat
  ,lactation_cnt
  ,case when  grow_stat ='青年牛'  then 1  else 0  end  as breed_youth_cows
  ,case when  grow_stat in ('干奶牛','泌乳牛') then 1    else 0  end  as breed_adult_cows
  , case when  grow_stat in ('干奶牛','泌乳牛','青年牛')  then 1  else 0  end as  breed_cows
  --
  ,calving_dt  as report_date  
  -- ,substr(calving_dt,1,10) as report_date
  ,substr(calving_dt,1,7) as report_month
  ,substr(calving_dt,1,4) as report_year

  ,t2.farm_name as farm_name

,t2.farm_org_name2 as big_area_name

,t2.farm_org_name3 as area_name

,t2.farm_org_name4 as cities_name

  from  data_lake.d_evt_dairy_cow_calving t1 
    left join data_lake.d_pty_farm_base t2 on t1.farm_code = t2.farm_code
    where t1.calving_type in( '推迟','正常','早产') and grow_stat in ('干奶牛','泌乳牛','青年牛');



