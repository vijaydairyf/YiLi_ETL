-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_ERP_SALES_ORDER_TMP.sql
-- source table:            bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER
-- target table:            
-- project:
-- note:
-- purpose:                 销售订单事实中间表
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
insert overwrite table BIGDATA_DW.FACT_SL_ERP_SALES_ORDER_TMP
select so.header_id HEAD_ID,
       so.order_number HEAD_NO,
       so.ordered_date ORDRE_DATE,
       so.line_id,
       so.ordered_item PRODUCT_NUM,'',so.sales_qty_box QUANTITY,
       so.sales_qty_tom TON,
       so.sales_qty * so.unit_selling_price AMOUNT,
       so.flow_status_code STATUS,
       so.business_name BG_NAME,
       so.cust_account_id DEALER_ID,
       so.header_id ORDER_HEADER_ID,
       so.order_type ORDERTYPE1,
       date_format(so.attribute20, 'yyyy-MM-dd HH:mm:ss') ASSIGN_WAREHOUSE_DT,
       so.organization_code WAREHOUSE_CODE,
       so.demand_class_code,
       current_timestamp W_INSERT_DT,
       'ERP' DATASOURCE_ID,
       so.line_id INTEGRATION_ID,
       so.CREATION_DATE ERP_CREATE_DT,
       date_format(so.attribute18, 'yyyy-MM-dd HH:mm:ss') BOOK_DT,so.territory_id,'','',so.receive_wh_id,so.receive_wh_code,so.booked_flag,'','',so.booked_date,so.request_date,so.ship_to_org_id,so.invoice_to_org_id,so.ou_id,so.cancelled_flag,so.sales_qty,so.unit_selling_price,so.unit_list_price,date_format(so.CREATION_DATE, 'yyyy-MM') date_
  from bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER so
WHERE BOOKED_FLAG='Y'
 AND so.LAST_UPDATE_DATE > trunc(to_date(add_months(current_date,-1)),'MM');


