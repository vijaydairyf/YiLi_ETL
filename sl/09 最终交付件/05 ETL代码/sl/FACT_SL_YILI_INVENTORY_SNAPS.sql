-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_YILI_INVENTORY_SNAPS.sql
-- source table:            bigdata_dw。FACT_SL_YILI_INVENTORY_SNAPS_TMP,bigdata_DW.W_BG_D,bigdata_dw.DM_SL_WAREHOUSE_D,bigdata_DW.W_PRODUCT_D
-- target table:            
-- project:
-- note:
-- purpose:                 分仓库存余额DW层
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
insert overwrite table bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS partition(date_)
select eq.* from (select f.* from BIGDATA_DW.FACT_SL_YILI_INVENTORY_SNAPS f where date_ in(select date_ from bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS_TMP group by date_) union all select * from BIGDATA_DW.FACT_SL_YILI_INVENTORY_SNAPS where date_='__HIVE_DEFAULT_PARTITION__') eq
where not exists (select tmp.INTEGRATION_ID from bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS_TMP tmp where eq.date_=tmp.date_ and eq.Integration_Id=tmp.Integration_Id)
union all
SELECT cast(date_format(BALANCE_DT,'yyyyMMdd') as bigint) AS BALANCE_DT_WID,cast(T1.ROW_WID as bigint) BG_WID,cast(T3.ROW_WID as bigint) PRODUCT_WID,cast(NULL as bigint) AREA_CODE,cast(T2.ROW_WID as bigint) warehouse_wid,cast(F.QTY_PACK as decimal(38,10)) QTY_PACK,cast(F.QTY_TON as decimal(38,10)) QTY_TON,cast(null as decimal(38,10)) QTY_AMT,cast(F.CREATED_ON_DT as string) CREATED_ON_DT,F.DATASOURCE_ID,F.INTEGRATION_ID,cast(NULL as string),cast(current_timestamp as string) AS W_INSERT_DT,F.LOCATION,cast(substr(date_format(BALANCE_DT,'yyyyMMdd'),1,6) as string) date_
  FROM bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS_TMP F
  LEFT JOIN bigdata_DW.W_BG_D T1
    ON T1.BG_NAME = F.BG_CODE
  LEFT JOIN bigdata_dw.DM_SL_WAREHOUSE_D T2
    ON T2.WH_CODE = F.INVENTORY_CODE
  LEFT JOIN bigdata_DW.W_PRODUCT_D T3
    ON T3.PROD_INT_CODE = F.PRODUCT_CODE;
