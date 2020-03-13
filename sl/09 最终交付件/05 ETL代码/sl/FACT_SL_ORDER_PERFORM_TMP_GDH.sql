-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_order_perform_tmp/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dw.fact_sl_order_perform_tmp
-- project:
-- note:
-- purpose:                 订单履行率表pre表
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

insert overwrite table bigdata_dw.fact_sl_order_perform_tmp_gdh
select t1.datasource_id,
       t1.integration_id,
       t1.header_id,
       t1.order_number,
       t2.booked_date,
       substr(regexp_replace(t2.booked_date, '-', ''), 1, 8) as booked_dt_wid,
       t2.bg_name,
       t2.area_five_code,
       t2.dealer_name,
       t2.dealer_code,
       t4.wh_code,
       t1.request_type,
       t2.order_type,
       t1.cpbh,
       t1.sales_qty down_qty,
       t1.sales_wht down_wht,
       t1.prod_qty down_prod,
       case
         when t1.sales_qty >= nvl(t4.sales_qty, 0) then
          nvl(t4.sales_qty, 0)
         else
          t1.sales_qty
       end up_qty,
       case
         when t1.sales_wht >= nvl(t4.sales_wht, 0) then
          nvl(t4.sales_wht, 0)
         else
          t1.sales_wht
       end up_wht,
       case
         when t1.prod_qty >= nvl(t4.prod_qty, 0) then
          nvl(t4.prod_qty, 0)
         else
          t1.prod_qty
       end up_prod,
       nvl(t4.header_id, 0) erp_header_id
  from (
        --DMS
        select 'DMS' datasource_id,
                concat(tt1.erpid, tt1.product_no) as integration_id,
                tt1.erpid header_id,
                tt1.erpno order_number,
                tt1.product_no cpbh,
                sum(tt1.quantity_buy_pack) sales_qty,
                sum(tt1.quantitybuy_ton) sales_wht,
                count(distinct product_no) prod_qty,
                case
                  when cc.product_type = 'CPCP' then
                   b.cp_factory_id
                  when cc.product_type = 'RPCP' then
                   b.rp_factory_id
                  else
                   ''
                end request_type,
                tt2.organization_id wh_code
          from bigdata_ld.fact_sl_ld_dms_purchase_order tt1
          left join (select max(cast(organization_id as bigint)) as organization_id,
                            max(cast(organization_code as bigint)) as organization_code,
                            ordered_item,
                            order_number
                       from bigdata_ld.fact_sl_ld_erp_sales_order
                      group by order_number, ordered_item) tt2
            on tt1.product_no = ordered_item
           and order_number = tt1.erpno
          left join bigdata_dw.dm_sl_warehouse_d wh
            on tt2.organization_code = wh.wh_code
          left join bigdata_ld.fact_cx_awk_dealer_factory_set b
            on tt1.erp_dealer_code = b.dealer_num
          left join bigdata_dw.w_product_d cc
            on tt1.product_no = cc.integration_id
         where tt1.ou_type = 'YN'
           and tt1.source in ('手工')
         group by tt1.erpid,
                   tt1.erpno,
                   tt1.product_no,
                   tt2.organization_id,
                   case
                     when cc.product_type = 'CPCP' then
                      b.cp_factory_id
                     when cc.product_type = 'RPCP' then
                      b.rp_factory_id
                     else
                      ''
                   end) t1
  left join (select t2.*
               from bigdata_dw.fact_sl_zkt_to_dms per, bigdata_dw.dm_sl_sales_order_d t2
              where substr(regexp_replace(t2.booked_date, '-', ''), 1, 8) >= per.c_date
                and t2.big_area_name = per.bg_region_name
                and t2.area_name = per.bg_area_name) t2
    on t1.header_id = t2.header_id
   and t1.order_number = t2.order_number
  left join (select header_id,
                    item_no,
                    sum(sales_qty) sales_qty,
                    sum(sales_wht) sales_wht,
                    sum(prod_qty) prod_qty,
                    wh_code
               from (select header_id,
                            item_no,
                            IN_LIMIT,
                            case
                              when in_limit = 'Y' then
                               sum(sales_qty)
                              else
                               0
                            end sales_qty,
                            case
                              when in_limit = 'Y' then
                               sum(sales_wht)
                              else
                               0
                            end sales_wht,
                            count(distinct case
                                    when in_limit = 'Y' then
                                     item_no
                                    else
                                     null
                                  end) prod_qty,
                            wh_code
                       from (
                             --dms 
                             select tt3.header_id, --订单头id
                                     null as inventory_item_id,
                                     nvl(tt1.prodnum, tt3.ordered_item) item_no,
                                     tt1.qty_pack sales_qty, --发运件
                                     tt1.qty_ton sales_wht, --发运吨
                                     tt1.erp_line_id as line_id,
                                     null as delivery_detail_id, --发运号
                                     tt1.business_date as received_status_time, --接收时间
                                     nvl(tt3.attribute18, tt3.booked_date) booked_date, --默认取行登记时间，为空时取头登记时间
                                     case
                                       when 4.0 -
                                            round(((unix_timestamp(tt1.business_date) -
                                            nvl(unix_timestamp(tt3.attribute18),
                                                  unix_timestamp(tt3.booked_date))) / 3600 / 24),2) >= 0 then
                                        'Y'
                                       else
                                        'N'
                                     end in_limit,
                                     tt3.organization_id wh_code
                               from bigdata_ld.fact_sl_ld_dms_st_business tt1
                              right join bigdata_ld.fact_sl_ld_erp_sales_order tt3
                                 on tt1.erp_line_id = tt3.line_id
                               left join bigdata_dw.w_bigdata_p tt4
                                 on tt1.bg_code = tt4.bg_code
                                and tt4.name = '订单满足时限值'
                             --                                    and to_date(tt1.business_date, 'yyyy-mm-dd hh24:mi:ss') between tt4.start_dt and tt4.end_dt)
                             ) t1
                      group by header_id, in_limit, item_no, wh_code) t1
              group by header_id, item_no, wh_code) t4
    on t1.header_id = t4.header_id
   and t1.cpbh = t4.item_no
   and t1.wh_code = t4.wh_code
 where t2.bg_name = '液态奶事业部' and substr(t2.booked_date, 1, 10) >= date_sub(current_date,100);

 
