
--订单履行率（液奶）
INSERT OVERWRITE TABLE BIGDATA_MANUL.pj_sl_order_perform_day_a_yn_manul PARTITION (DATE_)
SELECT                              
W_AREA_D.NAME                                              ,
W_AREA_D.AREA_LEVEL                                        ,
W_AREA_D.BU_NAME                                           ,
W_AREA_D.BIG_AREA_CODE                                     ,
W_AREA_D.BIG_AREA_NAME                                     ,
W_AREA_D.AREA_CODE                                         ,
W_AREA_D.AREA_NAME                                         ,
W_AREA_D.CITIES_NAME                                       ,
W_AREA_D.CITY_NAME                                         ,
W_AREA_D.ENABLE_FLAG                                       ,
W_AREA_D.BIG_AREA_LONGITUDE                                ,
W_AREA_D.BIG_AREA_LATITUDE                                 ,
null                                    ,
null                                     ,
null                                  ,
null                                   ,
null                                    ,
null                                     ,
W_BG_D.BG_CODE                                             ,
W_BG_D.BG_NAME                                             ,
W_DATE_D.YEAR_CODE                                         ,
W_DATE_D.YEAR_NM                                           ,
W_DATE_D.QUARTER_CODE                                      ,
W_DATE_D.QUARTER_NM                                        ,
W_DATE_D.MONTH_CODE                                        ,
W_DATE_D.MONTH_NM                                          ,
W_DATE_D.XUN_CODE                                          ,
W_DATE_D.XUN_NM                                            ,
W_DATE_D.DAY_NM                                            ,
W_DATE_D.YEAR_WEEK_CODE                                    ,
W_DATE_D.YEAR_WEEK_NM                                      ,
W_DATE_D.MONTH_WEEK_CODE                                   ,
W_DATE_D.MONTH_WEEK_NM                                     ,
W_DATE_D.YEAR_NUM                                          ,
W_DATE_D.DAY_NUM                                           ,
W_DATE_D.MONTH_NUM                                         ,
W_DATE_D.YEAR_WEEK_NUM                                     ,
W_DATE_D.MONTH_WEEK_NUM                                    ,
W_DATE_D.NIGHT_XUN_NAME                                    ,
W_DATE_D.NIGHT_XUN_CODE                                    ,
W_DATE_D.NL_DAY_DESC                                       ,
W_DATE_D.NL_DAY_NUM                                        ,
W_DATE_D.NL_DAY_NAME                                       ,
W_DATE_D.MONTH_DAYS                                        ,
W_DATE_D.day_code                                           ,
W_DEALER_D.DALER_NAME                                      ,
W_DEALER_D.DALER_CODE                                      ,
W_DEALER_D.DEALER_TYPE1                                    ,
W_DEALER_D.DEALER_TYPE2                                    ,
W_DEALER_D.CUSTOMER_CLASS_CODE                             ,
W_DEALER_D.CUSTOMER_CLASS_DESC                             ,
W_DEALER_D.SALES_CHANNEL_CODE                              ,
W_DEALER_D.SALES_CHANNEL_DESC                              ,
W_DEALER_D.DEALER_MARKET_LEVEL                             ,
W_DEALER_D.DEALER_MARKET_DESC                              ,
W_DEALER_D.COLD_CUSTOMER_CLASS_DESC                        ,
W_DEALER_D.COLD_DEALER_TYPE                                ,
W_DEALER_D.COLD_SALES_CHANNEL_DESC                         ,
W_DEALER_D.COLD_DEALER_MARKET_DESC                         ,
DM_PRODUCT_KYLIN.PROD_INT_CODE                             ,
DM_PRODUCT_KYLIN.PROD_INT_NAME                             ,
DM_PRODUCT_KYLIN.PROD_LEVEL                                ,
DM_PRODUCT_KYLIN.PRODUCT_CODE                              ,
DM_PRODUCT_KYLIN.PRODUCT_DESCRIBE                          ,
DM_PRODUCT_KYLIN.PROD_SHORT_NAME                           ,
DM_PRODUCT_KYLIN.PRODUCT_TYPE                              ,
DM_PRODUCT_KYLIN.PRODUCT_TYPE_DESCRIPTION                  ,
DM_PRODUCT_KYLIN.ITEM_CATEGORY_ONE                         ,
DM_PRODUCT_KYLIN.ITEM_CATEGORY_TWO                         ,
DM_PRODUCT_KYLIN.ITEM_CATEGORY_THREE                       ,
DM_PRODUCT_KYLIN.PROD_CATEGORY_ONE_NM                      ,
DM_PRODUCT_KYLIN.PROD_CATEGORY_TWO_NM                      ,
DM_PRODUCT_KYLIN.PROD_CATEGORY_THREE_NM                    ,
DM_PRODUCT_KYLIN.UPC1                                      ,
DM_PRODUCT_KYLIN.UPC2                                      ,
DM_PRODUCT_KYLIN.UPC3                                      ,
DM_PRODUCT_KYLIN.CATEGORY_ONE_NAME                         ,
DM_PRODUCT_KYLIN.CATEGORY_TWO_NAME                         ,
DM_PRODUCT_KYLIN.CATEGORY_THREE_NAME                       ,
DM_PRODUCT_KYLIN.CATEGORY_FOUR                             ,
DM_PRODUCT_KYLIN.CATEGORY_FIVE                             ,
DM_PRODUCT_KYLIN.PRODUCT_BRAND                             ,
DM_PRODUCT_KYLIN.PRODUCT_CHILD_BRAND                       ,
DM_PRODUCT_KYLIN.GROUP_TYPE1_NM                            ,
DM_PRODUCT_KYLIN.GROUP_TYPE2_NM                            ,
DM_PRODUCT_KYLIN.PRODUCT_PACKING_NAME                      ,
DM_PRODUCT_KYLIN.SINGLEPACKETCAPACITY                      ,
DM_PRODUCT_KYLIN.PRODUCT_LEVEL                             ,
DM_PRODUCT_KYLIN.PRODUCT_FUNCTION                          ,
DM_PRODUCT_KYLIN.NEW_PRODUCT_FLAG                          ,
DM_PRODUCT_KYLIN.NEW_PRODUCT_NAME                          ,
DM_PRODUCT_KYLIN.MAIN_PRODUCT_FLAG                         ,
DM_PRODUCT_KYLIN.MAIN_PRODUCT_NAME                         ,
DM_PRODUCT_KYLIN.LAUNCH_DATE                               ,
DM_PRODUCT_KYLIN.EXIT_DATE                                 ,
DM_PRODUCT_KYLIN.PRODUCT_UNIT_PRIMARY_NAME                 ,
DM_PRODUCT_KYLIN.PRODUCT_UNIT_SECONDARY_NAME               ,
DM_PRODUCT_KYLIN.PRODUCT_GRADE                             ,
DM_PRODUCT_KYLIN.OEM_OR_PROMOTION                          ,
DM_PRODUCT_KYLIN.PRICE_GRADE                               ,
DM_PRODUCT_KYLIN.ELECTRONIC_PRODUCTS                       ,
DM_PRODUCT_KYLIN.PRODUCT_ATTRIBUTE                         ,
DM_PRODUCT_KYLIN.PRODUCT_ATTRIBUTE_NAME                    ,
DM_PRODUCT_KYLIN.PRODUCTION_MODE_NAME                      ,
DM_PRODUCT_KYLIN.TAX_RATE                                  ,
DM_PRODUCT_KYLIN.PROD_PLACE                                ,
DM_PRODUCT_KYLIN.ORGANIC_FLG                               ,
DM_PRODUCT_KYLIN.FRESH_DAYS                                ,
DM_PRODUCT_KYLIN.BAGS_IN_BOX                               ,
DM_PRODUCT_KYLIN.SUGER_LEVEL                               ,
DM_PRODUCT_KYLIN.MEAT_GYPE                                 ,
DM_PRODUCT_KYLIN.SUGER_TYPE                                ,
DM_PRODUCT_KYLIN.BROADCAST                                 ,
DM_PRODUCT_KYLIN.PROD_LINE                                 ,
DM_PRODUCT_KYLIN.UNIT_OF_INVENT                            ,
DM_PRODUCT_KYLIN.PEOPLE_OF_GP                              ,
DM_PRODUCT_KYLIN.TIME_OF_DRINK                             ,
DM_PRODUCT_KYLIN.COMB_FLG                                  ,
DM_PRODUCT_KYLIN.END_NEW_DT                                ,
DM_PRODUCT_KYLIN.TPM_PROD_TP_CD                            ,
DM_PRODUCT_KYLIN.TPM_PROD_TP_NM                            ,
DM_PRODUCT_KYLIN.PROD_SEGMENT                              ,
DM_PRODUCT_KYLIN.PROD_SEGMENT_DESC                         ,
DM_PRODUCT_KYLIN.COLD_PROPERTIES                           ,
DM_PRODUCT_KYLIN.COLD_PROPERTIES_DESC                      ,
DM_PRODUCT_KYLIN.COLD_TP                                   ,
DM_PRODUCT_KYLIN.PRODUCT_CHILD_BRAND_CODE                  ,
DM_PRODUCT_KYLIN.BG_MAIN_PRODUCT_FLAG                      ,
DM_PRODUCT_KYLIN.BG_MAIN_PRODUCT_NAME                      ,
DM_SL_REQUEST_TYPE_D.LOOKUP_CODE                           ,
DM_SL_REQUEST_TYPE_D.MEANING                               ,
DM_SL_REQUEST_TYPE_D.DESCRIPTION                           ,
DM_SL_REQUEST_TYPE_D.ENABLED_FLAG                          ,
DM_SL_REQUEST_TYPE_D.LAST_UPDATE_DATE                      ,
DM_SL_REQUEST_TYPE_D.LONGITUDE                             ,
DM_SL_REQUEST_TYPE_D.LATITUDE                              ,
PJ_SL_ORDER_PERFORM_DAY_A.ORDER_NUM                        ,
PJ_SL_ORDER_PERFORM_DAY_A.ADJUST_ORDER_NUM                 ,
PJ_SL_ORDER_PERFORM_DAY_A.PERFECT_ORDER_NUM                ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_RECEIVE_NUM               ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_SHIPMENT_NUM              ,
PJ_SL_ORDER_PERFORM_DAY_A.TIME_RECEIVE_QTD_J               ,
PJ_SL_ORDER_PERFORM_DAY_A.ORDER_QTD_J                      ,
PJ_SL_ORDER_PERFORM_DAY_A.TIME_RECEIVE_QTD_T               ,
PJ_SL_ORDER_PERFORM_DAY_A.ORDER_QTD_T                      ,
PJ_SL_ORDER_PERFORM_DAY_A.TIME_RECEIVE_P_NUM               ,
PJ_SL_ORDER_PERFORM_DAY_A.ORDER_P_NUM                      ,
PJ_SL_ORDER_PERFORM_DAY_A.ADJUST_ORDER_J                   ,
PJ_SL_ORDER_PERFORM_DAY_A.ADJUST_ORDER_T                   ,
PJ_SL_ORDER_PERFORM_DAY_A.INSTORE_P_NUM                    ,
PJ_SL_ORDER_PERFORM_DAY_A.INSTORE_P_T                      ,
PJ_SL_ORDER_PERFORM_DAY_A.SALES_PLAN_J                     ,
PJ_SL_ORDER_PERFORM_DAY_A.SALES_PLAN_T                     ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_SHIPMENT_J                ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_SHIPMENT_T                ,
PJ_SL_ORDER_PERFORM_DAY_A.SHIPMENT_QTD_J                   ,
PJ_SL_ORDER_PERFORM_DAY_A.SHIPMENT_QTD_T                   ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_RECEIVE_J                 ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_RECEIVE_T                 ,
PJ_SL_ORDER_PERFORM_DAY_A.CANCEL_ORDER_J                   ,
PJ_SL_ORDER_PERFORM_DAY_A.CANCEL_ORDER_T                   ,
PJ_SL_ORDER_PERFORM_DAY_A.UNMET_T                          ,
PJ_SL_ORDER_PERFORM_DAY_A.ONTIME_DELIVERY                  ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_ORDER_PER                 ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_ADJUST                    ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_CANCEL                    ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_INSTORE                   ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_ONTIME_SHIPMENT           ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_ONTIME_RECEIVE            ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_UNMET                     ,
PJ_SL_ORDER_PERFORM_DAY_A.TARGET_ONTIME_DELIVERY           ,
PJ_SL_ORDER_PERFORM_DAY_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_ORDER_PERFORM_DAY_A` as `PJ_SL_ORDER_PERFORM_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_ORDER_PERFORM_DAY_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`DEALER_WID` = `W_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_REQUEST_TYPE_D` as `DM_SL_REQUEST_TYPE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`REQUEST_WID` = `DM_SL_REQUEST_TYPE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
WHERE PJ_SL_ORDER_PERFORM_DAY_A.BU_WID=5 
AND 
PJ_SL_ORDER_PERFORM_DAY_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');

