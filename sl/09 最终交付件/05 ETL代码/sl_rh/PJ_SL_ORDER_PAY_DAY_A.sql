-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SL_ORDER_PAY_DAY_A.sql
-- source table:            BIGDATA_DW.FACT_SL_PURCHASE_ORDER,BIGDATA_DW.DM_SL_SALES_ORDER_D,BIGDATA_DW.W_PRODUCT_D,BIGDATA_DW.W_BG_D,BIGDATA_DW.W_AREA_D,BIGDATA_DW.DM_SL_ZKT_DEALER_D,BIGDATA_DW.W_DEALER_D,BIGDATA_DW.DM_SL_REQUEST_TYPE_D
-- target table:            
-- project:
-- note:
-- purpose:                 及时上款比例日报
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
insert overwrite table bigdata_dm.PJ_SL_ORDER_PAY_DAY_A
SELECT cast(date_format(SO.REQUEST_DATE, 'yyyyMMdd') as bigint) DAY_WID,
       cast(BG.ROW_WID as bigint) BU_WID,
       cast(AD.ROW_WID as bigint) AREA_WID,
       cast(DD.ROW_WID as bigint) DEALER_WID,
       cast(RT.ROW_WID as bigint) REQUEST_TYPE_WID,
       cast(SUM(PO.TON) as decimal(38,10)) ORDER_QTD_T,
       cast(SUM(CASE
             WHEN (unix_timestamp(BOOKED_DATE) - unix_timestamp(REQUEST_DATE))/3600 < 6 THEN
              PO.TON
             ELSE
              0
           END) as decimal(38,10)) PAY_QTD_T,
       cast(SUM(CASE
             WHEN (unix_timestamp(BOOKED_DATE) - unix_timestamp(REQUEST_DATE))/3600 >= 6 THEN
              PO.TON
             ELSE
              0
           END) as decimal(38,10)) NO_PAY_QTD_T,
       cast(BP.VALUE as decimal(38,10)) TARGET_ORDER_PAY,
       current_timestamp W_INSERT_DT
  FROM BIGDATA_DW.FACT_SL_PURCHASE_ORDER PO
 inner join BIGDATA_DW.DM_SL_SALES_ORDER_D SO
    on PO.ERP_HEADER_ID = SO.HEADER_ID --内关联取已登记订单
 inner join BIGDATA_DW.W_PRODUCT_D PD
    on PO.PRODUCT_WID = PD.ROW_WID
  left join BIGDATA_DW.W_BG_D BG
    on PO.BG_NAME = BG.BG_NAME
  left join BIGDATA_DW.W_AREA_D AD
    on SO.AREA_FIVE_CODE = AD.CODE
  left join BIGDATA_DW.DM_SL_ZKT_DEALER_D ZDD
    on PO.DMS_DEALER_WID = ZDD.ROW_WID
 inner join BIGDATA_DW.W_DEALER_D DD
    on ZDD.DEALER_CODE = DD.DALER_CODE
  left join BIGDATA_DW.DM_SL_REQUEST_TYPE_D RT
    on PO.REQUEST_TYPE_WID = RT.ROW_WID, BIGDATA_DW.W_BIGDATA_P BP
 where 1 = 1
   AND PO.BG_WID = 5--PO.DATASOURCE_ID = 'ZKT'
   AND PD.PRODUCT_TYPE = 'CPCP' --只筛选常配类型产品
   AND BP.NAME = '及时上款率'
 GROUP BY date_format(SO.REQUEST_DATE, 'yyyyMMdd'),
          BG.ROW_WID,
          AD.ROW_WID,
          DD.ROW_WID,
          RT.ROW_WID,
          BP.VALUE
UNION ALL
SELECT cast(date_format(SO.REQUEST_DATE, 'yyyyMMdd') as bigint) DAY_WID,
       cast(BG.ROW_WID as bigint) BU_WID,
       cast(AD.ROW_WID as bigint) AREA_WID,
       cast(DD.ROW_WID as bigint) DEALER_WID,
       cast(RT.ROW_WID as bigint) REQUEST_TYPE_WID,
       cast(SUM(PO.TON) as decimal(38,10)) ORDER_QTD_T,
       cast(SUM(CASE
             WHEN (unix_timestamp(BOOKED_DATE) - unix_timestamp(REQUEST_DATE))/3600 < 6 THEN
              PO.TON
             ELSE
              0
           END) as decimal(38,10)) PAY_QTD_T,
       cast(SUM(CASE
             WHEN (unix_timestamp(BOOKED_DATE) - unix_timestamp(REQUEST_DATE))/3600 >= 6 THEN
              PO.TON
             ELSE
              0
           END) as decimal(38,10)) NO_PAY_QTD_T,
       cast(BP.VALUE as decimal(38,10)) TARGET_ORDER_PAY,
       current_timestamp W_INSERT_DT
  FROM BIGDATA_DW.FACT_SL_PURCHASE_ORDER PO
 inner join BIGDATA_DW.DM_SL_SALES_ORDER_D SO
    on PO.ERP_HEADER_ID = SO.HEADER_ID --内关联取已登记订单
 inner join BIGDATA_DW.W_PRODUCT_D PD
    on PO.PRODUCT_WID = PD.ROW_WID
  left join BIGDATA_DW.W_BG_D BG
    on PO.BG_NAME = BG.BG_NAME
  left join BIGDATA_DW.W_AREA_D AD
    on SO.AREA_FIVE_CODE = AD.CODE
  left join BIGDATA_DW.DM_DMS_DEALER_D ZDD
    on PO.DMS_DEALER_WID = ZDD.ROW_WID
 inner join BIGDATA_DW.W_DEALER_D DD
    on ZDD.DEALER_ERP_CODE = DD.DALER_CODE AND ZDD.BG_CODE = 'YP'
  left join BIGDATA_DW.DM_SL_REQUEST_TYPE_D RT
    on PO.REQUEST_TYPE_WID = RT.ROW_WID, BIGDATA_DW.W_BIGDATA_P BP
 where 1 = 1
   AND PO.BG_WID =6
   AND BP.NAME = '及时上款率'
 GROUP BY date_format(SO.REQUEST_DATE, 'yyyyMMdd'),
          BG.ROW_WID,
          AD.ROW_WID,
          DD.ROW_WID,
          RT.ROW_WID,
          BP.VALUE;

