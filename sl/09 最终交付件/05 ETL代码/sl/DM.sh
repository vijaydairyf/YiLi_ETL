#!/bin/bash
#source ~/.bash_profile

sqoop import -D tez.queue.name=TEST_CAP --hive-import \
--connect jdbc:oracle:thin:@10.150.2.20:1521:PROD \
--username BIGDATA_PROD \
--password BIGDATA_PROD \
--hive-database bigdata_dm \
--delete-target-dir \
--query "select substr(t.day_wid,1,4) as sales_year,
       t.day_wid,
       t.bu_wid,
       t.product_wid,
       t.wh_wid,
       case when t.out_store_qty is not null then t.wh_wid else 0 end out_store_wh_wid,
       inventory_t,
       plan_sales_t,
       in_store_t,
       sku_qty,
       plan_sku_qty,
       out_store_t,
       out_store_qty,
       out_store_by_wh,
       out_store_by_all,
       target_in_store,
       target_in_store_sku,
       target_in_store_t,
       wh_plan_sale_t,
       case when t.OUT_STORE_QTY is null then 0 else 1 end plan_j,
	   case when t.sku_qty is null then 0 else 1 end plan_j_flag,
       case when t.plan_sales_t is not null then t.in_store_t end plan_t,
	   case when t.plan_sales_t is not null then 1 else 0 end plan_t_flag,
       case when t.out_store_qty is not null then t.plan_sales_t else 0 end out_store_plan_sales_t,
       insert_dt
  from w_sl_in_store_day_a t where \$CONDITIONS" -m 1 \
--hive-table pj_sl_in_store_day_a_tmp \
--null-non-string '\\N' \
--null-string '\\N' \
--target-dir /apps/hive/warehouse/bigdata_dm.db/pj_sl_in_store_day_a_tmp;



sqoop import -D tez.queue.name=TEST_CAP --hive-import \
--connect jdbc:oracle:thin:@10.150.2.20:1521:PROD \
--username BIGDATA_PROD \
--password BIGDATA_PROD \
--hive-database bigdata_dm \
--delete-target-dir \
--query "select substr(day_wid,1,4) as sales_year，t.* from w_sl_order_perform_day_a t where \$CONDITIONS" -m 1 \
--hive-table pj_sl_order_perform_day_a_tmp \
--null-non-string '\\N' \
--null-string '\\N' \
--target-dir /apps/hive/warehouse/bigdata_dm.db/pj_sl_order_perform_day_a_tmp;



sqoop import -D tez.queue.name=TEST_CAP --hive-import \
--connect jdbc:oracle:thin:@10.150.2.20:1521:PROD \
--username BIGDATA_PROD \
--password BIGDATA_PROD \
--hive-database bigdata_dm \
--delete-target-dir \
--query "select substr(day_wid,1,4) as sales_year,t.* from w_sl_dealer_in_store_day_a t where \$CONDITIONS" -m 1 \
--hive-table pj_sl_dealer_in_store_day_a_tmp \
--null-non-string '\\N' \
--null-string '\\N' \
--target-dir /apps/hive/warehouse/bigdata_dm.db/pj_sl_dealer_in_store_day_a_tmp;


sqoop import -D tez.queue.name=TEST_CAP --hive-import \
--connect jdbc:oracle:thin:@10.150.2.20:1521:PROD \
--username BIGDATA_PROD \
--password BIGDATA_PROD \
--hive-database bigdata_dm \
--delete-target-dir \
--query "select  
       substr(day_wid,1,4) as sales_year,
       day_wid,
       bu_wid,
       wh_wid,
       product_wid,
       request_wid,
       order_num,
       adjust_order_num,
       perfect_order_num,
       ontime_receive_num,
       ontime_shipment_num,
       time_receive_qtd_j,
       order_qtd_j,
       time_receive_qtd_t,
       order_qtd_t,
       time_receive_p_num,
       order_p_num,
       adjust_order_j,
       adjust_order_t,
       instore_p_num,
       instore_p_t,
       sales_plan_j,
       sales_plan_t,
       ontime_shipment_j,
       ontime_shipment_t,
       shipment_qtd_j,
       shipment_qtd_t,
       ontime_receive_j,
       ontime_receive_t,
       cancel_order_j,
       cancel_order_t,
       unmet_t,
       ontime_delivery,
       target_order_per,
       target_adjust,
       target_cancel,
       target_instore,
       target_ontime_shipment,
       target_ontime_receive,
       target_unmet,
       target_ontime_delivery,
case when sales_plan_t is null or sales_plan_t = 0 then 0 else 1 end as plan_prod_cnt_t,
case when case when sales_plan_t is null and sales_plan_t = 0 then 0 else 1 end = 1 then INSTORE_P_NUM else 0 end as plan_prod_cnt_j,
case when sales_plan_j is not null then instore_p_num else null end plan_notnull_j,
case when sales_plan_t is null or sales_plan_t = 0 then 0 else instore_p_t end plan_notnull_t,
       w_insert_dt from w_sl_order_perform_day_wh_a t where \$CONDITIONS" -m 1 \
--hive-table pj_sl_order_perform_day_wh_a_tmp \
--null-non-string '\\N' \
--null-string '\\N' \
--target-dir /apps/hive/warehouse/bigdata_dm.db/pj_sl_order_perform_day_wh_a_tmp;


sqoop import -D tez.queue.name=TEST_CAP --hive-import \
--connect jdbc:oracle:thin:@10.150.2.20:1521:PROD \
--username BIGDATA_PROD \
--password BIGDATA_PROD \
--hive-database bigdata_dm \
--delete-target-dir \
--query "select substr(month_wid,1,4) as sales_year,month_wid,
       bu_wid,
       wh_wid,
       product_wid,
       sku_qty,
       plan_sku_qty,
       inventory_t,
       plan_sales_t,
       in_store_t,
       out_store_t,
       out_store_qty,
       wh_plan_sale_t,
       ly_sku_qty,
       ly_plan_sku_qty,
       ly_inventory_t,
       ly_plan_sales_t,
       ly_in_store_t,
       target_in_store,
       target_in_store_sku,
       target_in_store_t,	   
case when a.ly_plan_sku_qty is not null and a.ly_plan_sku_qty<>0 then a.ly_sku_qty end pre_plan_j,
case when a.ly_plan_sales_t is not null and a.ly_plan_sales_t<>0 then a.ly_in_store_t end pre_plan_t,
case when a.plan_sku_qty is not null and a.plan_sku_qty<>0 then a.sku_qty end plan_j,
case when a.plan_sales_t is not null and a.plan_sales_t<>0 then a.in_store_t end plan_t,
       w_insert_dt from w_sl_in_store_month_a a where \$CONDITIONS" -m 1 \
--hive-table pj_sl_in_store_month_a_tmp \
--null-non-string '\\N' \
--null-string '\\N' \
--target-dir /apps/hive/warehouse/bigdata_dm.db/pj_sl_in_store_month_a_tmp;