--添加区域需求分类配置表
insert overwrite table bigdata_dw.DM_BI_GROUP_B_Kylin 
select 
D_PAR_ORG_PARAMETER.def_demand_type as def_demand_type,
D_NCT_CUX_BI_GROUP_B.dq_name as dq_name
from 
DATA_LAKE.D_PAR_ORG_PARAMETER
inner join DATA_LAKE.D_NCT_CUX_BI_GROUP_B
on
D_PAR_ORG_PARAMETER.org_code=D_NCT_CUX_BI_GROUP_B.WHSE_CODE
where 1=1 and D_NCT_CUX_BI_GROUP_B.business_unit_id='220100'
and D_PAR_ORG_PARAMETER.def_demand_type is not null
and D_NCT_CUX_BI_GROUP_B.fail_date is null
and D_PAR_ORG_PARAMETER.org_code not like '%G%'
and D_NCT_CUX_BI_GROUP_B.deparment='物流部'
and D_NCT_CUX_BI_GROUP_B.orgn_type='分仓'
and D_NCT_CUX_BI_GROUP_B.whse_code not in('CB8','X58') --特殊去除CB8,X58仓库，上生产通过失效日期过滤，去除此条件
group by D_PAR_ORG_PARAMETER.def_demand_type,
D_NCT_CUX_BI_GROUP_B.dq_name
;

