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
insert overwrite table bigdata_ld.FACT_SL_LD_SALES_PLAN
select * from bigdata_ld.FACT_SL_LD_SALES_PLAN_TMP2
union all
select month,prod_code,biz_unit_desc,branch_code,plan_qty_ton,plan_qty_pack,upload_time,branch_name,src_table_name,cast(etl_dt as string) from datalake_md.d_evt_branch_plan;


