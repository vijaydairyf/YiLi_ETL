-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SL_ADD_ORDER_MONTH_A.sql
-- source table:            bigdata_dm.PJ_SL_ADD_ORDER_DAY_A
-- target table:            
-- project:
-- note:
-- purpose:                 紧急加单率月报
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
---------------------------------- 

insert overwrite table bigdata_dm.pj_sl_add_order_month_a   partition(date_)     
select cast(DAY_WID as bigint),
       cast(BU_WID as bigint),
       cast(WH_WID as bigint),
       cast(AREA_WID as bigint),
       cast(PRODUCT_WID as bigint),
       cast(DEALER_WID as bigint),
       cast(REQUIER_CYCLE as decimal(38,10)),
       cast(NORMAL_CYCLE as decimal(38,10)),
       cast(ORDER_QTY_NUM as decimal(38,10)),
       cast(ORDER_QTY_T as decimal(38,10)),
       cast(ORDER_QTY_J as decimal(38,10)),
       cast(ORDER_QTY_AMT as decimal(38,10)),
       cast(ADD_ORDER_QTY_NUM as decimal(38,10)),
       cast(ADD_ORDER_QTY_T as decimal(38,10)),
       cast(ADD_ORDER_QTY_J as decimal(38,10)),
       cast(ADD_ORDER_QTY_AMT as decimal(38,10)),
       cast(LM_ORDER_QTY_NUM as decimal(38,10)),
       cast(LM_ADD_ORDER_QTY_NUM as decimal(38,10)),
       cast(LY_ORDER_QTY_NUM as decimal(38,10)),
       cast(LY_ADD_ORDER_QTY_NUM as decimal(38,10)),
       current_timestamp AS W_INSERT_DT,
       cast(substr(DAY_WID,1,6) as bigint),
       case when requier_cycle is null then 0 else 1 end requier_cycle_flag,
       case when normal_cycle is null then 0 else 1 end normal_cycle_flag,
       DAY_WID as date_
       from bigdata_dm.pj_sl_add_order_month_a_tmp2 where day_wid>=regexp_replace(date_sub(current_date,60),'-','');
 