--添加区域分仓配置表
insert overwrite table bigdata_dw.DM_BI_GROUP_B_WH_KYLIN 
select 
*
from 
DATA_LAKE.D_NCT_CUX_BI_GROUP_B
where 1=1 
and D_NCT_CUX_BI_GROUP_B.deparment='物流部'
and D_NCT_CUX_BI_GROUP_B.fail_date is null
;



--订单履行率
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ORDER_PERFORM_DAY_A_manul PARTITION (DATE_)
select                                           
BU_NAME                                       ,
BIG_AREA_CODE                                 ,
BIG_AREA_NAME                                 ,
AREA_CODE                                     ,
AREA_NAME                                     ,
CITIES_NAME                                   ,
CITY_NAME                                     ,
BIG_AREA_LONGITUDE                            ,
BIG_AREA_LATITUDE                             ,
null                                ,
null                                 ,
null                              ,
null                               ,
null                                ,
null                                 ,
BG_CODE                                       ,
BG_NAME                                       ,
YEAR_NM                                       ,
MONTH_NM                                      ,
DAY_NM                                        ,
YEAR_NUM                                      ,
DAY_NUM                                       ,
MONTH_NUM                                     ,
day_code                                       ,
DALER_NAME                                    ,
DEALER_TYPE2                                  ,
PRODUCT_DESCRIBE                              ,
PRODUCT_TYPE_DESCRIPTION                      ,
CATEGORY_ONE_NAME                             ,
CATEGORY_TWO_NAME                             ,
CATEGORY_THREE_NAME                           ,
CATEGORY_FOUR                                 ,
CATEGORY_FIVE                                 ,
PRODUCT_BRAND                                 ,
PRODUCT_CHILD_BRAND                           ,
PRODUCT_PACKING_NAME                          ,
PRODUCT_LEVEL                                 ,
PRODUCT_GRADE                                 ,
ELECTRONIC_PRODUCTS                           ,
PRODUCT_ATTRIBUTE_NAME                        ,
PRODUCT_CHILD_BRAND_CODE                      ,
New_Product_Name                         ,
Main_Product_Name                         ,
WH_NAME                                       ,
WH_CODE                                       ,
DM_SL_WAREHOUSE_D.LONGITUDE                                     ,
DM_SL_WAREHOUSE_D.LATITUDE                                      ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                                    ,
ORGN_NAME                                     ,
ORDER_NUM                                     ,
ADJUST_ORDER_NUM                              ,
PERFECT_ORDER_NUM                             ,
ONTIME_RECEIVE_NUM                            ,
ONTIME_SHIPMENT_NUM                           ,
TIME_RECEIVE_QTD_J                            ,
ORDER_QTD_J                                   ,
TIME_RECEIVE_QTD_T                            ,
ORDER_QTD_T                                   ,
TIME_RECEIVE_P_NUM                            ,
ORDER_P_NUM                                   ,
ADJUST_ORDER_J                                ,
ADJUST_ORDER_T                                ,
INSTORE_P_NUM                                 ,
INSTORE_P_T                                   ,
SALES_PLAN_J                                  ,
SALES_PLAN_T                                  ,
ONTIME_SHIPMENT_J                             ,
ONTIME_SHIPMENT_T                             ,
SHIPMENT_QTD_J                                ,
SHIPMENT_QTD_T                                ,
ONTIME_RECEIVE_J                              ,
ONTIME_RECEIVE_T                              ,
CANCEL_ORDER_J                                ,
CANCEL_ORDER_T                                ,
UNMET_T                                       ,
ONTIME_DELIVERY                               ,
TARGET_ORDER_PER                              ,
TARGET_ADJUST                                 ,
TARGET_CANCEL                                 ,
TARGET_INSTORE                                ,
TARGET_ONTIME_SHIPMENT                        ,
TARGET_ONTIME_RECEIVE                         ,
TARGET_UNMET                                  ,
TARGET_ONTIME_DELIVERY                        ,
PJ_SL_ORDER_PERFORM_DAY_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_ORDER_PERFORM_DAY_A` as `PJ_SL_ORDER_PERFORM_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_ORDER_PERFORM_DAY_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`DEALER_WID` = `W_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_REQUEST_TYPE_D` as `DM_SL_REQUEST_TYPE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`REQUEST_WID` = `DM_SL_REQUEST_TYPE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_ORDER_PERFORM_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
WHERE PJ_SL_ORDER_PERFORM_DAY_A.BU_WID in (1,2)
AND 
PJ_SL_ORDER_PERFORM_DAY_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');


