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

insert overwrite table bigdata_dw.dm_sl_zkt_dealer_d_tmp
select
       nvl(t2.integration_id, t1.integration_id) as integration_id,
       nvl(t2.dealer_code, t1.dealer_code) as dealer_code,
       nvl(t2.dealer_name, t1.dealer_name) as dealer_name,
       t1.dealer_short_name as dealer_short_name,
       t1.partner_dealer_code as partner_dealer_code,
       t1.partner_dealer_name as partner_dealer_name,
       nvl(t2.bg_code, t1.bg_code) as bg_code,
       nvl(t2.bg_name, t1.bg_name) as bg_name,
       nvl(t2.bg_area_name, t1.bg_area_name) as bg_area_name,
       nvl(t2.bg_region_name, t1.bg_region_name) as bg_region_name,
       nvl(t2.bg_city_group_name, t1.bg_city_group_name) as bg_city_group_name,
       nvl(t2.bg_city_name, t1.bg_city_name) as bg_city_name,
       t1.warehouse_name as warehouse_name,
       nvl(t2.province_name, t1.province_name) as province_name,
       nvl(t2.city_name, t1.city_name) as city_name,
       nvl(t2.county_name, t1.county_name) as county_name,
       t1.responsible_name as responsible_name,
       t1.responsible_phone as responsible_phone,
       t1.email_addr as email_addr,
       t1.office_addr as office_addr,
       t1.receive_addr as receive_addr,
       t1.receive_name as receive_name,
       t1.receive_phone as receive_phone,
       t1.dealer_type as dealer_type,
       t1.dealer_level as dealer_level,
       t1.channel_type as channel_type,
       t1.created_by_id as created_by_id,
       t1.changed_by_id as changed_by_id,
       t1.created_on_dt as created_on_dt,
       t1.changed_on_dt as changed_on_dt,
       t1.aux1_changed_on_dt as aux1_changed_on_dt,
       t1.aux2_changed_on_dt as aux2_changed_on_dt,
       t1.aux3_changed_on_dt as aux3_changed_on_dt,
       t1.aux4_changed_on_dt as aux4_changed_on_dt,
       current_date as w_insert_dt,
       current_date as w_update_dt,
       cast(t1.etl_proc_wid as string) as etl_proc_wid,
       t1.date_from as date_from,
       t1.date_to as date_to,
       cast(t1.version as string) as version,
       nvl(t2.row_id, t1.row_id) as row_id,
       nvl(t2.dealer_erp_name, t1.dealer_erp_name) as dealer_erp_name,
       nvl(t2.datasource_id, t1.datasource_id) as datasource_id,
       nvl(t2.area_code, t1.area_code) as area_code,
       t1.sale_type as sale_type,
       t1.is_warehouse_customer as is_warehouse_customer,
       t1.test_flg as test_flg,
       t1.status as status,
       nvl(t2.cust_account_id, t1.cust_account_id) as cust_account_id,
       t1.territory_id as territory_id,
       row_wid,
       nvl(t2.id, t1.id) as id
  from bigdata_dw.dm_sl_zkt_dealer_d t1
  left join bigdata_dw.dm_sl_zkt_dealer_ds t2
    on t1.row_id = t2.row_id;
	
insert into table bigdata_dw.dm_sl_zkt_dealer_d_tmp
select integration_id,
       dealer_code,
       dealer_name,
       '' as dealer_short_name,
       '' as partner_dealer_code,
       '' as partner_dealer_name,
       bg_code,
       bg_name,
       bg_area_name,
       bg_region_name,
       bg_city_group_name,
       bg_city_name,
       '' as warehouse_name,
       province_name,
       city_name,
       county_name,
       '' as responsible_name,
       '' as responsible_phone,
       '' as email_addr,
       '' as office_addr,
       '' as receive_addr,
       '' as receive_name,
       '' as receive_phone,
       '' as dealer_type,
       '' as dealer_level,
       '' as channel_type,
       '' as created_by_id,
       '' as changed_by_id,
       cast (created_on_dt as string) as created_on_dt,
       cast (changed_on_dt as string) as changed_on_dt,
       '' as aux1_changed_on_dt,
       '' as aux2_changed_on_dt,
       '' as aux3_changed_on_dt,
       '' as aux4_changed_on_dt,
       current_date as w_insert_dt,
       current_date as w_update_dt,
       '' as etl_proc_wid,
       '' as date_from,
       '' as date_to,
       '' as version,
       row_id,
       dealer_erp_name,
       datasource_id,
       area_code,
       '' as sale_type,
       '' as is_warehouse_customer,
       '' as test_flg,
       '' as status,
       cust_account_id,
       '' as territory_id,
       row_number() over(partition by t2.tmp order by t2.row_id) + aa as row_wid,
       id
  from (select t2.*, 1 as tmp from bigdata_dw.dm_sl_zkt_dealer_ds t2) t2,
       (select max(row_wid) aa, 1 as tmp from bigdata_dw.dm_sl_zkt_dealer_d) t3
 where not exists
 (select 1 from bigdata_dw.dm_sl_zkt_dealer_d t1 where t1.row_id = t2.row_id)
   and t2.tmp = t3.tmp;
   

insert overwrite table bigdata_dw.dm_sl_zkt_dealer_d
select * from bigdata_dw.dm_sl_zkt_dealer_d_tmp;
