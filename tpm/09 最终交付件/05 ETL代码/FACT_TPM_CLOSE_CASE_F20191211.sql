

 drop table bigdata_dw.fact_tpm_close_case_f_tmp;
create table bigdata_dw.fact_tpm_close_case_f_tmp as 
SELECT bg.row_wid AS bg_wid
    ,division_name AS bg_name--事业部名称
    ,'cost' as data_src
    ,regexp_replace(month_code,'-','') as bug_month
    ,case when exe_region_id is null then area.big_area_name else region.big_area_name end as big_area_name--执行大区
    ,region.area_name--执行区域
    ,camp_type_name--活动类型
    ,exp_subj_name--末级科目
    ,function_type_name--职能分类
    ,exp_from_name--费用出处
    ,dep_name--部门
    ,dealer_id as integration_id
    ,dealer.dealer_name as dealer_name
    ,case when dealer.is_direct = '非直营' then 0 else 1 end AS is_direct
    ,fin_process_cat
    ,system_name
    ,sum(zxje - jacx - yjacx - bkyzfjacx - kyjacx - yjasjacx) sales_cost--销售部费用
FROM (
    SELECT division_name
        ,a.month_code
        ,exe_area_id--执行大区ID
        ,exe_region_id
        ,camp_type_name
        ,exp_subj_name
        ,function_type_name
        ,exp_from_name
        ,dep_name
        ,fin_process_cat
        ,system_name
        ,coalesce(accnt_id,'缺省') dealer_id
        ,coalesce(accnt_name,'缺省') dealer_name
        ,case
             when substr(a.month_code,6,2)='01' then nvl(jan_implement_amt,'0')
             when substr(a.month_code,6,2)='02' then nvl(feb_implement_amt,'0')
             when substr(a.month_code,6,2)='03' then nvl(mar_implement_amt,'0')
             when substr(a.month_code,6,2)='04' then nvl(apr_implement_amt,'0')
             when substr(a.month_code,6,2)='05' then nvl(may_implement_amt,'0')
             when substr(a.month_code,6,2)='06' then nvl(june_implement_amt,'0')
             when substr(a.month_code,6,2)='07' then nvl(july_implement_amt,'0')
             when substr(a.month_code,6,2)='08' then nvl(aug_implement_amt,'0')
             when substr(a.month_code,6,2)='09' then nvl(sept_implement_amt,'0')
             when substr(a.month_code,6,2)='10' then nvl(oct_implement_amt,'0')
             when substr(a.month_code,6,2)='11' then nvl(nov_implement_amt,0)
             when substr(a.month_code,6,2)='12' then nvl(dec_implement_amt,'0')
        end zxje
        ,'0' jacx
        ,'0' yjacx
        ,'0' bkyzfjacx
        ,'0' kyjacx
        ,'0' yjasjacx
        ,'0' xzj
    FROM (
        SELECT month_code
            ,year_code
        FROM bigdata_dw.w_date_d
        WHERE lower(dt_type) = 'm'
            AND month_code >= '2018-11'
            AND month_code <= date_format(CURRENT_DATE, 'yyyy-MM')
        ) a
    LEFT JOIN bigdata_dw.fact_tpm_cost_sale_base b ON a.year_code = substr(nvl(b.rep_month, '8888-88'), 1, 4)
    WHERE b.data_type_name = '执行'
        AND b.rep_month <= a.month_code

    UNION ALL

    SELECT division_name
        ,rep_month
        ,exe_area_id--执行大区ID
        ,exe_region_id
        ,camp_type_name
        ,exp_subj_name
        ,function_type_name
        ,exp_from_name
        ,dep_name
        ,fin_process_cat
        ,system_name
        ,coalesce(accnt_id,'缺省') dealer_id
        ,coalesce(accnt_name,'缺省') dealer_name
        ,'0' zxje
        ,case when b.data_type_name='结案差异' then b.amt else '0' end jacx--结案差异金额
        ,case when b.data_type_name='预结案差异' then b.amt else '0' end yjacx--预结案差异金额
        ,case when b.data_type_name='支付差异-不可用' then b.amt else '0' end bkyzfjacx--不可用支付差异金额
        ,case when b.data_type_name='支付差异-可用' then b.amt else '0' end kyjacx--结案差异金额
        ,case when b.data_type_name='预结案实结案差异' then b.amt else '0' end yjasjacx--结案差异金额
        ,case when fin_process_mode in('折价','随车') then b.amt else '0' end xzj--需折价费用
        --,case when fin_process_cat = '折价' then b.amt else '0' end xzj--需折价费用
    FROM sdata_full.tpm_cx_xx_rep_base b
    WHERE nvl(b.rep_month,'1888-08')>='2018-11' and
        b.data_type_name in('执行','结案差异','预结案差异','支付差异-不可用','支付差异-可用','预结案实结案差异')
    ) t
