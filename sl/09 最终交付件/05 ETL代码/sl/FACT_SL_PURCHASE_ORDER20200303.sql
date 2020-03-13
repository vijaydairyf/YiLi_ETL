-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_purchase_order/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dw.fact_sl_purchase_order
-- project:
-- note:
-- purpose:                 经销商采购单F表
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

insert overwrite table bigdata_dw.fact_sl_purchase_order_tmp 
--create table bigdata_dw.fact_sl_purchase_order_tmp as
--zkt
select cast(a.zkt_head_id as string) as head_id,
       a.order_number as head_order_no,
       cast(substr(regexp_replace(a.ordertime,'-',''),1,8) as bigint) ordre_date_wid,
       a.ordertime as head_ordre_date,
       cast(a.zkt_line_id as string) as line_id,
       '-1' as erp_dealer_code,
       nvl(wpd.row_wid,-1) as product_wid,
       'YN' as bg_code,
       a.bg_name,
       '' as plan_ship_dt,
       '' as ship_dt,
       '' as erp_order_dt,
       case when a.ordertype=1 then '常配'
     when  a.ordertype=0 then '日配'
     end  as ordertype,
       '' as source,
       cast(a.qty as decimal(38,10)) as quantity,
       a.wht as ton,
       0 as amount,
       '' as status,
       nvl(bg.row_wid,-1) as bg_wid,
       nvl(zkt_dealer.row_wid,0) as dms_dealer_wid,
       nvl(b.row_wid, 0) sales_order_wid,
       null as warehouse_wid,
       concat(a.zkt_line_id,'-zkt') as integration_id,
       'ZKT' as datasource_id,
       current_date as w_insert_dt,
       0 as ship_cycle,
       nvl(req.row_wid,0) as request_type_wid,
       cast(a.header_id as string) as erp_header_id,
       '' as erp_line_id,
       a.order_number as erp_header_num,
       0 as quantitybuy_ton,
       0 as audit_quantity_ton,
       0 as audit_quantity,
       0 as audit_quantity_pack,
       0 as quantity_pack,
       0 as quantity_buy_pack
  from bigdata_ld.fact_sl_ld_zkt_order a
  left join bigdata_dw.dm_sl_sales_order_d b
    on a.header_id = b.header_id
  left join bigdata_dw.w_product_d wpd
    on a.item_no = wpd.integration_id
  left join bigdata_dw.w_bg_d bg
    on a.bg_name = bg.bg_name
  left join bigdata_dw.dm_sl_zkt_dealer_d zkt_dealer
    on a.did = zkt_dealer.integration_id
  left join bigdata_dw.dm_sl_request_type_d req
    on a.gongchang = req.lookup_code
    where substr(a.updatetime,1,10)>= date_sub(current_date,6)
union all
---dms no milk
select a.head_id,
       a.orderno head_order_no,
       cast(regexp_replace(a.order_date, '-','') as bigint) ordre_date_wid,
       a.order_date as head_ordre_date,
       a.line_id,
       a.erp_dealer_code,
       nvl(wpd.row_wid, -1) as product_wid,
       a.ou_type bg_code,
       a.bg_name,
       regexp_replace(a.plan_ship_dt, '-','') plan_ship_dt,
       a.ship_dt,
       '' as erp_order_dt,
       a.ordertype,
       a.source,
       a.quantity as quantity,
       a.ton,
       a.row_money amount,
       case
         when a.indent_flag = '0' then
          '新建'
         when a.indent_flag = '1' then
          '提交'
         when a.indent_flag = '1-0' then
          '确认不通过'
         when a.indent_flag = '1-1' then
          '确认'
         when a.indent_flag = '2' then
          '审批不通过'
         when a.indent_flag = '3' then
          '审批通过'
         when a.indent_flag = '5' then
          '已发货'
         when a.indent_flag = '6' then
          '已收货'
         when a.indent_flag = '10' then
          '关闭'
         when a.indent_flag = '11' then
          '分仓确认'
         else
          '未知'
       end status,
       nvl(bg.row_wid, -1) as bg_wid,
       nvl(zkt_dealer.row_wid, 0) as dms_dealer_wid,
       nvl(b.row_wid, -1) as sales_order_wid,
       null as warehouse_wid,
       concat_ws('_',a.line_id,a.datasource_id) as integration_id,
       a.datasource_id,
       current_date w_insert_dt,
       a.ship_cycle,
       0 as request_type_wid,
       a.erpid,
       a.erp_line_id,
       a.erpno,
       quantitybuy_ton,
       audit_quantity_ton,
       cast(audit_quantity as int) as audit_quantity,
       cast(audit_quantity_pack as int) as audit_quantity_pack,  
       cast(quantity_pack as int) as quantity_pack,       
       cast(quantity_buy_pack as int) as quantity_buy_pack
  from bigdata_ld.fact_sl_ld_dms_purchase_order a
 inner join bigdata_dw.dm_sl_sales_order_d b
    on a.erpid = b.header_id
  left join bigdata_dw.w_product_d wpd
    on a.product_no = wpd.integration_id
  left join bigdata_dw.w_bg_d bg
    on a.bg_name = bg.bg_name
  left join bigdata_dw.dm_dms_dealer_d zkt_dealer
    on a.dealer_id = zkt_dealer.integration_id and a.bg_name = zkt_dealer.bg_name
 where a.ou_type <> 'YN' and substr(a.last_update,1,10)>= date_sub(current_date,6)