--订单日及时上款比例（月）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ORDER_PAY_MONTH_A_manul 
select                                           
BU_NAME                      ,
BIG_AREA_CODE                ,
BIG_AREA_NAME                ,
Big_Area_Latitude     ,
Big_Area_Longitude     ,
AREA_CODE                    ,
AREA_NAME                    ,
CITIES_NAME                  ,
CITY_NAME                    ,
BG_CODE                      ,
BG_NAME                      ,
YEAR_NM                      ,
MONTH_NM                     ,
DAY_NM                       ,
YEAR_NUM                     ,
DAY_NUM                      ,
MONTH_NUM                    ,
concat(month_code,'-01')     ,
DALER_NAME                   ,
LOOKUP_CODE                  ,
MEANING                      ,
LONGITUDE                    ,
LATITUDE                     ,
month_wid                    ,
ORDER_QTD_T                  ,
PAY_QTD_T                    ,
NO_PAY_QTD_T                 ,
TARGET_ORDER_PAY             ,
LY_ORDER_QTD_T               ,
LY_PAY_QTD_T                 ,
LY_NO_PAY_QTD_T              ,
LY_TARGET_ORDER_PAY
from bigdata_dm.PJ_SL_ORDER_PAY_MONTH_A PJ_SL_ORDER_PAY_MONTH_A
   inner join bigdata_dw.W_AREA_D W_AREA_D
   on PJ_SL_ORDER_PAY_MONTH_A.area_wid = W_AREA_D.row_wid
   INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
   ON `PJ_SL_ORDER_PAY_MONTH_A`.`month_wid` = `W_DATE_D`.`ROW_WID`
   INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
   ON `PJ_SL_ORDER_PAY_MONTH_A`.`DEALER_WID` = `W_DEALER_D`.`ROW_WID`
   inner join bigdata_dw.W_BG_D W_BG_D
   on PJ_SL_ORDER_PAY_MONTH_A.bu_wid = W_BG_D.row_wid
   inner join bigdata_dw.DM_SL_REQUEST_TYPE_D DM_SL_REQUEST_TYPE_D
   on PJ_SL_ORDER_PAY_MONTH_A.request_type_wid = DM_SL_REQUEST_TYPE_D.row_wid
   where 1=1;


