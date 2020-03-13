-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_LD_SALES_PLAN.sql
-- source table:            bigdata_ld.FACT_SL_LD_SALES_PLAN_TMP
-- target table:            
-- project:
-- note:
-- purpose:                 服务水平销售计划事实
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

INSERT OVERWRITE TABLE BIGDATA_LD.FACT_SL_LD_SALES_PLAN
  SELECT MONTH
        ,PRODUCT_CODE
        ,BG_NAME
        ,WAREHOUSE_CODE
        ,CAST(PLAN_QTY_TON AS DECIMAL(38, 10)) AS PLAN_QTY_TON
        ,CAST(PLAN_QTY_PACK AS DECIMAL(38, 10)) AS PLAN_QTY_PACK
        ,CREATE_DT
        ,BRANCH
        ,SRC_TABLE
        ,W_INSERT_DT
    FROM BIGDATA_LD.FACT_SL_LD_SALES_PLAN_TMP2
  UNION ALL
  SELECT MONTH
        ,PROD_CODE
        ,BIZ_UNIT_DESC
        ,BRANCH_CODE
        ,CAST(PLAN_QTY_TON AS DECIMAL(38, 10)) AS PLAN_QTY_TON
        ,CAST(PLAN_QTY_PACK AS DECIMAL(38, 10))AS PLAN_QTY_PACK
        ,CAST(CURRENT_DATE AS STRING)
        ,BRANCH_NAME
        ,SRC_TABLE_NAME
        ,CAST(ETL_DT AS STRING)
    FROM DATALAKE_MD.D_EVT_BRANCH_PLAN;


