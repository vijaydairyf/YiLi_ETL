-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_dealer_inventory_snaps/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dw.fact_sl_dealer_inventory_snaps
-- project:
-- note:
-- purpose:                 经销商库存余额F表
--=============================================================================
-- creation date:       2018-10-21
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
-- 2018-10-21   capgemini       
-------------------------------------------------------------------------------

--缓慢变化维实现方法
insert overwrite table bigdata_dw.dm_sl_request_type_d
--create table dm_sl_request_type_d as 
select nvl(t2.lookup_code,t1.lookup_code) as lookup_code,
       nvl(t2.meaning,t1.meaning) as meaning,
       nvl(t2.description,t1.description) as description,
       nvl(t2.enabled_flag,t1.enabled_flag) as enabled_flag,
       nvl(t2.start_date_active,t1.start_date_active) as start_date_active,
       nvl(t2.end_date_active,t1.end_date_active) as end_date_active,
       nvl(t2.last_update_date,t1.last_update_date) as last_update_date,
       current_date as w_insert_dt,
       t1.integration_id,
       t1.row_wid,
       t1.version,
       t1.date_from,
       t1.date_to,
       t1.longitude,
       t1.latitude
  from bigdata_dw.dm_sl_request_type_d t1
  left join bigdata_dw.dm_sl_request_type_ds t2
 on t1.lookup_code = t2.lookup_code;

insert into table bigdata_dw.dm_sl_request_type_d
select t2.lookup_code,
       t2.meaning,
       t2.description,
       t2.enabled_flag,
       t2.start_date_active,
       t2.end_date_active,
       t2.last_update_date,
       current_date as w_insert_dt,
       t2.lookup_code as integration_id,
       row_number() over(partition by t2.version order by t2.lookup_code) + aa as row_wid,
       t2.version,
       '1900/1/1' as date_from,
       '2199/12/31' as date_to,
       0 as longitude,
       0 as latitude
  from (select t2.*,1 as version from bigdata_dw.dm_sl_request_type_ds t2) t2,
  (select max(row_wid) aa ,1 as version from bigdata_dw.dm_sl_request_type_d) t3
 where not exists(select 1 from bigdata_dw.dm_sl_request_type_d t1 where t1.lookup_code =  t2.lookup_code)
and t2.version = t3.version;