--订单日及时上款比例
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ORDER_PAY_DAY_A_manul 
select                                           
BU_NAME                       ,
BIG_AREA_CODE                 ,
BIG_AREA_NAME                 ,
AREA_CODE                     ,
AREA_NAME                     ,
CITIES_NAME                   ,
CITY_NAME                     ,
BIG_AREA_LONGITUDE            ,
BIG_AREA_LATITUDE             ,
BG_CODE                       ,
BG_NAME                       ,
YEAR_NM                       ,
MONTH_NM                      ,
DAY_NM                        ,
YEAR_NUM                      ,
DAY_NUM                       ,
MONTH_NUM                     ,
day_code                       ,
DALER_NAME                    ,
LOOKUP_CODE                   ,
MEANING                       ,
LONGITUDE                     ,
LATITUDE                      ,
ORDER_QTD_T                   ,
PAY_QTD_T                     ,
NO_PAY_QTD_T                  ,
TARGET_ORDER_PAY
from bigdata_dm.PJ_SL_ORDER_PAY_DAY_A PJ_SL_ORDER_PAY_DAY_A
   inner join bigdata_dw.W_AREA_D W_AREA_D
   on PJ_SL_ORDER_PAY_DAY_A.area_wid = W_AREA_D.row_wid
   INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
   ON `PJ_SL_ORDER_PAY_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
   inner join bigdata_dw.W_BG_D W_BG_D
   on PJ_SL_ORDER_PAY_DAY_A.bu_wid = W_BG_D.row_wid
   inner join bigdata_dw.W_DEALER_D W_DEALER_D
   on PJ_SL_ORDER_PAY_DAY_A.dealer_wid = W_DEALER_D.row_wid
   inner join bigdata_dw.dm_SL_REQUEST_TYPE_D dm_SL_REQUEST_TYPE_D
   on PJ_SL_ORDER_PAY_DAY_A.request_type_wid = dm_SL_REQUEST_TYPE_D.row_wid
   where 1=1;


--分仓订单履行率（奶粉）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ORDER_PERFORM_DAY_WH_A_NF_manul PARTITION (DATE_)
select                                           
bg_code                 ,
bg_name                 ,
year_nm                 ,
month_nm                ,
day_nm                  ,
year_num                ,
day_num                 ,
month_num               ,
day_code                 ,
product_describe        ,
product_type_description,
category_one_name       ,
category_two_name       ,
category_three_name     ,
category_four           ,
category_five           ,
product_brand           ,
product_child_brand     ,
product_packing_name    ,
product_level           ,
product_grade           ,
electronic_products     ,
product_attribute_name  ,
product_child_brand_code,
new_product_name           ,
main_product_name          ,
wh_name                 ,
wh_code                 ,
longitude               ,
latitude                ,
DM_SL_WAREHOUSE_D.attribute4              ,
orgn_name               ,
product_wid ,
order_num               ,
adjust_order_num        ,
perfect_order_num       ,
ontime_receive_num      ,
ontime_shipment_num     ,
time_receive_qtd_j      ,
order_qtd_j             ,
time_receive_qtd_t      ,
order_qtd_t             ,
time_receive_p_num      ,
order_p_num             ,
adjust_order_j          ,
adjust_order_t          ,
instore_p_num           ,
instore_p_t             ,
sales_plan_j            ,
sales_plan_t            ,
ontime_shipment_j       ,
ontime_shipment_t       ,
shipment_qtd_j          ,
shipment_qtd_t          ,
ontime_receive_j        ,
ontime_receive_t        ,
cancel_order_j          ,
cancel_order_t          ,
unmet_t                 ,
ontime_delivery         ,
target_order_per        ,
target_adjust           ,
target_cancel           ,
target_instore          ,
target_ontime_shipment  ,
target_ontime_receive   ,
target_unmet            ,
target_ontime_delivery  ,
PJ_SL_ORDER_PERFORM_DAY_WH_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_ORDER_PERFORM_DAY_WH_A` as `PJ_SL_ORDER_PERFORM_DAY_WH_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
WHERE 1=1 AND (`PJ_SL_ORDER_PERFORM_DAY_WH_A`.BU_WID=2) 
AND 
PJ_SL_ORDER_PERFORM_DAY_WH_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');


--分仓订单履行率（液奶）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ORDER_PERFORM_DAY_WH_A_YN_manul PARTITION (DATE_)
SELECT                              
bg_code                                ,
bg_name                                ,
year_nm                                ,
month_nm                               ,
day_nm                                 ,
year_num                               ,
day_num                                ,
month_num                              ,
day_code                                ,
product_describe                       ,
product_type_description               ,
category_one_name                      ,
category_two_name                      ,
category_three_name                    ,
category_four                          ,
category_five                          ,
product_brand                          ,
product_child_brand                    ,
product_packing_name                   ,
product_level                          ,
product_grade                          ,
electronic_products                    ,
product_attribute_name                 ,
product_child_brand_code               ,
new_product_name                       ,
main_product_name                      ,
lookup_code                            ,
meaning                                ,
longitude                              ,
latitude                               ,
product_wid                            ,
order_num                              ,
adjust_order_num                       ,
perfect_order_num                      ,
ontime_receive_num                     ,
ontime_shipment_num                    ,
time_receive_qtd_j                     ,
order_qtd_j                            ,
time_receive_qtd_t                     ,
order_qtd_t                            ,
time_receive_p_num                     ,
order_p_num                            ,
adjust_order_j                         ,
adjust_order_t                         ,
instore_p_num                          ,
instore_p_t                            ,
sales_plan_j                           ,
sales_plan_t                           ,
ontime_shipment_j                      ,
ontime_shipment_t                      ,
shipment_qtd_j                         ,
shipment_qtd_t                         ,
ontime_receive_j                       ,
ontime_receive_t                       ,
cancel_order_j                         ,
cancel_order_t                         ,
unmet_t                                ,
ontime_delivery                        ,
target_order_per                       ,
target_adjust                          ,
target_cancel                          ,
target_instore                         ,
target_ontime_shipment                 ,
target_ontime_receive                  ,
target_unmet                           ,
target_ontime_delivery                 ,
`PJ_SL_ORDER_PERFORM_DAY_WH_A`.date_
 FROM `BIGDATA_DM`.`PJ_SL_ORDER_PERFORM_DAY_WH_A` as `PJ_SL_ORDER_PERFORM_DAY_WH_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`DM_SL_REQUEST_TYPE_D` as `DM_SL_REQUEST_TYPE_D`
