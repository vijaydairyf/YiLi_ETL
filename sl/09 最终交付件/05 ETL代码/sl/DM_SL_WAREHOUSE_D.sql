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

insert overwrite table bigdata_dw.dm_sl_warehouse_d_tmp
select 
       nvl(t2.wh_name,t1.wh_name) as wh_name,
       nvl(t2.wh_code,t1.wh_code) as wh_code,
       nvl(t2.locaton,t1.locaton) as locaton,
       '1900/1/1' as date_from,
       '2199/12/31' as date_to,
       nvl(t2.creation_date,t1.creation_date) as creation_date,
       nvl(t2.parent_id,t1.parent_id) as parent_id,
       nvl(t2.parent_name,t1.parent_name) as parent_name,
       t1.row_wid,
       nvl(t2.wh_id,t1.integration_id) as integration_id,
       current_date as w_insert_dt,
       current_date as w_update_dt,
       nvl(t2.date_from,t1.date_from) as start_dt,
       nvl(t2.date_to,t1.date_to) as end_dt,
       1 as version,
       nvl(t2.last_update_date,t1.created_on_dt) as created_on_dt,
       null as changed_on_dt,
       null as aux1_changed_on_dt,
       nvl(t2.status,t1.status) as status,
       t1.longitude as longitude,
       t1.latitude as latitude,
       nvl(t2.orgn_type,t1.orgn_type) as orgn_type,
       nvl(t2.attribute4,t1.attribute4) as attribute4,
       nvl(t2.attribute2,t1.attribute2) as REQUEST_TYPE,
       nvl(t2.attribute3,t1.attribute3) as attribute3,
       nvl(t2.attribute2,t1.attribute2) as attribute2,
       nvl(t2.orgn_name,t1.orgn_name) as orgn_name
  from bigdata_dw.dm_sl_warehouse_d t1
  left join bigdata_dw.dm_sl_warehouse_ds t2
 on t1.integration_id = t2.wh_id;
 -------------
 
 insert into table bigdata_dw.dm_sl_warehouse_d_tmp 
 select wh_name,
       wh_code,
       locaton,
       '1900/1/1' as date_from,
       '2199/12/31' as date_to,
       creation_date,
       parent_id,
       parent_name,
       row_number() over(partition by t2.version order by t2.wh_id) + aa as row_wid,
       t2.wh_id as integration_id,
       current_date as w_insert_dt,
       current_date as w_update_dt,
       date_from as start_dt,
       date_to as end_dt,
       t2.version,
       last_update_date as created_on_dt,
       null as changed_on_dt,
       null as aux1_changed_on_dt,
       status,
       null as longitude,
       null as latitude,
       orgn_type,
       attribute4,
       attribute2 as REQUEST_TYPE,
       attribute3,
       attribute2,
       orgn_name
  from (select t2.*, 1 as version from bigdata_dw.dm_sl_warehouse_ds t2) t2,
       (select max(row_wid) aa, 1 as version from bigdata_dw.dm_sl_warehouse_d) t3
 where not exists
 (select 1 from bigdata_dw.dm_sl_warehouse_d t1 where t1.integration_id = t2.wh_id)
   and t2.version = t3.version ;
   ----------

truncate table bigdata_dw.dm_sl_warehouse_d;
insert into table bigdata_dw.dm_sl_warehouse_d 
select * from bigdata_dw.dm_sl_warehouse_d_tmp;
