-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_LD_ERP_SALES_ORDER.sql
-- source table:            bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER_PRE
-- target table:            bigdata_dw.FACT_SL_ERP_SALES_ORDER_TMP
-- project:
-- note:
-- purpose:                 ERP销售订单ld层表
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
insert overwrite table bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER partition
  (date_)
  select eq.*
    from (select f.*
            from bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER f
           where date_ in
                 (select t.date_
                    from (SELECT date_format(CREATION_DATE, 'yyyyMM') as date_
                            FROM bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER_PRE
                           where CREATION_DATE <
                                 date_format((add_months(current_date, -1)),
                                             'yyyy-MM-01')) t
                   group by t.date_)
          union all
          select *
            from bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER
           where date_ = '__HIVE_DEFAULT_PARTITION__') eq
   where not exists (select tmp.line_id
            from bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER_PRE tmp
           where eq.line_id = tmp.line_id)
  union all
  SELECT date_format(REQUEST_DATE, 'yyyy-MM-dd HH:mm:ss') as REQUEST_DATE,
         BUSINESS_NAME,
         OPERATING_UNIT,
         OU_NAME,
         OU_ID,
         ORGANIZATION_ID,
         ORGANIZATION_CODE,
         ORDER_TYPE,
         ORDER_NUMBER,
         DEMAND_CLASS_CODE,
         DEMAND_CLASS,
         CUST_ACCOUNT_ID,
         CUSTOMER_TYPE,
         TERRITORY_ID,
         INVOICE_TO_ORG_ID,
         FLOW_STATUS_CODE,
         INVENTORY_ITEM_ID,
         ORDERED_ITEM,
         SALES_QTY,
         SALES_QTY_BOX,
         SALES_QTY_TOM,
         UNIT_SELLING_PRICE,
         UNIT_LIST_PRICE,
         BOOKED_FLAG,
         date_format(regexp_replace(BOOKED_DATE, '/', '-'),
                     'yyyy-MM-dd HH:mm:ss') as BOOKED_DATE,
         date_format(regexp_replace(LATEST_ACCEPTABLE_DATE, '/', '-'),
                     'yyyy-MM-dd HH:mm:ss') as LATEST_ACCEPTABLE_DATE,
         ATTRIBUTE18,
         date_format(regexp_replace(ACTUAL_SHIPMENT_DATE, '/', '-'),
                     'yyyy-MM-dd HH:mm:ss') as ACTUAL_SHIPMENT_DATE,
         CUST_PO_NUMBER,
         HEADER_ID,
         LINE_ID,
         SHIPPING_METHOD_CODE,
         SHIP_TO_ORG_ID,
         date_format(regexp_replace(ORDERED_DATE, '/', '-'),
                     'yyyy-MM-dd HH:mm:ss') as ORDERED_DATE,
         ATTRIBUTE1,
         CANCELLED_FLAG,
         SHIPPED_QUANTITY,
         ORDER_QUANTITY_UOM,
         ATTRIBUTE2,
         CANCELLED_QUANTITY,
         ATTRIBUTE19,
         ATTRIBUTE20,
         date_format(regexp_replace(CREATION_DATE, '/', '-'),
                     'yyyy-MM-dd HH:mm:ss') as CREATION_DATE,
         date_format(regexp_replace(LAST_UPDATE_DATE, '/', '-'),
                     'yyyy-MM-dd HH:mm:ss') as LAST_UPDATE_DATE,
         from_unixtime(unix_timestamp(), 'yyyy-MM-dd HH:mm:ss') W_INSERT_DT,
         receive_wh_code,
         receive_wh_id,
         date_format(regexp_replace(CREATION_DATE, '/', '-'), 'yyyyMM') as date_
    FROM bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER_PRE;
