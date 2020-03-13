-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_SALES_PLAN.sql
-- source table:            bigdata_ld.FACT_SL_LD_SALES_PLAN,bigdata_DW.w_date_d,bigdata_DW.W_PRODUCT_D,bigdata_DW.W_BG_D,bigdata_dw.DM_SL_WAREHOUSE_D
-- target table:            
-- project:
-- note:
-- purpose:                 服务水平销售计划事实dw层
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
insert overwrite table bigdata_dw.FACT_SL_SALES_PLAN partition(date_)
SELECT cast(c.MONTH_WID AS bigint) MONTH_WID,
cast(d1.ROW_WID AS bigint) PRODUCT_WID,
cast(d2.ROW_WID AS bigint) BG_WID,
cast(d3.ROW_WID AS bigint) WAREHOUSE_WID,
cast(c.PLAN_QTY_TON as decimal(38,10)) PLAN_QTY_TON,
cast(null as decimal(38,10)) PLAN_QTY_PACK,cast(current_timestamp as string) W_INSERT_DT,
c.integration_ID integration_ID,
c.datasource_id datasource_id,
cast(c.created_on_dt as string) created_on_dt,
cast(c.plan_qty_ton_day AS decimal(38,10)) plan_qty_ton_day,
cast(null AS decimal(38,10)) plan_qty_pack_day,
cast(c.day_wid AS bigint) day_wid,
c.MONTH_WID as DATE_
FROM
(SELECT
 b.row_wid DAY_wid
 ,a.month AS MONTH_WID
, a.PRODUCT_CODE PRODUCT_CODE
, a.BG_NAME BG_NAME
, a.WAREHOUSE_CODE WAREHOUSE_CODE
, a.PLAN_QTY_TON/b.month_days PLAN_QTY_TON_DAY
, a.PLAN_QTY_TON PLAN_QTY_TON
, a.INTEGRATION_ID INTEGRATION_ID
, a.DATASOURCE_ID DATASOURCE_ID
, a.CREATED_ON_DT CREATED_ON_DT
FROM (SELECT
CONCAT(BG_NAME,'-',BRANCH,'-','-',MONTH,'-',PRODUCT_CODE,'-',WAREHOUSE_CODE) integration_id
, MONTH
, PRODUCT_CODE
, BG_NAME
, WAREHOUSE_CODE
, PLAN_QTY_TON
,'导入平台' datasource_id
,w_insert_dt as CREATED_ON_DT
FROM bigdata_ld.FACT_SL_LD_SALES_PLAN
where MONTH>=date_format(current_date,'yyyyMM')) a,bigdata_DW.w_date_d b
where a.month=substr(cast(row_wid AS string),1,6) and b.dt_type='D') c
LEFT JOIN bigdata_DW.W_PRODUCT_D d1 on c.product_code=d1.product_code
LEFT JOIN bigdata_DW.W_BG_D d2 on c.BG_NAME=d2.BG_NAME
LEFT JOIN bigdata_dw.DM_SL_WAREHOUSE_D d3 on c.WAREHOUSE_CODE=d3.WH_CODE;