INNER JOIN bigdata_dw.w_bg_d bg ON division_name = bg.bg_name and bg.row_wid = 7
LEFT JOIN bigdata_dw.dm_tpm_area_d region on t.exe_region_id = region.tpm_region_id and region.div_type = 'region'
LEFT JOIN bigdata_dw.dm_tpm_area_d area on t.exe_area_id = area.tpm_region_id and area.div_type = 'area'
LEFT JOIN bigdata_dw.dm_tpm_dealer_d  dealer ON dealer.tpm_dealer_id = t.dealer_id
GROUP BY month_code
    ,bg.row_wid
    ,division_name
    ,area.big_area_name
    ,region.big_area_name
    ,region.area_name
    ,t.exe_region_id
    ,camp_type_name
    ,exp_subj_name
    ,function_type_name
    ,exp_from_name
    ,dep_name
    ,t.dealer_id
    ,dealer.dealer_name
    ,dealer.is_direct
    ,fin_process_cat
    ,system_name;

drop table bigdata_dw.tmp_fact_tpm_close_case_f;

create table bigdata_dw.tmp_fact_tpm_close_case_f as 
select diff.rep_month,
       coalesce(camp_type_name,'缺省') camp_type_name,
       coalesce(camp_type_cd,'缺省') camp_type_cd,
       coalesce(division_name,'缺省') division_name,
       coalesce(division_id,'缺省') division_id,
       coalesce(camp_num,'缺省') camp_num,
       coalesce(camp_name,'缺省') camp_name,
       coalesce(sales_area_name,'缺省') sales_area_name,
       coalesce(sales_region_name,'缺省') sales_region_name,
       coalesce(case when exe_region_id is null then area.big_area_name else region.big_area_name end,'缺省') as big_area_name,--执行大区
       coalesce(region.area_name,'缺省') as area_name,--执行区域
       coalesce(accnt_id,'缺省') accnt_id,
       coalesce(accnt_name,'缺省') accnt_name,
       dealer_type as dealer_type,
       coalesce(function_type_name,'缺省') function_type_name,
       coalesce(function_type_cd,'缺省') function_type_cd,
       coalesce(exp_from_name,'缺省') exp_from_name,
       coalesce(exp_from_cd,'缺省') exp_from_cd,
       coalesce(exp_subj_name,'缺省') exp_subj_name,
       coalesce(exp_subj_id,'缺省') exp_subj_id,
       coalesce(fin_process_mode,'缺省') fin_process_mode,
       coalesce(channel_type_name,'缺省') channel_type_name,
       coalesce(system_name,'缺省') system_name,
       data_type_name,
       amt,
       apply_bud_num,
       apply_num,
       reduce_bud_flg,
       --diff.exe_area_name,
       --diff.exe_region_name,
       --diff.dealer_name,
       --diff.dealer_id,
       diff.start_dt,
       diff.end_dt,
       diff.plan_clo_date,
       diff.created,
       diff.act_clo_flg
       from sdata_full.tpm_cx_xx_rep_base diff
        left join bigdata_dw.dm_tpm_dealer_d  dealer ON dealer.tpm_dealer_id = diff.accnt_id
        left join bigdata_dw.dm_tpm_area_d region on diff.exe_region_id = region.tpm_region_id and region.div_type = 'region'
        left join bigdata_dw.dm_tpm_area_d area on diff.exe_area_id = area.tpm_region_id and area.div_type = 'area'
 --where diff.data_type_name in ('执行', '结案差异', '结案')
 where rep_month >= '2018-11' and division_name in('液态奶事业部','冷饮事业部');