ON `PJ_SL_ORDER_PERFORM_DAY_WH_A`.`REQUEST_WID` = `DM_SL_REQUEST_TYPE_D`.`ROW_WID`
WHERE 1=1 AND (`PJ_SL_ORDER_PERFORM_DAY_WH_A`.BU_WID=5) 
AND 
PJ_SL_ORDER_PERFORM_DAY_WH_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');


--分仓有货率（月报）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_IN_STORE_MONTH_A_MANUL PARTITION (DATE_)
SELECT                              
BG_CODE                             ,
BG_NAME                             ,
YEAR_NM                             ,
MONTH_NM                            ,
DAY_NM                              ,
YEAR_NUM                            ,
DAY_NUM                             ,
MONTH_NUM                           ,
concat(W_DATE_D.month_code,'-01')              ,
PRODUCT_DESCRIBE                    ,
PRODUCT_TYPE_DESCRIPTION            ,
CATEGORY_ONE_NAME                   ,
CATEGORY_TWO_NAME                   ,
CATEGORY_THREE_NAME                 ,
CATEGORY_FOUR                       ,
CATEGORY_FIVE                       ,
PRODUCT_BRAND                       ,
PRODUCT_CHILD_BRAND                 ,
PRODUCT_GRADE                       ,
ELECTRONIC_PRODUCTS                 ,
PRODUCT_CHILD_BRAND_CODE            ,
new_product_name ,
main_product_name ,
WH_NAME                             ,
WH_CODE                             ,
LONGITUDE                           ,
LATITUDE                            ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                          ,
ORGN_NAME                           ,
MONTH_WID                           ,
SKU_QTY                             ,
PLAN_SKU_QTY                        ,
INVENTORY_T                         ,
PLAN_SALES_T                        ,
IN_STORE_T                          ,
OUT_STORE_T                         ,
OUT_STORE_QTY                       ,
WH_PLAN_SALE_T                      ,
LY_SKU_QTY                          ,
LY_PLAN_SKU_QTY                     ,
LY_INVENTORY_T                      ,
LY_PLAN_SALES_T                     ,
LY_IN_STORE_T                       ,
TARGET_IN_STORE                     ,
TARGET_IN_STORE_SKU                 ,
TARGET_IN_STORE_T                   ,
PJ_SL_IN_STORE_MONTH_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_IN_STORE_MONTH_A` as `PJ_SL_IN_STORE_MONTH_A`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_IN_STORE_MONTH_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_IN_STORE_MONTH_A`.`MONTH_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_PRODUCT_D` as `W_PRODUCT_D`
ON `PJ_SL_IN_STORE_MONTH_A`.`PRODUCT_WID` = `W_PRODUCT_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_IN_STORE_MONTH_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
WHERE 1=1
AND 
PJ_SL_IN_STORE_MONTH_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');

--经销商有货率-奶粉（日报）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DEALER_IN_STORE_DAY_A_NF_MANUL PARTITION (DATE_)
SELECT
W_AREA_D.BIG_AREA_CODE                              ,
W_AREA_D.AREA_CODE                                  ,
W_AREA_D.big_area_name                              ,
W_AREA_D.area_name                                  ,
W_AREA_D.BIG_AREA_LONGITUDE                         ,
W_AREA_D.BIG_AREA_LATITUDE                          ,
W_BG_D.BG_CODE                                    ,
W_BG_D.BG_NAME                                    ,
YEAR_NM                                    ,
MONTH_NM                                   ,
DAY_NM                                     ,
YEAR_NUM                                   ,
DAY_NUM                                    ,
MONTH_NUM                                  ,
Day_code                                    ,
DEALER_NAME                                ,
BG_AREA_NAME                               ,
BG_REGION_NAME                             ,
BG_CITY_GROUP_NAME                         ,
BG_CITY_NAME                               ,
is_warehouse_customer,
product_describe,
PRODUCT_TYPE_DESCRIPTION                   ,
CATEGORY_ONE_NAME                          ,
CATEGORY_TWO_NAME                          ,
CATEGORY_THREE_NAME                        ,
CATEGORY_FOUR                              ,
CATEGORY_FIVE                              ,
PRODUCT_BRAND                              ,
PRODUCT_CHILD_BRAND                        ,
PRODUCT_GRADE                              ,
ELECTRONIC_PRODUCTS                        ,
PRODUCT_CHILD_BRAND_CODE                   ,
new_product_name ,
main_product_name ,
INVENTORY_T                                ,
SALES_QTY_T                                ,
SALES_MTD_T                                ,
SALES_30_QTY_T                             ,
SKU_30_QTY                                 ,
INVENTORY_USE_DAY                          ,
INVENTORY_SKU_QTY                          ,
TARGET_IN_STORE_RATE                       ,
PJ_SL_DEALER_IN_STORE_DAY_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_DEALER_IN_STORE_DAY_A` as `PJ_SL_DEALER_IN_STORE_DAY_A`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_DEALER_IN_STORE_DAY_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_DMS_DEALER_D` as `DM_DMS_DEALER_D`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`DMS_DEALER_WID` = `DM_DMS_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
LEFT JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `DM_DMS_DEALER_D`.`AREA_CODE` = `W_AREA_D`.`CODE`
WHERE 1=1 AND (`PJ_SL_DEALER_IN_STORE_DAY_A`.`BU_WID`=2)
and
PJ_SL_DEALER_IN_STORE_DAY_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');


