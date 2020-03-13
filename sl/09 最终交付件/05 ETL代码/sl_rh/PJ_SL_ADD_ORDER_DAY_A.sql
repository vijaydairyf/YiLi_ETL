-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SL_ADD_ORDER_DAY_A.sql
-- source table:            BIGDATA_DW.FACT_SL_ERP_SALES_ORDER,BIGDATA_DW.FACT_SL_PURCHASE_ORDER,BIGDATA_DW.DM_SL_SALES_ORDER_D,BIGDATA_DW.W_AREA_D
-- target table:            
-- project:
-- note:
-- purpose:                 紧急加单率日报
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
insert overwrite table bigdata_dm.PJ_SL_ADD_ORDER_DAY_A partition(date_)
SELECT * FROM (
SELECT T1.DAY_WID DAY_WID,
       cast(T1.BU_WID as bigint) BU_WID,
       cast(T1.WH_WID as bigint) WH_WID,
       cast(T1.AREA_WID as bigint) AREA_WID,
       cast(T1.PRODUCT_WID as bigint) PRODUCT_WID,
       cast(T1.DEALER_WID as bigint) DEALER_WID,
       cast(sum(REQUIER_CYCLE) as decimal(38,10)) AS REQUIER_CYCLE,
       cast(sum(NORMAL_CYCLE) as decimal(38,10)) AS NORMAL_CYCLE,
       cast(ORDER_QTY_NUM as decimal(38,10)),
       cast(sum(ORDER_QTY_T) as decimal(38,10)) AS ORDER_QTY_T,
       cast(sum(ORDER_QTY_J) as decimal(38,10)) AS ORDER_QTY_J,
       cast(sum(ORDER_QTY_AMT) as decimal(38,10)) AS ORDER_QTY_AMT,
       cast(ADD_ORDER_QTY_NUM as decimal(38,10)),
       cast(sum(ADD_ORDER_QTY_T) as decimal(38,10)) AS ADD_ORDER_QTY_T,
       cast(sum(ADD_ORDER_QTY_J) as decimal(38,10)) AS ADD_ORDER_QTY_J,
       cast(sum(ADD_ORDER_QTY_AMT) as decimal(38,10)) AS ADD_ORDER_QTY_AMT,
       current_timestamp AS W_INSERT_DT,cast(T1.DAY_WID as string) as date_
  FROM (SELECT F1.ORDRE_DATE_WID AS DAY_WID,
               F.BG_WID AS BU_WID,
               F.WAREHOUSE_WID AS WH_WID,
               D2.ROW_WID AS AREA_WID,
               F.DEALER_WID AS DEALER_WID,
               F.PRODUCT_WID,
               AVG(datediff(CONCAT(SUBSTR(F1.PLAN_SHIP_DT, 1, 4),
                                   '-',
                                   SUBSTR(F1.PLAN_SHIP_DT, 5, 2),
                                   '-',
                                   SUBSTR(F1.PLAN_SHIP_DT, 7, 2)),
                            CONCAT(SUBSTR(F1.ORDRE_DATE_WID, 1, 4),
                                   '-',
                                   SUBSTR(F1.ORDRE_DATE_WID, 5, 2),
                                   '-',
                                   SUBSTR(F1.ORDRE_DATE_WID, 7, 2)))) AS REQUIER_CYCLE,
               AVG(F1.SHIP_CYCLE) NORMAL_CYCLE,
               --COUNT(DISTINCT F.HEAD_NO) AS ORDER_QTY_NUM,
               F.HEAD_ID AS ORDER_QTY_NUM,
               SUM(F.QUANTITY) AS ORDER_QTY_J,
               SUM(F.TON) AS ORDER_QTY_T,
               SUM(F.SALES_QTY * F.UNIT_LIST_PRICE) AS ORDER_QTY_AMT
          FROM (
                --DMS中云商系统有原始订单量的订单
                SELECT *
                  FROM BIGDATA_DW.FACT_SL_ERP_SALES_ORDER A --订单登记状态为已登记
                 WHERE EXISTS (SELECT B.HEAD_ID
                          FROM BIGDATA_DW.FACT_SL_PURCHASE_ORDER B
                         WHERE A.HEAD_ID = B.ERP_HEADER_ID
                           AND B.SOURCE <> 'ERP' --不取ERP强配订单
                           AND NVL(B.AUDIT_QUANTITY, 0) <> 0) --酸奶审核数量不为0
                ) F
          LEFT JOIN BIGDATA_DW.FACT_SL_PURCHASE_ORDER F1
            ON F.HEAD_ID = F1.ERP_HEADER_ID
           AND F.LINE_ID = F1.ERP_LINE_ID
         INNER JOIN BIGDATA_DW.DM_SL_SALES_ORDER_D D1
            ON F.HEAD_ID = D1.HEADER_ID
         INNER JOIN BIGDATA_DW.W_AREA_D D2
            ON D1.AREA_FIVE_CODE = D2.CODE where F.BG_WID = 1
         GROUP BY F1.ORDRE_DATE_WID,
                  F.BG_WID,
                  F.WAREHOUSE_WID,
                  D2.ROW_WID,
                  F.DEALER_WID,
                  F.PRODUCT_WID,
                  F.HEAD_ID) T1
LEFT JOIN (SELECT F1.ORDRE_DATE_WID AS DAY_WID,
               F.BG_WID          AS BU_WID,
               F.WAREHOUSE_WID   AS WH_WID,
               D2.ROW_WID        AS AREA_WID,
               F.DEALER_WID      AS DEALER_WID,
               F.PRODUCT_WID,
               --COUNT(DISTINCT F.HEAD_NO) AS ADD_ORDER_QTY_NUM,
               F.HEAD_ID AS ADD_ORDER_QTY_NUM,
               SUM(F.QUANTITY) AS ADD_ORDER_QTY_J,
               SUM(F.TON) AS ADD_ORDER_QTY_T,
               SUM(F.SALES_QTY * F.UNIT_LIST_PRICE) AS ADD_ORDER_QTY_AMT
          FROM (
                --DMS中云商系统有原始订单量的订单
                SELECT *
                  FROM BIGDATA_DW.FACT_SL_ERP_SALES_ORDER A --订单登记状态为已登记
                 WHERE EXISTS (SELECT B.HEAD_ID
                          FROM BIGDATA_DW.FACT_SL_PURCHASE_ORDER B
                         WHERE A.HEAD_ID = B.ERP_HEADER_ID
                           AND B.SOURCE <> 'ERP' --不取ERP强配订单
                           AND NVL(B.AUDIT_QUANTITY, 0) <> 0) --酸奶审核数量不为0
                ) F
          LEFT JOIN BIGDATA_DW.FACT_SL_PURCHASE_ORDER F1
            ON F.HEAD_ID = F1.ERP_HEADER_ID
           AND F.LINE_ID = F1.ERP_LINE_ID
         INNER JOIN BIGDATA_DW.DM_SL_SALES_ORDER_D D1
            ON F.HEAD_ID = D1.HEADER_ID
         INNER JOIN BIGDATA_DW.W_AREA_D D2
            ON D1.AREA_FIVE_CODE = D2.CODE
         WHERE F.BG_WID = 1 and datediff(CONCAT(SUBSTR(F1.PLAN_SHIP_DT, 1, 4),
                               '-',
                               SUBSTR(F1.PLAN_SHIP_DT, 5, 2),
                               '-',
                               SUBSTR(F1.PLAN_SHIP_DT, 7, 2)),
                        CONCAT(SUBSTR(F1.ORDRE_DATE_WID, 1, 4),
                               '-',
                               SUBSTR(F1.ORDRE_DATE_WID, 5, 2),
                               '-',
                               SUBSTR(F1.ORDRE_DATE_WID, 7, 2))) <
               F1.SHIP_CYCLE
           AND F1.PLAN_SHIP_DT IS NOT NULL
           AND NVL(F1.SHIP_CYCLE, 0) <> 0
         GROUP BY F1.ORDRE_DATE_WID,
                  F.BG_WID,
                  F.WAREHOUSE_WID,
                  D2.ROW_WID,
                  F.DEALER_WID,
                  F.PRODUCT_WID,
                  F.HEAD_ID) T2
ON T1.DAY_WID = T2.DAY_WID
   AND T1.BU_WID = T2.BU_WID
   AND T1.WH_WID = T2.WH_WID
   AND T1.AREA_WID = T2.AREA_WID
   AND T1.DEALER_WID = T2.DEALER_WID
   AND T1.PRODUCT_WID = T2.PRODUCT_WID
   and T1.ORDER_QTY_NUM = T2.ADD_ORDER_QTY_NUM
 group by T1.DAY_WID,
          T1.BU_WID,
          T1.WH_WID,
          T1.AREA_WID,
          T1.PRODUCT_WID,
          T1.DEALER_WID,
          ORDER_QTY_NUM,
          ADD_ORDER_QTY_NUM,T1.DAY_WID
) t1
where  t1.day_wid>regexp_replace(date_sub(current_date,60),'-','') ;

