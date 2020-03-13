-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_VETERINARY_ANALYZE_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 兽药分析数仓数据
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

insert overwrite table BIGDATA_DW.W_VETERINARY_ANALYZE_INFO 

select 
morbidity_count  as morbidity_count
,drug_count  as drug_count
,calving_count as calving_count
,data_month as report_date
,tf.farm_id as farm_id
,tf.farm_code  as farm_code
,tf.farm_name as farm_name
,tf.farm_org_id2 as big_area_id
,tf.farm_org_code2 as big_area_code
,tf.farm_org_name2 as big_area_name
,tf.farm_org_id3 as area_id
,tf.farm_org_code3 as area_code
,tf.farm_org_name3 as area_name
,tf.farm_org4_id as cities_id
,tf.farm_org_code4 as cities_code
,tf.farm_org_name4 as cities_name

from (
        select sum(morbidity_count) as morbidity_count 
        ,sum(drug_count ) as drug_count 
        ,sum(calving_count) as calving_count 
        ,tt.data_month 
        ,tt.farm_code from (
                          select disease_id as data_id,date_format(disease_dt,'yyyy-MM') as data_month ,1 as morbidity_count,0 as drug_count ,0 as  calving_count,1 as data_type,t1.farm_id,t1.farm_code,t1.farm_name 
                          from data_lake.d_evt_dairy_cow_disease t1    
                          union all 
                          select doctor_id as data_id ,date_format(medicine_date,'yyyy-MM') as data_month ,0 as morbidity_count,1 as drug_count,0 as  calving_count,2 as data_type,t3.farm_id,t3.farm_code,t3.farm_name  
                          from data_lake.d_evt_dairy_cow_disease_doctor t3  where medicine_date is not null 
                          union all 
                          select calving_id as data_id  ,date_format(calving_dt,'yyyy-MM') as data_month,0 as morbidity_count,0 as drug_count,case when calving_type != '流产' then 1 else 0 end as  calving_count ,3 as data_type,t5.farm_id,t5.farm_code,t5.farm_name 
                          from data_lake.d_evt_dairy_cow_calving t5
        )tt group by tt.data_month ,tt.farm_code
 )tr left join data_lake.d_pty_farm_base tf on tr.farm_code = tf.farm_code ;