-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_FETATION_ABORT_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 早产流产数仓数据
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

insert overwrite table BIGDATA_DW.W_FETATION_ABORT_INFO 
select cow_id
,ear_no
,pregant_days
,lactation_cnt
,grow_stat
,calving_type
,case when calving_type != '流产' then 1  else 0  end   as calving_cows 
,case when calving_type= '早产' then 1  else 0  end  as premature_cows
,case when calving_type= '流产' then 1  else 0  end  as aborted_cows
,case when calving_type= '早产' and grow_stat='青年牛' then 1  else 0  end  as parity0_premature_cows
,case when calving_type= '流产' and grow_stat='青年牛' then 1 else 0  end   as parity0_aborted_cows
,case when calving_type= '早产' and lactation_cnt=1    then 1  else 0  end  as parity1_premature_cows

,case when calving_type= '流产' and lactation_cnt=1 then 1 else 0  end      as parity1_aborted_cows
,case when calving_type= '早产' and lactation_cnt=2 then 1  else 0  end     as parity2_premature_cows
,case when calving_type= '流产' and lactation_cnt=2 then 1 else 0  end      as parity2_aborted_cows
,case when calving_type= '早产' and lactation_cnt=3 then 1  else 0  end     as parity3_premature_cows
,case when calving_type= '流产' and lactation_cnt=3 then 1 else 0  end      as parity3_aborted_cows
,case when calving_type= '早产' and lactation_cnt=4 then 1  else 0  end     as parity4_premature_cows
,case when calving_type= '流产' and lactation_cnt=4 then 1 else 0  end      as parity4_aborted_cows
,case when calving_type= '早产' and lactation_cnt>=5 then 1  else 0  end    as parity5_premature_cows
,case when calving_type= '流产' and lactation_cnt>=5 then 1 else 0  end     as parity5_aborted_cows

,case when  grow_stat='青年牛' and calving_type != '流产' then 1  else 0  end  as parity0_calving_cows
,case when  lactation_cnt=1 and calving_type != '流产' then 1  else 0     end  as parity1_calving_cows
,case when  lactation_cnt=2 and calving_type != '流产' then 1  else 0     end  as parity2_calving_cows
,case when  lactation_cnt=3 and calving_type != '流产' then 1  else 0     end  as parity3_calving_cows
,case when  lactation_cnt=4 and calving_type != '流产' then 1  else 0     end  as parity4_calving_cows
,case when  lactation_cnt >=5 and calving_type != '流产' then 1  else 0   end  as parity5_calving_cows


,case when calving_type= '早产' and pregant_days>=210 and pregant_days<=219 then 1  else 0  end  as days210_premature_cows
,case when calving_type= '早产' and pregant_days>=220 and pregant_days<=229 then 1  else 0  end  as days220_premature_cows
,case when calving_type= '早产' and pregant_days>=230 and pregant_days<=239 then 1  else 0  end  as days230_premature_cows
,case when calving_type= '早产' and pregant_days>=240 and pregant_days<=249 then 1  else 0  end  as days240_premature_cows
,case when calving_type= '早产' and pregant_days>=250 and pregant_days<=262 then 1  else 0  end  as days250_premature_cows


,case when calving_type= '流产' and pregant_days>=43 and pregant_days<=62  then 1 else 0  end    as days43_aborted_cows
,case when calving_type= '流产' and pregant_days>=63 and pregant_days<=82  then 1 else 0  end    as days63_aborted_cows
,case when calving_type= '流产' and pregant_days>=83 and pregant_days<=102  then 1 else 0  end   as days83_aborted_cows
,case when calving_type= '流产' and pregant_days>=103 and pregant_days<=122  then 1 else 0  end  as days103_aborted_cows
,case when calving_type= '流产' and pregant_days>=123 and pregant_days<=142  then 1 else 0  end  as days123_aborted_cows
,case when calving_type= '流产' and pregant_days>=143 and pregant_days<=162  then 1 else 0  end  as days143_aborted_cows
,case when calving_type= '流产' and pregant_days>=163 and pregant_days<=182  then 1 else 0  end  as days163_aborted_cows
,case when calving_type= '流产' and pregant_days>=183 and pregant_days<=210  then 1 else 0  end  as days183_aborted_cows
,substr(calving_dt,1,10) as report_date
,cast(regexp_replace(substr(calving_dt,1,7),'-','') as bigint ) as report_month
,t1.farm_code

from data_lake.d_evt_dairy_cow_calving t1

union all 


select cow_id
,ear_no
,pregant_days
,lactation_cnt
,grow_stat
,'流产' as calving_type
, 0   as calving_cows
, 0   as premature_cows
,1   as aborted_cows
,0 as parity0_premature_cows
,case when  grow_stat='青年牛' then 1 else 0  end  as parity0_aborted_cows
, 0    as parity1_premature_cows
,case when  lactation_cnt=1 then 1 else 0  end  as parity1_aborted_cows
, 0  as parity2_premature_cows                           
,case when  lactation_cnt=2 then 1 else 0  end  as parity2_aborted_cows
,0 as parity3_premature_cows                             
,case when  lactation_cnt=3 then 1 else 0  end  as parity3_aborted_cows
,0 as parity4_premature_cows                             
,case when  lactation_cnt=4 then 1 else 0  end  as parity4_aborted_cows
,0 as parity5_premature_cows                             
,case when lactation_cnt>=5 then 1 else 0  end  as parity5_aborted_cows
,0 as parity0_calving_cows
,0 as parity1_calving_cows
,0 as parity2_calving_cows
,0 as parity3_calving_cows
,0 as parity4_calving_cows
,0 as parity5_calving_cows

, 0   as days210_premature_cows
, 0   as days220_premature_cows
, 0   as days230_premature_cows
, 0   as days240_premature_cows
, 0   as days250_premature_cows


,case when  pregant_days>=43 and pregant_days<=62  then 1 else 0  end    as days43_aborted_cows
,case when  pregant_days>=63 and pregant_days<=82  then 1 else 0  end    as days63_aborted_cows
,case when  pregant_days>=83 and pregant_days<=102  then 1 else 0  end   as days83_aborted_cows
,case when  pregant_days>=103 and pregant_days<=122  then 1 else 0  end  as days103_aborted_cows
,case when  pregant_days>=123 and pregant_days<=142  then 1 else 0  end  as days123_aborted_cows
,case when  pregant_days>=143 and pregant_days<=162  then 1 else 0  end  as days143_aborted_cows
,case when  pregant_days>=163 and pregant_days<=182  then 1 else 0  end  as days163_aborted_cows
,case when  pregant_days>=183 and pregant_days<=210  then 1 else 0  end  as days183_aborted_cows 
,substr(abortion_dt,1,10) as report_date
,cast(regexp_replace(substr(abortion_dt,1,7),'-','') as bigint ) as report_month
,farm_code

from data_lake.d_evt_dairy_cow_abortion 


;