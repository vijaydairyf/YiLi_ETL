-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SL_DELAY_ORDER_DAY_A.sql
-- source table:            bigdata_dw.FACT_SL_ERP_SALES_ORDE,bigdata_dw.w_dealer_d,bigdata_dw.W_PRODUCT_D,bigdata_dw.DM_SL_WAREHOUSE_D
-- target table:            
-- project:
-- note:
-- purpose:                 滞留订单日报
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
insert overwrite table bigdata_dm.PJ_SL_DELAY_ORDER_DAY_A
select sof.ordre_date_wid DAY_WID,
       sof.bg_wid BU_WID,
       sof.AREA_WID,
       sof.product_wid,
       sof.dealer_wid CUST_WID,
       sof.request_type_wid SEND_WID,
       case
         when wd.dealer_type1 = '外部' then
          sof.dealer_wid
         when wd.dealer_type1 = '内部' then
          sof.receive_wh_wid
         else
          null
       end RECEVIED_WID,
       wd.dealer_type1 CLINET_TYPE,
       sof.head_id ORDER_NUM,
       sum(sof.ton) ORDER_QTD_T,
       sum(sof.sales_qty * sof.unit_list_price) ORDER_AMT,
       current_timestamp W_INSERT_DT
  from bigdata_dw.FACT_SL_ERP_SALES_ORDER sof
  left join bigdata_dw.w_dealer_d wd
    on sof.dealer_wid = wd.row_wid
  left join bigdata_dw.W_PRODUCT_D wpd
    on sof.product_wid = wpd.row_wid
 where sof.status in ('AWAITING_SHIPPING', 'BOOKED')
   and sof.ordertype1 not like '%补货%'
   and wpd.product_type in ('CPCP', 'RPCP')
   and wpd.item_category_one_code = '20'
   and sof.bg_wid = 5
   and sof.request_date >=
       from_unixtime(unix_timestamp() - 90 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
   and sof.request_date <=
       from_unixtime(unix_timestamp() + 30 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
 group by sof.ordre_date_wid,
          sof.bg_wid,
          sof.AREA_WID,
          sof.product_wid,
          sof.dealer_wid,
          sof.request_type_wid,
          case
            when wd.dealer_type1 = '外部' then
             sof.dealer_wid
            when wd.dealer_type1 = '内部' then
             sof.receive_wh_wid
            else
             null
          end,
          wd.dealer_type1,
          sof.head_id
union all
select sof.ordre_date_wid DAY_WID,
       sof.bg_wid BU_WID,
       sof.AREA_WID,
       sof.product_wid,
       sof.dealer_wid CUST_WID,
       sof.request_type_wid SEND_WID,
       case
         when wd.dealer_type1 = '外部' then
          sof.dealer_wid
         when wd.dealer_type1 = '内部' then
          sof.receive_wh_wid
         else
          null
       end RECEVIED_WID,
       wd.dealer_type1 CLINET_TYPE,
       sof.head_id ORDER_NUM,
       sum(sof.ton) ORDER_QTD_T,
       sum(sof.sales_qty * sof.unit_list_price) ORDER_AMT,
       current_timestamp W_INSERT_DT
  from bigdata_dw.FACT_SL_ERP_SALES_ORDER sof
  left join bigdata_dw.w_dealer_d wd
    on sof.dealer_wid = wd.row_wid
  left join bigdata_dw.W_PRODUCT_D wpd
    on sof.product_wid = wpd.row_wid
 where sof.status in ('AWAITING_SHIPPING', 'BOOKED')
   and sof.ordertype1 not like '%补货%'
   and wpd.item_category_one_code = '28'
   and sof.bg_wid = 6
   and sof.request_date >=
       from_unixtime(unix_timestamp() - 90 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
   and sof.request_date <=
       from_unixtime(unix_timestamp() + 30 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
 group by sof.ordre_date_wid,
          sof.bg_wid,
          sof.AREA_WID,
          sof.product_wid,
          sof.dealer_wid,
          sof.request_type_wid,
          case
            when wd.dealer_type1 = '外部' then
             sof.dealer_wid
            when wd.dealer_type1 = '内部' then
             sof.receive_wh_wid
            else
             null
          end,
          wd.dealer_type1,
          sof.head_id
union all
select sof.ordre_date_wid DAY_WID,
       sof.bg_wid BU_WID,
       sof.AREA_WID,
       sof.product_wid,
       sof.dealer_wid CUST_WID,
       sof.warehouse_wid SEND_WID,
       sof.dealer_wid RECEVIED_WID,
       wd.dealer_type1 CLINET_TYPE,
       sof.head_id ORDER_NUM,
       sum(sof.ton) ORDER_QTD_T,
       sum(sof.sales_qty * sof.unit_list_price) ORDER_AMT,
       current_timestamp W_INSERT_DT
  from bigdata_dw.FACT_SL_ERP_SALES_ORDER sof
  left join bigdata_dw.w_dealer_d wd
    on sof.dealer_wid = wd.row_wid
  left join bigdata_dw.W_PRODUCT_D wpd
    on sof.product_wid = wpd.row_wid
  left join bigdata_dw.DM_SL_WAREHOUSE_D wwd
    on sof.warehouse_wid = wwd.row_wid
 where sof.status in ('AWAITING_SHIPPING', 'BOOKED')
   and sof.ordertype1 not like '%补货%'
   and wpd.item_category_one_code = '24'
   and wd.dealer_type1 = '外部'
   and sof.bg_wid = 2
   and sof.request_date >=
       from_unixtime(unix_timestamp() - 90 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
   and sof.request_date <=
       from_unixtime(unix_timestamp() + 30 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
   and (wwd.parent_name <> '230100 Oceania Dairy Limited' or
       wwd.parent_name is null)
 group by sof.ordre_date_wid,
          sof.bg_wid,
          sof.AREA_WID,
          sof.product_wid,
          sof.dealer_wid,
          sof.warehouse_wid,
          sof.dealer_wid,
          wd.dealer_type1,
          sof.head_id
union all
select sof.ordre_date_wid DAY_WID,
       sof.bg_wid BU_WID,
       sof.AREA_WID,
       sof.product_wid,
       sof.dealer_wid CUST_WID,
       sof.request_type_wid SEND_WID,
       sof.receive_wh_wid RECEVIED_WID,
       wd.dealer_type1 CLINET_TYPE,
       sof.head_id ORDER_NUM,
       sum(sof.ton) ORDER_QTD_T,
       sum(sof.sales_qty * sof.unit_list_price) ORDER_AMT,
       current_timestamp W_INSERT_DT
  from bigdata_dw.FACT_SL_ERP_SALES_ORDER sof
  left join bigdata_DW.w_dealer_d wd
    on sof.dealer_wid = wd.row_wid
  left join bigdata_DW.W_PRODUCT_D wpd
    on sof.product_wid = wpd.row_wid
 where sof.status in ('AWAITING_SHIPPING', 'BOOKED')
   and sof.ordertype1 = '奶粉内部调拨转移订单'
   and wpd.item_category_one_code = '24'
   and wd.dealer_type1 = '内部'
   and sof.bg_wid = 2
   and sof.request_date >=
       from_unixtime(unix_timestamp() - 90 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
   and sof.request_date <=
       from_unixtime(unix_timestamp() + 30 * 24 * 60 * 60,
                     "yyyy-MM-dd HH:mm:ss")
 group by sof.ordre_date_wid,
          sof.bg_wid,
          sof.AREA_WID,
          sof.product_wid,
          sof.dealer_wid,
          sof.request_type_wid,
          sof.receive_wh_wid,
          wd.dealer_type1,
          sof.head_id;
