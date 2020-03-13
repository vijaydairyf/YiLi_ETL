

truncate table bigdata_dm.pj_sl_in_store_day_a;
insert overwrite table bigdata_dm.pj_sl_in_store_day_a partition (date_)
select *,day_wid from bigdata_dm.pj_sl_in_store_day_a_tmp;


truncate table bigdata_dm.pj_sl_order_perform_day_a;
insert overwrite table bigdata_dm.pj_sl_order_perform_day_a partition (date_)
select *,day_wid from bigdata_dm.pj_sl_order_perform_day_a_tmp;


truncate table bigdata_dm.pj_sl_dealer_in_store_day_a;
insert overwrite table bigdata_dm.pj_sl_dealer_in_store_day_a partition (date_)
select *,day_wid from bigdata_dm.pj_sl_dealer_in_store_day_a_tmp;


truncate table bigdata_dm.pj_sl_order_perform_day_wh_a;
insert overwrite table bigdata_dm.pj_sl_order_perform_day_wh_a partition (date_)
select *,day_wid from bigdata_dm.pj_sl_order_perform_day_wh_a_tmp;



truncate table bigdata_dm.pj_sl_in_store_month_a;
insert overwrite table bigdata_dm.pj_sl_in_store_month_a partition (date_)
select *,month_wid from bigdata_dm.pj_sl_in_store_month_a_tmp;
