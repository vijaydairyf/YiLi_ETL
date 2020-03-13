
drop table data_lake.d_evt_direct_shop_data;
create table data_lake.d_evt_direct_shop_data
(
    shop_name  string,
    order_no  string,
    order_type  string,
    prod_code  string,
    prod_name  string,
    spf_code  string,
    spf_name  string,
    brand  string,
    categ  string,
    prod_responsible  string,
    inv_responsible  string,
    pay_dt  string,
    cost_price  string,
    qty  string,
    sales_unit_price  string,
    sales_amt  string,
    let_profit_amt  string,
    oper_pay_amt  string,
    actual_ship_amt  string,
    tag_price  string,
    tag_amt  string,
    cost_amt  string,
    size  string,
    year  string,
    season  string,
    out_inv_wh  string,
    order_transaction_no  string,
    wms_ship_tm  string,
    wms_actual_ship_qty  string,
    prod_external_code  string,
    online_categ_responsible  string,
    cash_on_delivery  string,
    to_pay_service_fee  string,
    jd_external_code  string,
    sharing_logistics_fee  string,
    arrival_flag  string,
    arrival_tm  string,
    src_sys_row_id  varchar(32),
    src_sys_cd  varchar(10),
    src_table_name  varchar(50),
    etl_dt  timestamp,
    data_dt  string
)
row format delimited fields terminated by '\001' lines terminated by '\n' stored as orc;
alter table data_lake.d_evt_direct_shop_data set tblproperties('comment' = '直营店铺数据');
alter table data_lake.d_evt_direct_shop_data change column  shop_name shop_name string comment '店铺';
alter table data_lake.d_evt_direct_shop_data change column  order_no order_no string comment '订单编号';
alter table data_lake.d_evt_direct_shop_data change column  order_type order_type string comment '订单类型';
alter table data_lake.d_evt_direct_shop_data change column  prod_code prod_code string comment '商品代码';
alter table data_lake.d_evt_direct_shop_data change column  prod_name prod_name string comment '商品名称';
alter table data_lake.d_evt_direct_shop_data change column  spf_code spf_code string comment '规格代码';
alter table data_lake.d_evt_direct_shop_data change column  spf_name spf_name string comment '规格名称';
alter table data_lake.d_evt_direct_shop_data change column  brand brand string comment '品牌';
alter table data_lake.d_evt_direct_shop_data change column  categ categ string comment '类目';
alter table data_lake.d_evt_direct_shop_data change column  prod_responsible prod_responsible string comment '商品责任人';
alter table data_lake.d_evt_direct_shop_data change column  inv_responsible inv_responsible string comment '库存承担人';
alter table data_lake.d_evt_direct_shop_data change column  pay_dt pay_dt string comment '付款日期';
alter table data_lake.d_evt_direct_shop_data change column  cost_price cost_price string comment '成本价';
alter table data_lake.d_evt_direct_shop_data change column  qty qty string comment '数量';
alter table data_lake.d_evt_direct_shop_data change column  sales_unit_price sales_unit_price string comment '销售单价';
alter table data_lake.d_evt_direct_shop_data change column  sales_amt sales_amt string comment '销售金额';
alter table data_lake.d_evt_direct_shop_data change column  let_profit_amt let_profit_amt string comment '让利金额';
alter table data_lake.d_evt_direct_shop_data change column  oper_pay_amt oper_pay_amt string comment '运营支付金额';
alter table data_lake.d_evt_direct_shop_data change column  actual_ship_amt actual_ship_amt string comment '实际发货金额';
alter table data_lake.d_evt_direct_shop_data change column  tag_price tag_price string comment '吊牌价';
alter table data_lake.d_evt_direct_shop_data change column  tag_amt tag_amt string comment '吊牌金额';
alter table data_lake.d_evt_direct_shop_data change column  cost_amt cost_amt string comment '成本金额';
alter table data_lake.d_evt_direct_shop_data change column  size size string comment '尺码';
alter table data_lake.d_evt_direct_shop_data change column  year year string comment '年份';
alter table data_lake.d_evt_direct_shop_data change column  season season string comment '季节';
alter table data_lake.d_evt_direct_shop_data change column  out_inv_wh out_inv_wh string comment '出库仓库';
alter table data_lake.d_evt_direct_shop_data change column  order_transaction_no order_transaction_no string comment '订单交易号';
alter table data_lake.d_evt_direct_shop_data change column  wms_ship_tm wms_ship_tm string comment 'WMS发货时间';
alter table data_lake.d_evt_direct_shop_data change column  wms_actual_ship_qty wms_actual_ship_qty string comment 'WMS实际发货数量';
alter table data_lake.d_evt_direct_shop_data change column  prod_external_code prod_external_code string comment '商品外部编码';
alter table data_lake.d_evt_direct_shop_data change column  online_categ_responsible online_categ_responsible string comment '线上品类负责人';
alter table data_lake.d_evt_direct_shop_data change column  cash_on_delivery cash_on_delivery string comment '货到付款';
alter table data_lake.d_evt_direct_shop_data change column  to_pay_service_fee to_pay_service_fee string comment '到付服务费';
alter table data_lake.d_evt_direct_shop_data change column  jd_external_code jd_external_code string comment '京东外部编码';
alter table data_lake.d_evt_direct_shop_data change column  sharing_logistics_fee sharing_logistics_fee string comment '分摊物流费';
alter table data_lake.d_evt_direct_shop_data change column  arrival_flag arrival_flag string comment '是否到账';
alter table data_lake.d_evt_direct_shop_data change column  arrival_tm arrival_tm string comment '到账时间';
alter table data_lake.d_evt_direct_shop_data change column  src_sys_row_id src_sys_row_id varchar(32) comment '源系统pk';
alter table data_lake.d_evt_direct_shop_data change column  src_sys_cd src_sys_cd varchar(10) comment '源系统代码';
alter table data_lake.d_evt_direct_shop_data change column  src_table_name src_table_name varchar(50) comment '源表名';
alter table data_lake.d_evt_direct_shop_data change column  etl_dt etl_dt timestamp comment 'etl处理时间';
alter table data_lake.d_evt_direct_shop_data change column  data_dt data_dt string comment '数据日期';
