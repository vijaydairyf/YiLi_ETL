
drop table bigdata_dw.fact_tpm_budget_anay_f_tmp;

create table bigdata_dw.fact_tpm_budget_anay_f_tmp as
--已经签批金额

select bg.row_wid as bg_wid
        ,exp_from_name
        ,exp_from_cd
        ,'缺省' as bug_org
        ,'缺省' as bug_org_two
        ,division_name as bu_name
        ,regexp_replace(rep_month, '-', '') as bug_month--备档月份
        ,case when sales_region_id is null then area.big_area_name else region.big_area_name end as area_name--执行大区
        ,nvl(region.area_name,t4.name) as region_name
        --,region.area_name as region_name--执行区域
        ,exp_subj_id as exp_subj_id
        ,t3.shot_name as exp_subj_name--末级科目
        ,camp_type_name
        ,camp_type_cd
        ,function_type_name
        ,function_type_cd
        ,fin_process_cat
        ,0.0 as int_budget_amt--月度初始预算
        ,0.0 as fin_budget_amt--月度最终预算
        ,0.0 as adj_budget_amt  --本月调整预算金额
        ,0.0 as rel_budget_amt--差异释放预算金额
        ,cast(amt as decimal(38,10)) as approve_amt
        ,0.0 as sub_no_appr_amt--在途申请金额  （已提交未签批金额）
from sdata_full.tpm_cx_xx_rep_base t
inner join bigdata_dw.w_bg_d bg on division_name = bg.bg_name
left join bigdata_dw.dm_tpm_area_d region on nvl(t.sales_region_id,t.sales_area_id) = region.tpm_region_id and region.div_type = 'region'
left join bigdata_dw.dm_tpm_area_d area on t.sales_area_id = area.tpm_region_id and area.div_type = 'area'
left join sdata_full.tpm_s_org_ext T4 ON t.sales_region_id = T4.ROW_ID
left outer join sdata_full.tpm_cx_exp_subject t3 on t.exp_subj_id = t3.row_id
where bg.row_wid in(1,2,6) and t.reduce_bud_flg = '是'
   and t.data_type_name in ('执行','方案/签呈')
   and t.rep_month>='2018-11'
union all
select bg.row_wid as bg_wid
        ,exp_from_name
        ,exp_from_cd
        ,'缺省' as bug_org
        ,'缺省' as bug_org_two
        ,division_name as bu_name
        ,regexp_replace(rep_month, '-', '') as bug_month--备档月份
        ,case when exe_region_id is null then area.big_area_name else region.big_area_name end as area_name--执行大区
        ,nvl(region.area_name,t4.name) as region_name
        --,region.area_name as region_name--执行区域
        ,exp_subj_id as exp_subj_id
        ,t3.shot_name as exp_subj_name--末级科目
        ,camp_type_name
        ,camp_type_cd
        ,function_type_name
        ,function_type_cd
        ,fin_process_cat
        ,0.0 as int_budget_amt--月度初始预算
        ,0.0 as fin_budget_amt--月度最终预算
        ,0.0 as adj_budget_amt  --本月调整预算金额
        ,0.0 as rel_budget_amt--差异释放预算金额
        ,cast(amt as decimal(38,10)) as approve_amt
        ,0.0 as sub_no_appr_amt--在途申请金额  （已提交未签批金额）
from sdata_full.tpm_cx_xx_rep_base t
inner join bigdata_dw.w_bg_d bg on division_name = bg.bg_name
left join bigdata_dw.dm_tpm_area_d region on nvl(t.exe_region_id,t.exe_area_id) = region.tpm_region_id and region.div_type = 'region'
left join bigdata_dw.dm_tpm_area_d area on t.exe_area_id = area.tpm_region_id and area.div_type = 'area'
left join sdata_full.tpm_s_org_ext T4 ON t.exe_region_id = T4.ROW_ID
left outer join sdata_full.tpm_cx_exp_subject t3 on t.exp_subj_id = t3.row_id
where bg.row_wid in(5,7) and t.reduce_bud_flg = '是'
   and t.data_type_name in ('执行','方案/签呈')
   and t.rep_month>='2018-11'
union all
--其他金额
select bg.row_wid as bg_wid
        ,'缺省' as exp_from_name
        ,'缺省' as exp_from_cd
        ,'缺省' as bug_org
        ,'缺省' as bug_org_two
        ,bg.bg_name as bu_name
        ,regexp_replace(t4.name, '-', '') as bug_month--备档月份
        ,area.big_area_name as area_name--执行大区
        --,area.tpm_area_id as area_id
        ,case when area.div_type = 'area' then area.big_area_name else area.area_name end as region_name--执行区域
        --,case when area.div_type = 'area' then '缺省' else area.tpm_region_id end as region_id
        ,exp_subj_id as exp_subj_id
        ,t5.shot_name as exp_subj_name--末级科目
        ,'缺省' as camp_type_name
        ,'缺省' as camp_type_cd
        ,'缺省' as function_type_name
        ,'缺省' as function_type_cd
        ,'缺省' as fin_process_cat
        ,cast(t2.mon_init_amt as decimal(38,10)) as int_budget_amt--月度初始预算
        ,cast(t2.mon_amt as decimal(38,10)) as fin_budget_amt--月度最终预算
        ,cast(t2.mon_amt - t2.mon_init_amt - t2.red_adj_amt as decimal(38,10)) as adj_budget_amt  --本月调整预算金额
        ,cast(red_adj_amt as decimal(38,10)) as rel_budget_amt--差异释放预算金额
        ,0.0 as approve_amt
        ,cast(t2.camp_transit_amt as decimal(38,10)) as sub_no_appr_amt--在途申请金额  （已提交未签批金额）
  from sdata_full.tpm_cx_mon_bud_ln t1
    inner join sdata_full.tpm_tpm_mv_mbd_ln_amt_ly t2
    on t1.row_id = t2.budget_id
    inner join sdata_full.tpm_cx_month_budget t3
    on t1.month_budget_id = t3.row_id
    inner join sdata_full.tpm_s_period t4
    on t3.month_period_id = t4.row_id
    left outer join sdata_full.tpm_cx_exp_subject t5
    on t1.exp_subj_id = t5.row_id
    left join bigdata_dw.dm_tpm_area_d area
    on t1.org_id = area.tpm_region_id
    --left join sdata_full.tpm_s_org_ext s_org 
    --ON t1.org_id = s_org.ROW_ID
    inner join bigdata_dw.w_bg_d bg
    on bg.bg_name = area.tpm_bu_name
    where t4.name>='2018-11';
    
insert overwrite table bigdata_dw.fact_tpm_budget_anay_f_tmp
select 
bg_wid,
exp_from_name,
exp_from_cd,
bug_org,
bug_org_two,
bu_name,
bug_month,
area_name,
case when bg_wid =7 and area_name is null then '销售部软冰业务' else region_name end as region_name,
--nvl(region_name,area_name) as region_name,
exp_subj_id,
exp_subj_name,
camp_type_name,
camp_type_cd,
function_type_name,
function_type_cd,
fin_process_cat,
int_budget_amt,
fin_budget_amt,
adj_budget_amt,
rel_budget_amt,
approve_amt,
sub_no_appr_amt
from bigdata_dw.fact_tpm_budget_anay_f_tmp where area_name is not null or bg_wid = 7;
;


