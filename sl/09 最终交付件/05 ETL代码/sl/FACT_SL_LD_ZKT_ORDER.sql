

drop table bigdata_ld.fact_sl_ld_zkt_order_tmp1;

create table bigdata_ld.fact_sl_ld_zkt_order_tmp1 as 
select * from  bigdata_ld.fact_sl_ld_zkt_order 
where substr(updatetime,1,10)< date_sub(current_date,11) ;


   insert overwrite table bigdata_ld.fact_sl_ld_zkt_order 
   select * from bigdata_ld.fact_sl_ld_zkt_order_tmp1;
   
   insert into table bigdata_ld.fact_sl_ld_zkt_order
   select * from bigdata_ld.fact_sl_ld_zkt_order_tmp;

