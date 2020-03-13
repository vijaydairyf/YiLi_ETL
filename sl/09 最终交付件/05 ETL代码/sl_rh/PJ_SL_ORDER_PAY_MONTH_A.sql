-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SL_ORDER_PAY_MONTH_A.sql
-- source table:            BIGDATA_DM.PJ_SL_ORDER_PAY_DAY_A
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
insert overwrite table bigdata_dm.PJ_SL_ORDER_PAY_MONTH_A
SELECT cast(C.MONTH_WID as bigint),
       cast(C.BU_WID as bigint),
       cast(C.AREA_WID as bigint),
       cast(C.DEALER_WID as bigint),
       cast(C.REQUEST_TYPE_WID as bigint),
       cast(C.ORDER_QTD_T as decimal(38,10)),
       cast(C.PAY_QTD_T as decimal(38,10)),
       cast(C.NO_PAY_QTD_T as decimal(38,10)),
       cast(C.TARGET_ORDER_PAY as decimal(38,10)),
       cast(L.LY_ORDER_QTD_T as decimal(38,10)),
       cast(L.LY_PAY_QTD_T as decimal(38,10)),
       cast(L.LY_NO_PAY_QTD_T as decimal(38,10)),
       cast(L.LY_TARGET_ORDER_PAY as decimal(38,10)),
       current_timestamp W_INSERT_DT
  FROM (SELECT FLOOR(DAY_WID / 100) MONTH_WID,
               BU_WID,
               AREA_WID,
               DEALER_WID,
               REQUEST_TYPE_WID,
               SUM(ORDER_QTD_T) ORDER_QTD_T,
               SUM(PAY_QTD_T) PAY_QTD_T,
               SUM(NO_PAY_QTD_T) NO_PAY_QTD_T,
               TARGET_ORDER_PAY
          FROM BIGDATA_DM.PJ_SL_ORDER_PAY_DAY_A
         GROUP BY FLOOR(DAY_WID / 100),
                  BU_WID,
                  AREA_WID,
                  DEALER_WID,
                  REQUEST_TYPE_WID,
                  TARGET_ORDER_PAY) C
  LEFT JOIN (SELECT FLOOR(DAY_WID / 100) MONTH_WID,
                    BU_WID,
                    AREA_WID,
                    DEALER_WID,
                    REQUEST_TYPE_WID,
                    SUM(ORDER_QTD_T) LY_ORDER_QTD_T,
                    SUM(PAY_QTD_T) LY_PAY_QTD_T,
                    SUM(NO_PAY_QTD_T) LY_NO_PAY_QTD_T,
                    TARGET_ORDER_PAY LY_TARGET_ORDER_PAY
               FROM BIGDATA_DM.PJ_SL_ORDER_PAY_DAY_A
              GROUP BY FLOOR(DAY_WID / 100),
                       BU_WID,
                       AREA_WID,
                       DEALER_WID,
                       REQUEST_TYPE_WID,
                       TARGET_ORDER_PAY) L
    ON C.MONTH_WID - 100 = L.MONTH_WID
   AND C.BU_WID = L.BU_WID
   AND C.AREA_WID = L.AREA_WID
   AND C.DEALER_WID = L.DEALER_WID
   AND C.REQUEST_TYPE_WID = L.REQUEST_TYPE_WID
 WHERE C.MONTH_WID > 201709;