-----
insert into table bigdata_dw.tmp_fact_tpm_close_case_f  
select diff.rep_month,
       coalesce(camp_type_name,'缺省') camp_type_name,
       coalesce(camp_type_cd,'缺省') camp_type_cd,
       coalesce(division_name,'缺省') division_name,
       coalesce(division_id,'缺省') division_id,
       coalesce(camp_num,'缺省') camp_num,
       coalesce(camp_name,'缺省') camp_name,
       coalesce(sales_area_name,'缺省') sales_area_name,
       coalesce(sales_region_name,'缺省') sales_region_name,
       coalesce(case when sales_region_id is null then area.big_area_name else region.big_area_name end,'缺省') as big_area_name,--执行大区
       coalesce(region.area_name,'缺省') as area_name,--执行区域
       coalesce(accnt_id,'缺省') accnt_id,
       coalesce(accnt_name,'缺省') accnt_name,
       dealer_type as dealer_type,
       coalesce(function_type_name,'缺省') function_type_name,
       coalesce(function_type_cd,'缺省') function_type_cd,
       coalesce(exp_from_name,'缺省') exp_from_name,
       coalesce(exp_from_cd,'缺省') exp_from_cd,
       coalesce(exp_subj_name,'缺省') exp_subj_name,
       coalesce(exp_subj_id,'缺省') exp_subj_id,
       coalesce(fin_process_mode,'缺省') fin_process_mode,
       coalesce(channel_type_name,'缺省') channel_type_name,
       coalesce(system_name,'缺省') system_name,
       data_type_name,
       amt,
       apply_bud_num,
       apply_num,
       reduce_bud_flg,
       --diff.exe_area_name,
       --diff.exe_region_name,
       --diff.dealer_name,
       --diff.dealer_id,
       diff.start_dt,
       diff.end_dt,
       diff.plan_clo_date,
       diff.created,
       diff.act_clo_flg
       from sdata_full.tpm_cx_xx_rep_base diff
        left join bigdata_dw.dm_tpm_dealer_d  dealer ON dealer.tpm_dealer_id = diff.accnt_id
        left join bigdata_dw.dm_tpm_area_d region on diff.sales_region_id = region.tpm_region_id and region.div_type = 'region'
        left join bigdata_dw.dm_tpm_area_d area on diff.sales_area_id = area.tpm_region_id and area.div_type = 'area'
 --where diff.data_type_name in ('执行', '结案差异', '结案')
 where rep_month >= '2018-11' and division_name in('奶粉事业部','酸奶事业部','健康饮品事业部');
 
--是否完全结案 
 drop table bigdata_dw.fact_tpm_isall_clo;
 create table bigdata_dw.fact_tpm_isall_clo as 
 select distinct coalesce(t1.apply_bud_num, t1.apply_num) apply_num, t1.act_clo_flg
    from bigdata_dw.tmp_fact_tpm_close_case_f t1
    --from sdata_full.tpm_cx_xx_rep_base t1
     where t1.data_type_name = '结案'
     and t1.act_clo_flg = '是';
     

--应结案时间     
drop table bigdata_dw.fact_tpm_plan_clo_date;
create table bigdata_dw.fact_tpm_plan_clo_date as 
     select apply_num, coalesce(substr(plan_clo_date,1,10),cast(date_add(current_date,1000) as string)) as plan_clo_dt
  from (select coalesce(t1.apply_bud_num, t1.apply_num) apply_num,
               t1.plan_clo_date,
               row_number() over(partition by coalesce(t1.apply_bud_num, t1.apply_num) order by t1.created desc) r
          from bigdata_dw.tmp_fact_tpm_close_case_f t1
           where t1.data_type_name = '执行') tmp1
 where r = 1;
 
