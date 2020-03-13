-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SL_DEALER_IN_STORE_MONTH_A.sql
-- source table:            bigdata_dm.PJ_SL_DEALER_IN_STORE_DAY_A
-- target table:            
-- project:
-- note:
-- purpose:                 经销商有货率月报
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
insert overwrite table bigdata_dm.PJ_SL_DEALER_IN_STORE_MONTH_A
SELECT cast(C.MONTH_WID as bigint),
       cast(C.BU_WID as bigint),
       cast(C.PRODUCT_WID as bigint),
       cast(C.AREA_WID as bigint),
       cast(C.DMS_DEALER_WID as bigint),cast(substr(C.MONTH_WID,1,4) as bigint),cast(C.INVENTORY_T as decimal(38,10)),
       cast(C.SALES_QTY_T as decimal(38,10)),
       cast(C.SKU_30_QTY as decimal(38,10)),
       cast(C.INVENTORY_SKU_QTY as decimal(38,10)),
       cast(L.LY_SKU_30_QTY as decimal(38,10)),
       cast(L.LY_INVENTORY_SKU_QTY as decimal(38,10)),
       cast(C.TARGET_IN_STORE_RATE as decimal(38,10)),
       current_timestamp AS W_INSERT_DT
  FROM (SELECT SUBSTR(DAY_WID, 1, 6) MONTH_WID, --取每月
               BU_WID AS BU_WID,
               PRODUCT_WID,
               AREA_WID,
               DMS_DEALER_WID,
               SUM(CASE
                     WHEN DAY_WID =
                          DATE_FORMAT(LAST_DAY(CONCAT(SUBSTR(DAY_WID, 1, 4),
                                                      '-',
                                                      SUBSTR(DAY_WID, 5, 2),
                                                      '-',
                                                      SUBSTR(DAY_WID, 7, 2))),
                                      'yyyyMMdd') THEN
                      INVENTORY_T
                     ELSE
                      0
                   END) AS INVENTORY_T, --经销商库存量
               SUM(SALES_QTY_T) AS SALES_QTY_T, --经销商销量
               SUM(SKU_30_QTY) AS SKU_30_QTY, --经销商往前30有销售SKU数量,经销商有货率分母
               SUM(CASE
                     WHEN INVENTORY_SKU_QTY = 1 THEN
                      1
                     ELSE
                      0
                   END) AS INVENTORY_SKU_QTY, --经销商有货率分子
               TARGET_IN_STORE_RATE
          FROM BIGDATA_DM.PJ_SL_DEALER_IN_STORE_DAY_A
         WHERE 1 = 1
         GROUP BY SUBSTR(DAY_WID, 1, 6),
                  BU_WID,
                  PRODUCT_WID,
                  AREA_WID,
                  DMS_DEALER_WID,
                  TARGET_IN_STORE_RATE) C
  LEFT JOIN (SELECT SUBSTR(DAY_WID, 1, 6) AS MONTH_WID,
                    BU_WID AS BU_WID,
                    PRODUCT_WID,
                    AREA_WID,
                    DMS_DEALER_WID,
                    SUM(SKU_30_QTY) AS LY_SKU_30_QTY, --经销商往前30有销售SKU数量,经销商有货率分母
                    SUM(CASE
                          WHEN INVENTORY_SKU_QTY = 1 THEN
                           1
                          ELSE
                           0
                        END) AS LY_INVENTORY_SKU_QTY --经销商有货率分子
               FROM BIGDATA_DM.PJ_SL_DEALER_IN_STORE_DAY_A
              WHERE 1 = 1
              GROUP BY SUBSTR(DAY_WID, 1, 6),
                       BU_WID,
                       PRODUCT_WID,
                       AREA_WID,
                       DMS_DEALER_WID) L
    ON C.MONTH_WID - 100 = L.MONTH_WID
   AND C.BU_WID = L.BU_WID
   AND C.PRODUCT_WID = L.PRODUCT_WID
   AND C.AREA_WID = L.AREA_WID
   AND C.DMS_DEALER_WID = L.DMS_DEALER_WID;
