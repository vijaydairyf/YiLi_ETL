#!/bin/bash
#source ~/.bash_profile

date > time.txt

./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_SALES_ORDER_DS.sql
./rundm_hive.sh 20181106   /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_WAREHOUSE_DS.sql
./rundm_hive.sh 20181106   /DATA01/yilibd_opt/sqls/sl_rh/FACT_CX_AWK_DEALER_FACTORY_SET.sql
./rundm_hive.sh 20181106   /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_ZKT_DEALER_DS.sql
./rundm_hive.sh 20181106   /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_REQUEST_TYPE_DS.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_SALES_ORDER_D.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_WAREHOUSE_D.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_ZKT_DEALER_D.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/DM_SL_REQUEST_TYPE_D.sql


./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_ERP_SHIPMENT_PRE.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_ERP_SHIPMENT.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_ERP_INVENTORY_SNAP_NEW.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_ERP_SALES_ORDER_PRE.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_ERP_SALES_ORDER.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_YILI_INVENTORY_SNAPS_TMP.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_YILI_INVENTORY_SNAPS.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_ERP_SHIPMENT.sql
--./run_sqoop.sh 20181117 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_SALES_PLAN_TMP.sh 
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_SALES_PLAN.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_SALES_PLAN.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_ERP_SALES_ORDER_TMP.sql
./rundm_hive.sh 20181106 /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_ERP_SALES_ORDER.sql

./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_DMS_ST_BUSINESS.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_DMS_PURCHASE_ORDER.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_LD_DMS_INVENTORY_SNAP.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_PURCHASE_ORDER.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_ORDER_PERFORM_TMP.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_ORDER_PERFORM.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_DEALER_SALES_ORDER.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/FACT_SL_DEALER_INVENTORY_SNAPS.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_IN_STORE_DAY_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_DEALER_IN_STORE_TEMP.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_DEALER_IN_STORE_DAY_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_IN_STORE_MONTH_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_ORDER_PERFORM_DAY_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_ORDER_PERFORM_DAY_WH_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_ADD_ORDER_DAY_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_ADD_ORDER_MONTH_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_DEALER_IN_STORE_MONTH_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_DELAY_ORDER_DAY_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_ORDER_PAY_DAY_A.sql
./rundm_hive.sh 20181106  /DATA01/yilibd_opt/sqls/sl_rh/PJ_SL_ORDER_PAY_MONTH_A.sql
date

