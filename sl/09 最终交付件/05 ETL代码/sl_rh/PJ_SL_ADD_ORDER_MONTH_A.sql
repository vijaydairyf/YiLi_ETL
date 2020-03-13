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
insert overwrite table bigdata_dm.PJ_SL_ADD_ORDER_MONTH_A partition(date_)
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
       current_timestamp AS W_INSERT_DT,cast(substr(DAY_WID,1,6) as bigint),case when requier_cycle is null then 0 else 1 end requier_cycle_flag,case when normal_cycle is null then 0 else 1 end normal_cycle_flag,DAY_WID as date_
  from (select nvl(a.rn, b.rn) rn,
               date_format(nvl(nvl(a.month_wid, b.month_wid), c.month_wid),'yyyyMMdd') day_wid,
               --nvl(a.month_wid, b.month_wid) day_wid,
               nvl(nvl(a.bu_wid, b.bu_wid), c.bu_wid) bu_wid,
               nvl(nvl(a.wh_wid, b.wh_wid), c.wh_wid) wh_wid,
               nvl(nvl(a.area_wid, b.area_wid), c.area_wid) area_wid,
               nvl(nvl(a.product_wid, b.product_wid), c.product_wid) product_wid,
               nvl(nvl(a.dealer_wid, b.dealer_wid), c.dealer_wid) dealer_wid,
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
               lm_order_qty_num,
               lm_add_order_qty_num,
               ly_order_qty_num,
               ly_add_order_qty_num
          from (select row_number() over(partition by substr(day_wid, 1, 6), bu_wid, wh_wid, area_wid, dealer_wid, product_wid order by bu_wid) rn,
                       day_wid,
                       CONCAT(SUBSTR(DAY_WID, 1, 4),'-',SUBSTR(DAY_WID, 5, 2),'-',SUBSTR(DAY_WID, 7, 2)) month_wid,
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
                       add_order_qty_amt
                  from bigdata_dm.PJ_SL_ADD_ORDER_DAY_A) a
          full join (select row_number() over(partition by substr(day_wid, 1, 6), bu_wid, wh_wid, area_wid, dealer_wid, product_wid order by bu_wid) rn,
                           day_wid,
                           add_months(CONCAT(SUBSTR(DAY_WID, 1, 4),'-',SUBSTR(DAY_WID, 5, 2),'-',SUBSTR(DAY_WID, 7, 2)), 1) month_wid,
                           bu_wid,
                           wh_wid,
                           area_wid,
                           product_wid,
                           dealer_wid,
                           order_qty_num lm_order_qty_num,
                           add_order_qty_num lm_add_order_qty_num
                      from bigdata_dm.PJ_SL_ADD_ORDER_DAY_A) b
            on a.rn = b.rn
           and a.bu_wid = b.bu_wid
           and a.wh_wid = b.wh_wid
           and a.area_wid = b.area_wid
           and a.dealer_wid = b.dealer_wid
           and a.product_wid = b.product_wid
           and substr(a.day_wid, 1, 6) = date_format(add_months(CONCAT(SUBSTR(b.DAY_WID, 1, 4),'-',SUBSTR(b.DAY_WID, 5, 2),'-',SUBSTR(b.DAY_WID, 7, 2)), 1),'yyyyMM')
        ----------
          full join (select row_number() over(partition by substr(day_wid, 1, 6), bu_wid, wh_wid, area_wid, dealer_wid, product_wid order by bu_wid) rn,
                           day_wid,
                           add_months(CONCAT(SUBSTR(DAY_WID, 1, 4),'-',SUBSTR(DAY_WID, 5, 2),'-',SUBSTR(DAY_WID, 7, 2)), 12) month_wid,
                           bu_wid,
                           wh_wid,
                           area_wid,
                           product_wid,
                           dealer_wid,
                           order_qty_num ly_order_qty_num,
                           add_order_qty_num ly_add_order_qty_num
                      from bigdata_dm.PJ_SL_ADD_ORDER_DAY_A) c
            on a.rn = c.rn
           and a.bu_wid = c.bu_wid
           and a.wh_wid = c.wh_wid
           and a.area_wid = c.area_wid
           and a.dealer_wid = c.dealer_wid
           and a.product_wid = c.product_wid
           and substr(a.day_wid, 1, 6) =date_format(add_months(CONCAT(SUBSTR(c.DAY_WID, 1, 4),'-',SUBSTR(c.DAY_WID, 5, 2),'-',SUBSTR(c.DAY_WID, 7, 2)), 12),'yyyyMM')) x;
