-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_YILI_INVENTORY_SNAPS_TMP.sql
-- source table:            bigdata_ld.FACT_SL_LD_ERP_INVENTORY_SNAP_NEW
-- target table:            bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS
-- project:
-- note:
-- purpose:                 分仓库存余额中间表DW层
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
insert overwrite table bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS_TMP
SELECT F.F_DATE AS BALANCE_DT,
       CASE SUBSTR(F.ITEM_NO, 1, 2)
         WHEN '20' THEN
          '液态奶事业部'
         WHEN '21' THEN
          '酸奶事业部'
         WHEN '22' THEN
          '冷饮事业部'
         WHEN '24' THEN
          '奶粉事业部'
         WHEN '28' THEN
          '健康饮品事业部'
       END AS BG_CODE,
       F.ITEM_NO AS PRODUCT_CODE,
       F.WHSE_CODE AS INVENTORY_CODE,
       F.LOCATION,
       F.QUANTITY_BOX AS QTY_PACK,
       QUANTITY_TON AS QTY_TON,
       current_timestamp AS CREATED_ON_DT,
       'ERP' AS DATASOURCE_ID,concat(F.F_DATE, '_', F.WHSE_CODE, '_', F.INVENTORY_ITEM_ID) INTEGRATION_ID,current_timestamp AS W_INSERT_DT,date_format(F.F_DATE,'yyyyMM') date_
  FROM bigdata_ld.FACT_SL_LD_ERP_INVENTORY_SNAP_NEW F
 WHERE F.F_DATE >= date_sub(current_date, 31);
