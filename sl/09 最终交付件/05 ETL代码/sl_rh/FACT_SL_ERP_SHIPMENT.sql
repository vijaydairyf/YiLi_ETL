-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_ERP_SHIPMENT.sql
-- source table:            bigdata_ld.FACT_SL_LD_ERP_SHIPMENT
-- target table:            
-- project:
-- note:
-- purpose:                 服务水平发运汇总事实表
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
insert overwrite table bigdata_dw.FACT_SL_ERP_SHIPMENT
select sum(shipped_quantity) shipped_quantity,sum(shipped_weight) shipped_weight,line_id,CURRENT_TIMESTAMP W_INSERT_DT
from bigdata_ld.FACT_SL_LD_ERP_SHIPMENT
where confirm_date>=date_sub(current_date, 180)
group by line_id;
