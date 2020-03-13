
drop table datalake_md.d_evt_cofco_daily_sales;
create table datalake_md.d_evt_cofco_daily_sales
(
    dt  string,
    web_name  string,
    web_code  string,
    prod_name  string,
    deal_prod_qty  string,
    deal_total_amt  string,
    src_sys_row_id  varchar(32),
    src_sys_cd  varchar(10),
    src_table_name  varchar(50),
    etl_dt  timestamp,
    data_dt  string
)
row format delimited fields terminated by '\001' lines terminated by '\n' stored as orc;
alter table datalake_md.d_evt_cofco_daily_sales set tblproperties('comment' = '中粮我买网每日销售');
alter table datalake_md.d_evt_cofco_daily_sales change column  dt dt string comment '日期';
alter table datalake_md.d_evt_cofco_daily_sales change column  web_name web_name string comment '平台';
alter table datalake_md.d_evt_cofco_daily_sales change column  web_code web_code string comment '平台编号';
alter table datalake_md.d_evt_cofco_daily_sales change column  prod_name prod_name string comment '商品名称';
alter table datalake_md.d_evt_cofco_daily_sales change column  deal_prod_qty deal_prod_qty string comment '成交商品件数';
alter table datalake_md.d_evt_cofco_daily_sales change column  deal_total_amt deal_total_amt string comment '成交金额';
alter table datalake_md.d_evt_cofco_daily_sales change column  src_sys_row_id src_sys_row_id varchar(32) comment '源系统pk';
alter table datalake_md.d_evt_cofco_daily_sales change column  src_sys_cd src_sys_cd varchar(10) comment '源系统代码';
alter table datalake_md.d_evt_cofco_daily_sales change column  src_table_name src_table_name varchar(50) comment '源表名';
alter table datalake_md.d_evt_cofco_daily_sales change column  etl_dt etl_dt timestamp comment 'etl处理时间';
alter table datalake_md.d_evt_cofco_daily_sales change column  data_dt data_dt string comment '数据日期';
