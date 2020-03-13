--查询si当日值，月累计值
select round(sum(pj_ec_sales_gmv.sales_amt_before)/10000,2)  as sales_amt_before,
round(sum(pj_ec_sales_gmv.sales_amt_before_mtd)/10000,2)  as sales_amt_before_mtd
from bigdata_dm.pj_ec_sales_gmv as pj_ec_sales_gmv
inner join bigdata_dw.w_bg_d as w_bg_d
on pj_ec_sales_gmv.bg_wid = w_bg_d.row_wid
inner join bigdata_dw.w_date_d as w_date_d
on pj_ec_sales_gmv.sales_dt_wid = w_date_d.row_wid
inner join bigdata_dw.w_ec_product_d as w_ec_product_d
on pj_ec_sales_gmv.erp_id = w_ec_product_d.row_wid
where 1=1 and w_date_d.row_wid=20190308;



--查询si当日值，月累计值
select 
round(t.amt_bf_without_tax,2) as amt_bf_without_tax,
round(t.amt_bf_without_tax_mtd,2) as amt_bf_without_tax_mtd,
round(t.budget_amt_bf_without_tax_mtd,2) as budget_amt_bf_without_tax_mtd,
round(t.yago_amt_bf_without_tax_mtd,2) as yago_amt_bf_without_tax_mtd
if(t.budget_amt_bf_without_tax_mtd=0,0,(t.amt_bf_without_tax_mtd/t.budget_amt_bf_without_tax_mtd*100) as a,
if(t.yago_amt_bf_without_tax_mtd=0,0,(t.amt_bf_without_tax_mtd-t.yago_amt_bf_without_tax_mtd)/t.yago_amt_bf_without_tax_mtd*100) as b
from
(select
sum(pj_ec_sales_si.amt_bf_without_tax)/10000  as amt_bf_without_tax,
sum(pj_ec_sales_si.amt_bf_without_tax_mtd)/10000  as amt_bf_without_tax_mtd,
sum(pj_ec_sales_si.budget_amt_bf_without_tax_mtd)/10000  as budget_amt_bf_without_tax_mtd,
sum(pj_ec_sales_si.yago_amt_bf_without_tax_mtd)/10000  as yago_amt_bf_without_tax_mtd
from bigdata_dm.pj_ec_sales_si pj_ec_sales_si
inner join bigdata_dw.w_date_d w_date_d
on pj_ec_sales_si.sales_dt_wid = w_date_d.row_wid
inner join bigdata_dw.w_ec_product_d1 w_ec_product_d1
on pj_ec_sales_si.erp_id = w_ec_product_d1.erp_id
inner join bigdata_dw.w_bg_d w_bg_d
on pj_ec_sales_si.bg_wid = w_bg_d.row_wid
where 1=1 and w_date_d.row_wid=20190416) t;

--导出其他数据
select 
'SI' as type,
sales_dt_wid,
sales_year,
date_,
platform_name,
sale_area_name,
erp_id,
pro_id,
pro_categ_name,
pro_brand_name,
pro_grade,
sales_qty_box,
amt_bf_without_tax
from bigdata_dm.pj_ec_sales_si where  pro_categ_name = '其他'  or  pro_brand_name = '其他'
union all
select 
'GMV' as type,
sales_dt_wid,
sales_year,
date_,
platform_name,
sale_area_name,
erp_id,
pro_id,
pro_categ_name,
pro_brand_name,
pro_grade,
sales_qty_box,
sales_amt_before
from bigdata_dm.pj_ec_sales_gmv where pro_categ_name = '其他'  or  pro_brand_name = '其他';

--