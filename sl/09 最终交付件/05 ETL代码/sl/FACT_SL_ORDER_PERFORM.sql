-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_order_perform/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dw.fact_sl_order_perform
-- project:
-- note:
-- purpose:                 订单履行率F表
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

insert overwrite table bigdata_dw.fact_sl_order_perform_tmp1 
select pre.datasource_id,
       pre.integration_id,
       current_date as w_insert_dt,
       current_date as w_update_dt,
       header_id,
       order_number,
       booked_date,
       booked_dt_wid,
       pre.bg_name,
       area_five_code,
       dealer_name,
       dealer_code,
       order_type,
       cpbh,
       down_qty,
       down_wht,
       down_prod,
       up_qty,
       up_wht,
       up_prod,
       nvl(bg.row_wid,0) as bg_wid,
       nvl(dealer.row_wid,-1) as dealer_wid,
       nvl(prod.row_wid,0) as product_wid,
       current_date as etl_run_time,
       nvl(area.row_wid,0) as area_wid,
       nvl(request.row_wid,0) as request_wid,
       nvl(ware.row_wid,0) as wh_wid,
       pre.request_type,
       pre.wh_code,
       erp_header_id
  from bigdata_dw.fact_sl_order_perform_tmp pre
  left join bigdata_dw.w_bg_d bg
  on bg.bg_name = pre.bg_name
  left join bigdata_dw.w_dealer_d dealer
  on dealer.daler_code = pre.DEALER_CODE
  left join bigdata_dw.w_product_d prod
  on prod.integration_id = pre.cpbh
  left join bigdata_dw.w_area_d area
  on area.code = pre.area_five_code
  left join bigdata_dw.dm_sl_warehouse_d ware
  on ware.integration_id = pre.wh_code
  left join bigdata_dw.dm_sl_request_type_d request
  on request.integration_id = pre.request_type;
------------


----------------增量数据放入全量表

insert overwrite table bigdata_dw.fact_sl_order_perform
select * from bigdata_dw.fact_sl_order_perform aa 
where not exists(select 1 from bigdata_dw.fact_sl_order_perform_tmp1 bb
where aa.integration_id = bb.integration_id ) 
union all
select * from bigdata_dw.fact_sl_order_perform_tmp1;

