-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_ERP_SALES_ORDER.sql
-- source table:            BIGDATA_DW.FACT_SL_ERP_SALES_ORDER_TMP,BIGDATA_DW.W_PRODUCT_D,BIGDATA_DW.DM_SL_WAREHOUSE_D,BIGDATA_DW.DM_SL_SALES_ORDER_D,BIGDATA_DW.W_BG_D,BIGDATA_DW.DM_SL_REQUEST_TYPE_D,BIGDATA_DW.W_DEALER_D,BIGDATA_DW.W_AREA_D
-- target table:            
-- project:
-- note:
-- purpose:                 销售订单事实表
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
insert overwrite table bigdata_dw.FACT_SL_ERP_SALES_ORDER partition(date_)
select eq.* from (select f.* from bigdata_dw.FACT_SL_ERP_SALES_ORDER f where date_ in(select date_ from bigdata_dw.FACT_SL_ERP_SALES_ORDER_TMP group by date_)) eq
where not exists (select tmp.INTEGRATION_ID from bigdata_dw.FACT_SL_ERP_SALES_ORDER_TMP tmp where eq.date_=tmp.date_ and eq.INTEGRATION_ID=tmp.INTEGRATION_ID)
union all
select sof.head_id head_id,sof.head_no head_no,cast(date_format(substr(sof.ordre_date,1,10),"yyyyMMdd") as bigint) ordre_date_wid,sof.line_id line_id,cast(nvl(wp.row_wid, -1) as bigint) product_wid,cast(null as string) ordertype2,sof.source source,cast(sof.quantity as decimal(38,10)) quantity,cast(sof.ton as decimal(38,10)) ton,cast(sof.amount as decimal(38,10)) amount,sof.status status,cast(nvl(wb.row_wid, -1) as bigint) bg_wid,cast(nvl(sdd.row_wid, -1) as bigint) dealer_wid,cast(nvl(sod.row_wid, 0) as bigint) order_wid,sof.ordertype1 ordertype1,cast(sof.assign_warehouse_dt as string) assign_warehouse_dt,cast(nvl(ww.row_wid, 0) as bigint) warehouse_wid,cast(current_timestamp as string) w_insert_dt,sof.datasource_id datasource_id,sof.integration_id integration_id,cast(sof.erp_create_dt as string) erp_create_dt,cast(sof.book_dt as string) book_dt,cast(null as decimal(38,10)) delay_ton,cast(null as decimal(38,10)) delay_pack,cast(nvl(srt.row_wid, 0) as bigint) request_type_wid,cast(sof.RECEIVE_WH_ID as decimal(38,10)) receive_wh_id,sof.RECEIVE_WH_CODE receive_wh_code,cast(sof.OU_ID as decimal(38,10)) ou_id,sof.CANCELLED_FLAG cancelled_flag,sof.booked_flag booked_flag,cast(sof.booked_date as string) booked_date,cast(sof.request_date as string) request_date,cast(sof.ship_to_org_id as decimal(38,10)) ship_to_org_id,cast(sof.invoice_to_org_id as decimal(38,10)) invoice_to_org_id,cast(nvl(ww1.row_wid, 0) as bigint) receive_wh_wid,cast(nvl(wad.row_wid, -1) as bigint) area_wid,cast(sof.sales_qty as decimal(38,10)) sales_qty,cast(sof.unit_selling_price as decimal(38,10)) unit_selling_price,cast(sof.unit_list_price as decimal(38,10)) unit_list_price,date_
  FROM BIGDATA_DW.FACT_SL_ERP_SALES_ORDER_TMP SOF
  LEFT JOIN BIGDATA_DW.W_PRODUCT_D WP ON SOF.PRODUCT_NUM = WP.INTEGRATION_ID
  LEFT JOIN BIGDATA_DW.DM_SL_WAREHOUSE_D WW ON SOF.WAREHOUSE_CODE = WW.WH_CODE
  LEFT JOIN BIGDATA_DW.DM_SL_WAREHOUSE_D WW1 ON SOF.RECEIVE_WH_CODE = WW1.WH_CODE
  LEFT JOIN BIGDATA_DW.DM_SL_SALES_ORDER_D SOD ON SOF.ORDER_HEADER_ID = SOD.HEADER_ID
  LEFT JOIN BIGDATA_DW.W_BG_D WB ON SOF.BG_NAME = WB.BG_NAME
  LEFT JOIN BIGDATA_DW.DM_SL_REQUEST_TYPE_D SRT ON SOF.DEMAND_CLASS_CODE = SRT.LOOKUP_CODE
  LEFT JOIN BIGDATA_DW.W_DEALER_D SDD ON SOF.DEALER_ID = SDD.INTEGRATION_ID
  LEFT JOIN  BIGDATA_DW.W_AREA_D WAD ON SOF.TERRITORY_ID = WAD.INTEGRATION_ID;