union all
select a.head_id,
       a.orderno head_order_no,
       cast(regexp_replace(a.order_date, '-', '') as bigint) ordre_date_wid,
       a.order_date as head_ordre_date,
       a.line_id,
       a.erp_dealer_code,
       nvl(wpd.row_wid, -1) as product_wid,
       a.ou_type bg_code,
       a.bg_name,
       regexp_replace(a.plan_ship_dt, '-', '') plan_ship_dt,
       a.ship_dt,
       '' as erp_order_dt,
       a.ordertype,
       a.source,
       a.quantity as quantity,
       a.ton,
       a.row_money amount,
       case
         when a.indent_flag = '0' then
          '新建'
         when a.indent_flag = '1' then
          '提交'
         when a.indent_flag = '1-0' then
          '确认不通过'
         when a.indent_flag = '1-1' then
          '确认'
         when a.indent_flag = '2' then
          '审批不通过'
         when a.indent_flag = '3' then
          '审批通过'
         when a.indent_flag = '5' then
          '已发货'
         when a.indent_flag = '6' then
          '已收货'
         when a.indent_flag = '10' then
          '关闭'
         when a.indent_flag = '11' then
          '分仓确认'
         else
          '未知'
       end status,
       nvl(bg.row_wid, -1) as bg_wid,
       nvl(zkt_dealer.row_wid, 0) as dms_dealer_wid,
       nvl(a.row_wid, -1) as sales_order_wid,
       null as warehouse_wid,
       concat_ws('_', a.line_id, 'ZKT') as integration_id,
       'ZKT' as datasource_id,
       current_date w_insert_dt,
       a.ship_cycle,
       0 as request_type_wid,
       a.erpid,
       a.erp_line_id,
       a.erpno,
       quantitybuy_ton,
       audit_quantity_ton,
       cast(audit_quantity as int) as audit_quantity,
       cast(audit_quantity_pack as int) as audit_quantity_pack,
       cast(quantity_pack as int) as quantity_pack,
       cast(quantity_buy_pack as int) as quantity_buy_pack
    from (select a.*, b.row_wid
          from bigdata_ld.fact_sl_ld_dms_purchase_order a,
               bigdata_dw.dm_sl_sales_order_d         b,
               bigdata_dw.fact_sl_zkt_to_dms            per
         where a.erpid = b.header_id
           and a.ou_type = 'YN'
           and b.big_area_name = per.bg_region_name
           and b.area_name = per.bg_area_name
           and regexp_replace(substr(a.order_date, 1, 10), '-', '') >= per.c_date
           and substr(a.last_update,1,10)>= date_sub(current_date,6)
           ) a
  left join bigdata_dw.w_product_d wpd
    on a.product_no = wpd.integration_id
  left join bigdata_dw.w_bg_d bg
    on a.bg_name = bg.bg_name
  left join bigdata_dw.dm_sl_zkt_dealer_d zkt_dealer
    on a.erp_dealer_code = zkt_dealer.dealer_code;
---------------

----------------增量数据放入全量表
insert overwrite table bigdata_dw.fact_sl_purchase_order
--create table bigdata_dw.fact_sl_purchase_order_pre as
select * from bigdata_dw.fact_sl_purchase_order aa 
where not exists(select 1 from bigdata_dw.fact_sl_purchase_order_tmp bb
where aa.line_id = bb.line_id) 
union all
select * from bigdata_dw.fact_sl_purchase_order_tmp;