--经销商有货率-液奶（日报）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_DEALER_IN_STORE_DAY_A_YN_MANUL PARTITION (DATE_)
SELECT
BU_NAME                               ,
W_AREA_D.BIG_AREA_CODE                         ,
W_AREA_D.BIG_AREA_NAME                         ,
W_AREA_D.AREA_CODE                             ,
W_AREA_D.AREA_NAME                             ,
W_AREA_D.CITIES_NAME                           ,
W_AREA_D.CITY_NAME                             ,
W_AREA_D.BIG_AREA_LATITUDE  ,
W_AREA_D.BIG_AREA_LONGITUDE  ,
W_BG_D.BG_CODE                               ,
W_BG_D.BG_NAME                               ,
YEAR_NM                               ,
MONTH_NM                              ,
DAY_NM                                ,
YEAR_NUM                              ,
DAY_NUM                               ,
MONTH_NUM                             ,
Day_code                               ,
PRODUCT_DESCRIBE                      ,
PRODUCT_TYPE_DESCRIPTION              ,
category_one_name,
category_two_name,
CATEGORY_THREE_NAME                   ,
CATEGORY_FOUR                         ,
CATEGORY_FIVE                         ,
PRODUCT_BRAND                         ,
PRODUCT_CHILD_BRAND                   ,
PRODUCT_GRADE                         ,
ELECTRONIC_PRODUCTS                   ,
PRODUCT_CHILD_BRAND_CODE              ,
new_product_name ,
main_product_name ,
DEALER_NAME                           ,
INVENTORY_T                           ,
SALES_QTY_T                           ,
SALES_MTD_T                           ,
SALES_30_QTY_T                        ,
SKU_30_QTY                            ,
INVENTORY_USE_DAY                     ,
INVENTORY_SKU_QTY                     ,
TARGET_IN_STORE_RATE                  ,
PJ_SL_DEALER_IN_STORE_DAY_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_DEALER_IN_STORE_DAY_A` as `PJ_SL_DEALER_IN_STORE_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_PRODUCT_KYLIN` as `DM_PRODUCT_KYLIN`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`PRODUCT_WID` = `DM_PRODUCT_KYLIN`.`ROW_WID` AND `PJ_SL_DEALER_IN_STORE_DAY_A`.`SALES_YEAR` = `DM_PRODUCT_KYLIN`.`DATE_`
INNER JOIN `BIGDATA_DW`.`DM_SL_ZKT_DEALER_D` as `DM_SL_ZKT_DEALER_D`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`DMS_DEALER_WID` = `DM_SL_ZKT_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_DEALER_IN_STORE_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
LEFT JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `DM_SL_ZKT_DEALER_D`.`AREA_CODE` = `W_AREA_D`.`CODE`
WHERE 1=1 AND (`PJ_SL_DEALER_IN_STORE_DAY_A`.BU_WID=5)
and
PJ_SL_DEALER_IN_STORE_DAY_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');


