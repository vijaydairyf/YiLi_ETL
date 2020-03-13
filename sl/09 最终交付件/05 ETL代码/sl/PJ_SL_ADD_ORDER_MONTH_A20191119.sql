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
-------------------------------------------------------------------------------

insert overwrite table bigdata_dm.pj_sl_add_order_month_a_tmp1
select 
       day_wid,
       bu_wid,
       wh_wid,
       area_wid,
       product_wid,
       dealer_wid,
       requier_cycle,
       normal_cycle,
       order_qty_num,
       order_qty_t,
       order_qty_j,
       order_qty_amt,
       add_order_qty_num,
       add_order_qty_t,
       add_order_qty_j,
       add_order_qty_amt,
       null as  lm_order_qty_num,
       null as  lm_add_order_qty_num,
       null as  ly_order_qty_num,
       null as  ly_add_order_qty_num
  from bigdata_dm.pj_sl_add_order_day_a cur;
  
insert into table bigdata_dm.pj_sl_add_order_month_a_tmp1
select 
       cast(add_months(concat_ws('-',substr(day_wid,1,4),substr(day_wid,5,2),substr(day_wid,7,2)), 1) as bigint),
       bu_wid,
       wh_wid,
       area_wid,
       product_wid,
       dealer_wid,
       null as  requier_cycle,
       null as  normal_cycle,
       null as order_qty_num,
       null as  order_qty_t,
       null as  order_qty_j,
       null as  order_qty_amt,
       null as  add_order_qty_num,
       null as  add_order_qty_t,
       null as  add_order_qty_j,
       null as  add_order_qty_amt,
       order_qty_num     lm_order_qty_num,
       add_order_qty_num lm_add_order_qty_num,
       null as  ly_order_qty_num,
       null as  ly_add_order_qty_num
  from bigdata_dm.pj_sl_add_order_day_a lm;
  
insert into table bigdata_dm.pj_sl_add_order_month_a_tmp1
select 
       cast(add_months(concat_ws('-',substr(day_wid,1,4),substr(day_wid,5,2),substr(day_wid,7,2)), 12) as bigint),
       bu_wid,
       wh_wid,
       area_wid,
       product_wid,
       dealer_wid,
       null as  requier_cycle,
       null as  normal_cycle,
       null as  order_qty_num,
       null as  order_qty_t,
       null as  order_qty_j,
       null as  order_qty_amt,
       null as  add_order_qty_num,
       null as  add_order_qty_t,
       null as  add_order_qty_j,
       null as  add_order_qty_amt,
       null as  lm_order_qty_num,
       null as  lm_add_order_qty_num,
       order_qty_num     ly_order_qty_num,
       add_order_qty_num ly_add_order_qty_num
  from bigdata_dm.pj_sl_add_order_day_a ly;
  
insert overwrite table bigdata_dm.pj_sl_add_order_month_a_tmp2 
select a.day_wid,
       a.bu_wid,
       a.wh_wid,
       a.area_wid,
       a.product_wid,
       a.dealer_wid,
       sum(a.requier_cycle) as requier_cycle,
       sum(a.normal_cycle) as normal_cycle,
       a.order_qty_num,
       sum(a.order_qty_t) as order_qty_t,
       sum(a.order_qty_j) as order_qty_j,
       sum(a.order_qty_amt) as order_qty_amt,
       max(a.add_order_qty_num) as add_order_qty_num,
       sum(a.add_order_qty_t) as add_order_qty_t,
       sum(a.add_order_qty_j) as add_order_qty_j,
       sum(a.add_order_qty_amt) as add_order_qty_amt,
       a.lm_order_qty_num,
       max(a.lm_add_order_qty_num) as lm_add_order_qty_num,
       a.ly_order_qty_num,
       max(a.ly_add_order_qty_num) as ly_add_order_qty_num
  from bigdata_dm.pj_sl_add_order_month_a_tmp1 a where day_wid is not null
 group by a.day_wid,
          a.bu_wid,
          a.wh_wid,
          a.area_wid,
          a.product_wid,
          a.dealer_wid,
          a.order_qty_num,
          a.lm_order_qty_num,
          a.ly_order_qty_num;

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
 