--实际结案时间     
drop table bigdata_dw.fact_tpm_act_clo_date;
create table bigdata_dw.fact_tpm_act_clo_date as 
     select  substr(max(a.act_closeout_dt),1,10) act_closeout_dt,a.camp_num from sdata_full.tpm_cx_camp a group by camp_num;

insert overwrite table bigdata_dw.fact_tpm_close_case_f partition(bg_wid,date_)
SELECT bg.row_wid as bu_wid
    ,0 as date_wid
    ,0 as area_wid
    ,0 as dealer_wid
    ,0 as channel_wid
    ,0 as active_type_wid
    ,0 as account_wid
    ,0 as source_wid
    ,camp_type_name as camp_type_name
    ,camp_type_cd as camp_type_cd
    ,diff.big_area_name as area_name
    ,diff.area_name as region_name
    ,accnt_name as dealer_name
    ,accnt_id as dealer_id
    ,dealer_type as dealer_type
    ,diff.camp_num as camp_num
    ,diff.camp_name as camp_name
    ,start_dt as start_dt
    ,end_dt as end_dt
    ,case when bg.row_wid = 1 and function_type_name in('巴氏奶推广','巴氏奶运营') then '巴氏奶'
          when bg.row_wid = 1 and function_type_name in('行销推广','行销运营','督导') then '行销'
          else function_type_name end as function_type_name
    ,function_type_cd as function_type_cd
    ,exp_subj_name as exp_subj_name
    ,exp_subj_id as exp_subj_id
    ,division_name as bu_name
    --,diff.rep_month as bug_month
    ,regexp_replace(diff.rep_month,'-','') as bug_month
    ,case when (bg.row_wid in(2,5,7) and exp_from_name like '市场部%') 
          or (bg.row_wid = 1 and exp_from_name in ('市场部Joyday推广组','市场部重客推广组','整合行销部推广组基础费用','整合行销部推广组每益添费用',
                                                '整合行销部推广组畅轻费用',
                                                '市场部畅轻推广组',
                                                '整合行销部推广组JOYDAY费用',
                                                '市场部基础推广组',
                                                '市场部每益添推广组'))  then '市场部费用'
          when (bg.row_wid in(2,5,7) and exp_from_name like '销售部%') 
          or (bg.row_wid = 1 and exp_from_name in ('销售部行销组',
                                                '销售部电商组',
                                                '销售部重客组',
                                                '销售部沃尔玛组',
                                                '销售部特渠组',
                                                '销售部集团重客基金费用',
                                                '酸奶事业部销售部巴氏奶组',
                                                '酸奶事业部销售部电商组')) then '销售部费用'
          when bg.row_wid = 1 and exp_from_name in('销售大区','销售区域') then '大区费用'                                       
          when exp_from_name is null or exp_from_name = '' then '缺省'
          else exp_from_name end as exp_from_name
    ,exp_from_cd as exp_from_cd
    ,fin_process_mode as fin_process_mode
    ,system_name as system_name
    ,channel_type_name as channel_type
    ,case when (data_type_name = '结案' and t6.plan_clo_dt > t7.act_closeout_dt) or (data_type_name <> '结案' and t6.plan_clo_dt >= current_date) then 0 else 1 end as is_overdue
    ,sum(case when (data_type_name = '结案' and t6.plan_clo_dt > t7.act_closeout_dt) or (data_type_name <> '结案' and t6.plan_clo_dt >= current_date) then coalesce(diff.amt,0) else 0 end) as due_amt
    ,sum(case when data_type_name in ('执行','方案/签呈') and diff.reduce_bud_flg = '是' then coalesce(diff.amt,0) else 0 end) as approve_amt
    ,sum(case when data_type_name = '结案' then coalesce(diff.amt,0) else 0 end) as close_amt
    ,sum(case when data_type_name = '结案差异' then coalesce(diff.amt,0) else 0 end) as diff_amt
    ,0.0 as sales_cost
    ,count(distinct diff.camp_num) as camp_cnt--总结案份数
    ,count(distinct case when t6.plan_clo_dt < current_date then null else diff.camp_num end) as camp_cnt_due--超期总结案份数
    ,current_date as insert_date
    ,bg.row_wid as bg_wid
    ,concat(regexp_replace(rep_month,'-',''),'01') as date_