--紧急加单率（日）
INSERT OVERWRITE TABLE BIGDATA_MANUL.PJ_SL_ADD_ORDER_DAY_A_SN_MANUL PARTITION (DATE_)
SELECT
BU_NAME                           ,
BIG_AREA_CODE                     ,
BIG_AREA_NAME                     ,
AREA_CODE                         ,
AREA_NAME                         ,
CITIES_NAME                       ,
CITY_NAME                         ,
BIG_AREA_LONGITUDE                ,
BIG_AREA_LATITUDE                 ,
null                    ,
null                     ,
null                  ,
null                   ,
null                    ,
null                     ,
BG_CODE                           ,
BG_NAME                           ,
YEAR_NM                           ,
MONTH_NM                          ,
DAY_NM                            ,
YEAR_NUM                          ,
DAY_NUM                           ,
MONTH_NUM                         ,
day_code                           ,
DALER_NAME                        ,
PRODUCT_DESCRIBE                  ,
PRODUCT_TYPE_DESCRIPTION          ,
CATEGORY_ONE_NAME                 ,
CATEGORY_TWO_NAME                 ,
CATEGORY_THREE_NAME               ,
CATEGORY_FOUR                     ,
CATEGORY_FIVE                     ,
PRODUCT_BRAND                     ,
PRODUCT_CHILD_BRAND               ,
PRODUCT_GRADE                     ,
ELECTRONIC_PRODUCTS               ,
PRODUCT_CHILD_BRAND_CODE          ,
WH_NAME                           ,
WH_CODE                           ,
LONGITUDE                         ,
LATITUDE                          ,
DM_SL_WAREHOUSE_D.ATTRIBUTE4                        ,
ORGN_NAME                         ,
REQUIER_CYCLE                     ,
NORMAL_CYCLE                      ,
ORDER_QTY_NUM                     ,
ORDER_QTY_T                       ,
ORDER_QTY_J                       ,
ORDER_QTY_AMT                     ,
ADD_ORDER_QTY_NUM                 ,
ADD_ORDER_QTY_T                   ,
ADD_ORDER_QTY_J                   ,
ADD_ORDER_QTY_AMT                 ,
PJ_SL_ADD_ORDER_DAY_A.date_
 FROM `BIGDATA_DM`.`PJ_SL_ADD_ORDER_DAY_A` as `PJ_SL_ADD_ORDER_DAY_A`
INNER JOIN `BIGDATA_DW`.`W_DATE_D` as `W_DATE_D`
ON `PJ_SL_ADD_ORDER_DAY_A`.`DAY_WID` = `W_DATE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_AREA_D` as `W_AREA_D`
ON `PJ_SL_ADD_ORDER_DAY_A`.`AREA_WID` = `W_AREA_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_PRODUCT_D` as `W_PRODUCT_D`
ON `PJ_SL_ADD_ORDER_DAY_A`.`PRODUCT_WID` = `W_PRODUCT_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`DM_SL_WAREHOUSE_D` as `DM_SL_WAREHOUSE_D`
ON `PJ_SL_ADD_ORDER_DAY_A`.`WH_WID` = `DM_SL_WAREHOUSE_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_DEALER_D` as `W_DEALER_D`
ON `PJ_SL_ADD_ORDER_DAY_A`.`DEALER_WID` = `W_DEALER_D`.`ROW_WID`
INNER JOIN `BIGDATA_DW`.`W_BG_D` as `W_BG_D`
ON `PJ_SL_ADD_ORDER_DAY_A`.`BU_WID` = `W_BG_D`.`ROW_WID`
WHERE 1=1
AND
PJ_SL_ADD_ORDER_DAY_A.DATE_>=
regexp_replace(concat(substr(add_months(date_sub(current_date,1),-1),1,7),'01'),'-','');


