
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_IN_STORE_DAY_A_manul PARTITION (DATE_)
SELECT
BG_CODE                               ,
BG_NAME                               ,
YEAR_NM                               ,
MONTH_NM                              ,
DAY_NM                                ,
YEAR_NUM                              ,
DAY_NUM                               ,
MONTH_NUM                             ,
day_code                               ,
PRODUCT_DESCRIBE                      ,
PRODUCT_TYPE_DESCRIPTION              ,
CATEGORY_ONE_NAME                     ,
CATEGORY_TWO_NAME                     ,
CATEGORY_THREE_NAME                   ,
CATEGORY_FOUR                         ,
CATEGORY_FIVE                         ,
PRODUCT_BRAND                         ,
PRODUCT_CHILD_BRAND                   ,
PRODUCT_GRADE                         ,
ELECTRONIC_PRODUCTS                   ,
PRODUCT_CHILD_BRAND_CODE              ,
new_product_name    ,
main_product_name    ,
WH_NAME                               ,
WH_CODE                               ,
LONGITUDE                             ,
LATITUDE                              ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                            ,
ORGN_NAME                             ,
wh_wid  ,
INVENTORY_T                           ,
PLAN_SALES_T                          ,
IN_STORE_T                            ,
SKU_QTY                               ,
PLAN_SKU_QTY                          ,
OUT_STORE_T                           ,
OUT_STORE_QTY                         ,
OUT_STORE_BY_WH                       ,
OUT_STORE_BY_ALL                      ,
TARGET_IN_STORE                       ,
TARGET_IN_STORE_SKU                   ,
TARGET_IN_STORE_T                     ,
WH_PLAN_SALE_T                        ,
PJ_SL_IN_STORE_DAY_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_IN_STORE_DAY_A` as `PJ_SL_IN_STORE_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_IN_STORE_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_IN_STORE_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_IN_STORE_DAY_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_IN_STORE_DAY_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_IN_STORE_DAY_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
WHERE 1=1
AND
PJ_SL_IN_STORE_DAY_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');

  
--紧急加单率（月报）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ADD_ORDER_MONTH_A_SN_MANUL PARTITION (DATE_)
SELECT
BU_NAME                            ,
BIG_AREA_CODE                      ,
BIG_AREA_NAME                      ,
AREA_CODE                          ,
AREA_NAME                          ,
CITIES_NAME                        ,
CITY_NAME                          ,
BIG_AREA_LONGITUDE                 ,
BIG_AREA_LATITUDE                  ,
null                     ,
null                      ,
null                   ,
null                    ,
null                     ,
null                      ,
BG_CODE                            ,
BG_NAME                            ,
YEAR_NM                            ,
MONTH_NM                           ,
DAY_NM                             ,
YEAR_NUM                           ,
DAY_NUM                            ,
MONTH_NUM                          ,
concat(month_code,'-01')           ,
DALER_NAME                         ,
PRODUCT_DESCRIBE                   ,
PRODUCT_TYPE_DESCRIPTION           ,
CATEGORY_ONE_NAME                  ,
CATEGORY_TWO_NAME                  ,
CATEGORY_THREE_NAME                ,
CATEGORY_FOUR                      ,
CATEGORY_FIVE                      ,
PRODUCT_BRAND                      ,
PRODUCT_CHILD_BRAND                ,
PRODUCT_GRADE                      ,
ELECTRONIC_PRODUCTS                ,
PRODUCT_CHILD_BRAND_CODE           ,
WH_NAME                            ,
WH_CODE                            ,
LONGITUDE                          ,
LATITUDE                           ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                         ,
ORGN_NAME                          ,
REQUIER_CYCLE                      ,
NORMAL_CYCLE                       ,
ORDER_QTY_NUM                      ,
ORDER_QTY_T                        ,
ORDER_QTY_J                        ,
ORDER_QTY_AMT                      ,
ADD_ORDER_QTY_NUM                  ,
ADD_ORDER_QTY_T                    ,
ADD_ORDER_QTY_J                    ,
ADD_ORDER_QTY_AMT                  ,
LM_ORDER_QTY_NUM                   ,
LM_ADD_ORDER_QTY_NUM               ,
LY_ORDER_QTY_NUM                   ,
LY_ADD_ORDER_QTY_NUM               ,
PJ_SL_ADD_ORDER_MONTH_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_ADD_ORDER_MONTH_A` as `PJ_SL_ADD_ORDER_MONTH_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_ADD_ORDER_MONTH_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_ADD_ORDER_MONTH_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
ON `PJ_SL_ADD_ORDER_MONTH_A`.`DEALER_WID` = `W_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_PRODUCT_D` as `W_PRODUCT_D`
ON `PJ_SL_ADD_ORDER_MONTH_A`.`PRODUCT_WID` = `W_PRODUCT_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_ADD_ORDER_MONTH_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_ADD_ORDER_MONTH_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
WHERE 1=1
AND
PJ_SL_ADD_ORDER_MONTH_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');

--经销商有货率-奶粉（月报）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DEALER_IN_STORE_MONTH_A_NF_MANUL
SELECT
W_AREA_D.BIG_AREA_CODE                           ,
W_AREA_D.AREA_CODE                               ,
W_AREA_D.big_area_name                           ,
W_AREA_D.area_name                               ,
W_AREA_D.BIG_AREA_LONGITUDE                      ,
W_AREA_D.BIG_AREA_LATITUDE                       ,
W_BG_D.BG_CODE                                 ,
W_BG_D.BG_NAME                                 ,
YEAR_NM                                 ,
MONTH_NM                                ,
DAY_NM                                  ,
YEAR_NUM                                ,
DAY_NUM                                 ,
MONTH_NUM                               ,
MONTH_DAYS                              ,
concat(month_code,'-01')                                ,
DEALER_NAME                             ,
BG_AREA_NAME                            ,
BG_REGION_NAME                          ,
BG_CITY_GROUP_NAME                      ,
BG_CITY_NAME                            ,
IS_WAREHOUSE_CUSTOMER                   ,
PRODUCT_DESCRIBE                        ,
PRODUCT_TYPE_DESCRIPTION                ,
CATEGORY_ONE_NAME                       ,
CATEGORY_TWO_NAME                       ,
CATEGORY_THREE_NAME                     ,
CATEGORY_FOUR                           ,
CATEGORY_FIVE                           ,
PRODUCT_BRAND                           ,
PRODUCT_CHILD_BRAND                     ,
PRODUCT_GRADE                           ,
ELECTRONIC_PRODUCTS                     ,
PRODUCT_CHILD_BRAND_CODE                ,
new_product_name  ,
main_product_name  ,
MONTH_WID                               ,
BU_WID                                  ,
DMS_DEALER_WID                          ,
INVENTORY_T                             ,
SALES_QTY_T                             ,
SKU_30_QTY                              ,
INVENTORY_SKU_QTY                       ,
LY_SKU_30_QTY                           ,
LY_INVENTORY_SKU_QTY                    ,
TARGET_IN_STORE_RATE
 FROM `BIGDATA_DM`.`PJ_SL_DEALER_IN_STORE_MONTH_A` as `PJ_SL_DEALER_IN_STORE_MONTH_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`MONTH_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_DMS_DEALER_D` as `DM_DMS_DEALER_D`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`DMS_DEALER_WID` = `DM_DMS_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_DEALER_IN_STORE_MONTH_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
LEFT JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `DM_DMS_DEALER_D`.`AREA_CODE` = `W_AREA_D`.`CODE`
WHERE 1=1 AND (`PJ_SL_DEALER_IN_STORE_MONTH_A`.BU_WID=2) ;



--经销商有货率-液奶（月报）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DEALER_IN_STORE_MONTH_A_YN_MANUL
SELECT
BU_NAME                         ,
w_area_d.BIG_AREA_CODE                   ,
w_area_d.BIG_AREA_NAME                   ,
BIG_AREA_LATITUDE   ,
BIG_AREA_LONGITUDE   ,
w_area_d.AREA_CODE                       ,
w_area_d.AREA_NAME                       ,
w_area_d.CITIES_NAME                     ,
w_area_d.CITY_NAME                       ,
w_bg_d.BG_CODE                         ,
w_bg_d.BG_NAME                         ,
YEAR_NM                         ,
MONTH_NM                        ,
DAY_NM                          ,
YEAR_NUM                        ,
DAY_NUM                         ,
MONTH_NUM                       ,
concat(month_code,'-01')        ,
PRODUCT_DESCRIBE                ,
PRODUCT_TYPE_DESCRIPTION        ,
CATEGORY_ONE_NAME               ,
CATEGORY_TWO_NAME               ,
CATEGORY_THREE_NAME             ,
CATEGORY_FOUR                   ,
CATEGORY_FIVE                   ,
PRODUCT_BRAND                   ,
PRODUCT_CHILD_BRAND             ,
PRODUCT_GRADE                   ,
ELECTRONIC_PRODUCTS             ,
PRODUCT_CHILD_BRAND_CODE        ,
new_product_name    ,
main_product_name   ,
DEALER_NAME                     ,
MONTH_WID                       ,
INVENTORY_T                     ,
SALES_QTY_T                     ,
SKU_30_QTY                      ,
INVENTORY_SKU_QTY               ,
LY_SKU_30_QTY                   ,
LY_INVENTORY_SKU_QTY            ,
TARGET_IN_STORE_RATE
 FROM `BIGDATA_DM`.`PJ_SL_DEALER_IN_STORE_MONTH_A` as `PJ_SL_DEALER_IN_STORE_MONTH_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`MONTH_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_ZKT_DEALER_D` as `DM_SL_ZKT_DEALER_D`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`DMS_DEALER_WID` = `DM_SL_ZKT_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_DEALER_IN_STORE_MONTH_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DEALER_IN_STORE_MONTH_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
LEFT JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `DM_SL_ZKT_DEALER_D`.`AREA_CODE` = `W_AREA_D`.`CODE`
WHERE 1=1 AND (`PJ_SL_DEALER_IN_STORE_MONTH_A`.BU_WID=5) ;


--滞留订单（内部）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DELAY_ORDER_DAY_A_manul
select
BU_NAME                                       ,
W_AREA_D.BIG_AREA_CODE                                 ,
W_AREA_D.BIG_AREA_NAME                                 ,
W_AREA_D.AREA_CODE                                     ,
W_AREA_D.AREA_NAME                                     ,
W_AREA_D.CITIES_NAME                                   ,
W_AREA_D.CITY_NAME                                     ,
BG_CODE                                       ,
BG_NAME                                       ,
W_DATE_D.YEAR_NM                                       ,
W_DATE_D.MONTH_NM                                      ,
W_DATE_D.DAY_NM                                        ,
W_DATE_D.YEAR_NUM                                      ,
W_DATE_D.DAY_NUM                                       ,
W_DATE_D.MONTH_NUM                                     ,
day_code                                       ,
PRODUCT_DESCRIBE                              ,
PRODUCT_TYPE_DESCRIPTION                      ,
CATEGORY_ONE_NAME                             ,
CATEGORY_TWO_NAME                             ,
CATEGORY_THREE_NAME                           ,
CATEGORY_FOUR                                 ,
CATEGORY_FIVE                                 ,
PRODUCT_BRAND                                 ,
PRODUCT_CHILD_BRAND                           ,
PRODUCT_GRADE                                 ,
ELECTRONIC_PRODUCTS                           ,
PRODUCT_CHILD_BRAND_CODE                      ,
DM_SL_REQUEST_TYPE_D.LOOKUP_CODE                                   ,
DM_SL_REQUEST_TYPE_D.MEANING                                       ,
DM_SL_REQUEST_TYPE_D.LONGITUDE                                     ,
DM_SL_REQUEST_TYPE_D.LATITUDE                                      ,
WH_NAME                                       ,
WH_CODE                                       ,
DM_SL_WAREHOUSE_D.LONGITUDE                   ,
DM_SL_WAREHOUSE_D.LATITUDE                    ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                                    ,
CLINET_TYPE                                   ,
ORDER_NUM                                     ,
ORDER_QTD_T                                   ,
ORDER_AMT                                     ,
DM_SL_WAREHOUSE_D.orgn_type
 FROM `BIGDATA_DM`.`PJ_SL_DELAY_ORDER_DAY_A` as `PJ_SL_DELAY_ORDER_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`day_wid` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_PRODUCT_D` as `W_PRODUCT_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`PRODUCT_WID` = `W_PRODUCT_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_REQUEST_TYPE_D` as `DM_SL_REQUEST_TYPE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`SEND_WID` = `DM_SL_REQUEST_TYPE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`RECEVIED_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
WHERE 1=1;


--滞留订单-奶粉（外部）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DELAY_ORDER_DAY_A_NF_MANUL
SELECT
BU_NAME                                      ,
BIG_AREA_CODE                                ,
BIG_AREA_NAME                                ,
AREA_CODE                                    ,
AREA_NAME                                    ,
CITIES_NAME                                  ,
CITY_NAME                                    ,
BG_CODE                                      ,
BG_NAME                                      ,
YEAR_NM                                      ,
MONTH_NM                                     ,
DAY_NM                                       ,
YEAR_NUM                                     ,
DAY_NUM                                      ,
MONTH_NUM                                    ,
day_code                                      ,
W_DEALER_D.W_INSERT_DT                      ,
W_DEALER_D.W_UPDATE_DT                       ,
W_DEALER_D.CREATED_ON_DT                     ,
W_DEALER_D.CHANGED_ON_DT                     ,
W_DEALER_D.DATASOURCE_NUM_ID                 ,
W_DEALER_D.INTEGRATION_ID                    ,
DALER_NAME                                   ,
DALER_CODE                                   ,
DEALER_TYPE1                                 ,
DEALER_TYPE2                                 ,
CUSTOMER_CLASS_CODE                          ,
CUSTOMER_CLASS_DESC                          ,
SALES_CHANNEL_CODE                           ,
SALES_CHANNEL_DESC                           ,
DEALER_MARKET_LEVEL                          ,
DEALER_MARKET_DESC                           ,
COLD_CUSTOMER_CLASS_DESC                     ,
COLD_DEALER_TYPE                             ,
COLD_SALES_CHANNEL_DESC                      ,
COLD_DEALER_MARKET_DESC                      ,
W_DEALER_D.DUAL_                             ,
PRODUCT_DESCRIBE                             ,
PRODUCT_TYPE_DESCRIPTION                     ,
CATEGORY_ONE_NAME                            ,
CATEGORY_TWO_NAME                            ,
CATEGORY_THREE_NAME                          ,
CATEGORY_FOUR                                ,
CATEGORY_FIVE                                ,
PRODUCT_BRAND                                ,
PRODUCT_CHILD_BRAND                          ,
PRODUCT_GRADE                                ,
ELECTRONIC_PRODUCTS                          ,
PRODUCT_CHILD_BRAND_CODE                     ,
WH_NAME                                      ,
WH_CODE                                      ,
DM_SL_WAREHOUSE_D.LONGITUDE                                    ,
DM_SL_WAREHOUSE_D.LATITUDE                                     ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                                   ,
ORGN_NAME                                    ,
CLINET_TYPE                                  ,
ORDER_QTD_T                                  ,
ORDER_AMT
FROM `BIGDATA_DM`.`PJ_SL_DELAY_ORDER_DAY_A` as `PJ_SL_DELAY_ORDER_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`RECEVIED_WID` = `W_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_PRODUCT_D` as `W_PRODUCT_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`PRODUCT_WID` = `W_PRODUCT_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`SEND_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
WHERE 1=1;


--滞留订单-液奶（外部）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DELAY_ORDER_DAY_A_YN_MANUL
SELECT
BU_NAME                                      ,
BIG_AREA_CODE                                ,
BIG_AREA_NAME                                ,
AREA_CODE                                    ,
AREA_NAME                                    ,
CITIES_NAME                                  ,
CITY_NAME                                    ,
BG_CODE                                      ,
BG_NAME                                      ,
YEAR_NM                                      ,
MONTH_NM                                     ,
DAY_NM                                       ,
YEAR_NUM                                     ,
DAY_NUM                                      ,
MONTH_NUM                                    ,
day_code                                      ,
DALER_NAME                                   ,
PRODUCT_DESCRIBE                             ,
PRODUCT_TYPE_DESCRIPTION                     ,
CATEGORY_ONE_NAME                            ,
CATEGORY_TWO_NAME                            ,
CATEGORY_THREE_NAME                          ,
CATEGORY_FOUR                                ,
CATEGORY_FIVE                                ,
PRODUCT_BRAND                                ,
PRODUCT_CHILD_BRAND                          ,
PRODUCT_GRADE                                ,
ELECTRONIC_PRODUCTS                          ,
PRODUCT_CHILD_BRAND_CODE                     ,
LOOKUP_CODE                                  ,
MEANING                                      ,
LONGITUDE                                    ,
LATITUDE                                     ,
CLINET_TYPE                                  ,
ORDER_QTD_T                                  ,
ORDER_AMT
FROM `BIGDATA_DM`.`PJ_SL_DELAY_ORDER_DAY_A` as `PJ_SL_DELAY_ORDER_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`RECEVIED_WID` = `W_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_PRODUCT_D` as `W_PRODUCT_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`PRODUCT_WID` = `W_PRODUCT_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_REQUEST_TYPE_D` as `DM_SL_REQUEST_TYPE_D`
ON `PJ_SL_DELAY_ORDER_DAY_A`.`SEND_WID` = `DM_SL_REQUEST_TYPE_D`.`ROW_WID`
WHERE 1=1;