from bigdata_dw.tmp_fact_tpm_close_case_f diff
 inner join bigdata_dw.w_bg_d bg on division_name = bg.bg_name
 left join bigdata_dw.fact_tpm_isall_clo t5
 on coalesce(diff.apply_bud_num, diff.apply_num) = t5.apply_num
 left join bigdata_dw.fact_tpm_plan_clo_date t6
 on coalesce(diff.apply_bud_num, diff.apply_num) = t6.apply_num
 left join bigdata_dw.fact_tpm_act_clo_date t7
 on diff.camp_num = t7.camp_num
 group by bg.row_wid,data_type_name
    ,t6.plan_clo_dt
    ,t7.act_closeout_dt
    ,camp_type_name
    ,camp_type_cd
    ,diff.big_area_name
    ,diff.area_name
    ,accnt_name
    ,accnt_id
    ,dealer_type
    ,diff.camp_num
    ,diff.camp_name
    ,start_dt
    ,end_dt
    ,function_type_name
    ,function_type_cd
    ,exp_subj_name
    ,exp_subj_id
    ,division_name
    ,diff.rep_month
    ,exp_from_name
    ,exp_from_cd
    ,fin_process_mode
    ,system_name
    ,channel_type_name;
insert into table bigdata_dw.fact_tpm_close_case_f partition(bg_wid,date_)
SELECT bg_wid as bu_wid
    ,0 as date_wid
    ,0 as area_wid
    ,0 as dealer_wid
    ,0 as channel_wid
    ,0 as active_type_wid
    ,0 as account_wid
    ,0 as source_wid
    ,camp_type_name as camp_type_name
    ,'缺省' as camp_type_cd
    ,nvl(big_area_name,'缺省') as area_name
    ,nvl(area_name,'缺省') as region_name
    ,dealer.dealer_name as dealer_name
    ,'缺省' as dealer_id
    ,dealer_type as dealer_type
    ,'缺省' as camp_num
    ,'缺省' as camp_name
    ,'缺省' as start_dt
    ,'缺省' as end_dt
    ,nvl(function_type_name,'缺省') as function_type_name
    ,'缺省' as function_type_cd
    ,nvl(exp_subj_name,'缺省') as exp_subj_name
    ,'缺省' as exp_subj_id
    ,bg_name as bu_name
    --,diff.rep_month as bug_month
    ,regexp_replace(bug_month,'-','') as bug_month
    ,exp_from_name as exp_from_name
    ,'缺省' as exp_from_cd
    ,'缺省' as fin_process_mode
    ,nvl(system_name,'缺省') as system_name
    ,'缺省' as channel_type
    ,0 as is_overdue
    ,0.0 as due_amt
    ,0.0 as approve_amt
    ,0.0 as close_amt
    ,0.0 as diff_amt
    ,sum(sales_cost) as sales_cost
    ,0 as camp_cnt--总结案份数
    ,0 as camp_cnt_due--超期总结案份数
    ,current_date insert_date
    ,bg_wid
    ,concat(regexp_replace(bug_month,'-',''),'01') as date_
from bigdata_dw.fact_tpm_close_case_f_tmp fact
left join bigdata_dw.dm_tpm_dealer_d dealer ON fact.integration_id = dealer.tpm_dealer_id
where bg_wid = 7
GROUP BY bg_wid
    ,camp_type_name
    ,exp_from_name
    ,big_area_name
    ,area_name
    ,dealer.dealer_name
    ,function_type_name
    ,exp_subj_name
    ,fact.bg_name
    ,bug_month
    ,system_name
    ,dealer_type;

