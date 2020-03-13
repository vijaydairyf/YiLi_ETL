-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_dealer_sales_order/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dw.fact_sl_dealer_sales_order
-- project:
-- note:
-- purpose:                 经销商销售订单F表
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

--drop table bigdata_dw.fact_sl_dealer_sales_order_tmp;
--create table bigdata_dw.fact_sl_dealer_sales_order_tmp as
insert overwrite table bigdata_dw.fact_sl_dealer_sales_order_tmp
select cast(st.id as string) as row_id,
       regexp_replace(substr(st.swsj,1,10),'-','') as business_dt_wid,
       wpd.row_wid as product_wid,
       '' as source,
       st.qty as quantity_pack,
       st.wht as quantity_ton,
       cast(0 as bigint) as amount,
       bd.row_wid as bg_wid,
       nvl(delaer_zkt.row_wid, 0) as dms_deale_wid,
       st.bz as ordertype,
       current_date as w_insert_dt,
       'ZKT' as datasource_id,
       cast(st.id as string) as integration_id,
       nvl(ad.row_wid,-1) area_wid,
       cast(st.updatedate as string) as last_update_date,
       null as warehouse_wid
  from bigdata_ld.fact_sl_ld_zkt_inv_storage st  
  left join bigdata_dw.dm_sl_zkt_dealer_d delaer_zkt
    on st.khbh = delaer_zkt.cust_account_id
  left join bigdata_dw.w_area_d ad
    on delaer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on bd.bg_name = '液态奶事业部'
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = st.wlbh
 where date_add(st.updatedate,31) >= date_add(current_date,0)
   and st.kclx = 'C';
   
insert into table bigdata_dw.fact_sl_dealer_sales_order_tmp
  select bu.row_id,
       regexp_replace(substr(bu.business_date,1,10),'-','') as business_dt_wid,
       wpd.row_wid as product_wid,
       '' as source,
       (bu.qty_pack * -1) quantity_pack,
       (bu.qty_ton * -1) quantity_ton,
       cast(0 as bigint) as amount,
       bd.row_wid as bg_wid,
       nvl(deale_dms.row_wid, 0) deale_wid,
       bu.order_type,
       current_date as w_insert_dt,
       bu.datasource_id,
       bu.row_id as integration_id,
       nvl(ad.row_wid,-1) area_wid,
       bu.changed_on_dt as last_update_date,
       null as warehouse_wid
  from bigdata_ld.fact_sl_ld_dms_st_business bu
  left join bigdata_dw.dm_dms_dealer_d deale_dms
    on bu.dealer_id = deale_dms.integration_id and bu.bg_code = deale_dms.bg_code
  left join bigdata_dw.w_area_d ad
    on deale_dms.area_code = ad.code
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = bu.prodnum
  left join bigdata_dw.w_bg_d bd
    on case when bu.bg_code = 'SN' then '酸奶事业部'
            when bu.bg_code = 'NF' then '奶粉事业部'
            when bu.bg_code = 'YN' then '液态奶事业部'
            when bu.bg_code = 'LY' then '冷饮事业部'
            when bu.bg_code = 'YP' then '健康饮品事业部'
             else '缺省' end = bd.bg_name
 where 1 = 1   
   and cast(substr(bu.changed_on_dt,1,10) as date) >= date_sub(current_date,1)
   and bu.order_type in ('销售出库', '退货入库', '积分订单出库', '回货入库', '回单入库')
   and bu.bg_code in('SN','NF','LY','YP');
   
insert into table bigdata_dw.fact_sl_dealer_sales_order_tmp
select bu.row_id,
       regexp_replace(substr(bu.business_date,1,10),'-','') as business_dt_wid,
       wpd.row_wid as product_wid,
       '' as source,
       (bu.qty_pack * -1) quantity_pack,
       (bu.qty_ton * -1) quantity_ton,
       cast(0 as bigint) as amount,
       bd.row_wid as bg_wid,
       nvl(dealer_zkt.row_wid, 0) deale_wid,
       bu.order_type,
       current_date as w_insert_dt,
       bu.datasource_id,
       bu.row_id as integration_id,
       nvl(ad.row_wid,-1) area_wid,
       bu.changed_on_dt as last_update_date,
       null as warehouse_wid
  from 
(select bu.* from bigdata_ld.fact_sl_ld_dms_st_business bu, bigdata_dw.dm_dms_dealer_d a, bigdata_dw.fact_sl_zkt_to_dms per
 where bu.dealer_code = a.dealer_erp_code
   and a.bg_code = 'YN'
   and bu.order_type in
       ('销售出库', '退货入库', '积分订单出库', '回货入库', '回单入库')
   and bu.bg_code = 'YN'
   and a.bg_region_name = per.bg_region_name
   and a.bg_area_name = per.bg_area_name
   and regexp_replace(substr(bu.business_date,1,10),'-','') >= per.c_date) bu
  left join bigdata_dw.dm_dms_dealer_d deale_dms
    on bu.dealer_id = deale_dms.integration_id and bu.bg_code = deale_dms.bg_code
  left join bigdata_dw.dm_sl_zkt_dealer_d dealer_zkt
    on deale_dms.dealer_erp_code = dealer_zkt.dealer_code
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    ON case when bu.bg_code = 'SN' then '酸奶事业部'
            when bu.bg_code = 'NF' then '奶粉事业部'
            when bu.bg_code = 'YN' then '液态奶事业部'
            when bu.bg_code = 'LY' then '冷饮事业部'
             else '缺省' end = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = bu.prodnum
 where 1 = 1   
   and cast(substr(bu.changed_on_dt,1,10) as date) >= date_sub(current_date,1)
   and bu.bg_code = 'YN';

----------------增量数据放入全量表

drop table bigdata_dw.fact_sl_dealer_sales_order_pre;
create table bigdata_dw.fact_sl_dealer_sales_order_pre as
select * from bigdata_dw.fact_sl_dealer_sales_order aa 
where not exists(select 1 from bigdata_dw.fact_sl_dealer_sales_order_tmp bb
where aa.integration_id = bb.integration_id);

insert into table bigdata_dw.fact_sl_dealer_sales_order_pre 
select * from bigdata_dw.fact_sl_dealer_sales_order_tmp;

-----------
insert overwrite table bigdata_dw.fact_sl_dealer_sales_order
select * from bigdata_dw.fact_sl_dealer_sales_order_pre;
