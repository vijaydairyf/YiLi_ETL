insert overwrite table bigdata_dm.fact_tpm_cost_anay_ka_f partition(bg_wid,date_)
SELECT
    bg_wid
    ,0 as date_wid
    ,0 as area_wid
    ,0 as dealer_wid
    ,0 as channel_wid
    ,0 as active_type_wid
    ,0 as account_wid
    ,bg_name
    ,'' as dep_name
    ,bug_month
    ,'' as function_type_name
    ,'' as function_type_cd
    ,area_name
    ,region_name
    ,'' as city_group
    ,'' as channel_type
    ,'' as exp_subj_name
    ,'' as exp_subj_id
    ,camp_type_name
    ,exp_from_name
    ,'' as camp_type_cd
    ,'' as dealer_name
    ,'' as dealer_id
    ,'' as dealer_level
    ,0 as is_direct
    ,system_name
    ,value as before_disc_amt
    ,value_ly as before_disc_amt_ly
    ,0 as after_disc_amt
    ,sales_cost
    ,sales_cost_ly
    ,0 as sales_cost_lm
    ,0 as cost_budget_year
    ,value_ytd as before_disc_amt_ytd
    ,value_ytd_ly as before_disc_amt_ly_ytd
    ,0 as after_disc_amt_ytd
    ,sales_cost_ytd
    ,sales_cost_ly_ytd
    ,0 as cost_budget_year_ytd
    ,0 as task_amt_before
    ,0 as task_amt_before_ytd
    ,0 as task_amt_after
    ,0 as task_amt_after_ytd
    ,0 as budget_amt_before
    ,0 as budget_amt_before_ytd
    ,0 as before_disc_amt_lm
    ,0 as cost_budget_year_ly
    ,0 as cost_budget_year_ly_ytd
    ,0 as task_amt_before_ly
    ,0 as task_amt_before_ly_ytd
    ,0 as sales_cost_lly
    ,0 as cost_budget_year_lm
    ,0 as re_attribute1
    ,0 as re_attribute2
    ,0 as re_attribute3
    ,0 as re_attribute4
    ,0 as re_attribute5
    ,value_tax as re_attribute6
    ,value_ytd_tax as re_attribute7
    ,value_ly_tax as re_attribute8
    ,value_ytd_ly_tax as re_attribute9
    ,0 as re_attribute10
    ,0 as re_attribute11
    ,0 as re_attribute12
    ,0 as re_attribute13
    ,0 as re_attribute14
    ,0 as re_attribute15
    ,0 as re_attribute16
    ,0 as re_attribute17
    ,0 as re_attribute18
    ,0 as re_attribute19
    ,0 as re_attribute20
    ,0 as re_attribute21
    ,0 as re_attribute22
    ,0 as re_attribute23
    ,0 as re_attribute24
    ,current_date as insert_date
    ,bg_wid
    ,concat_ws('',cast(bug_month as string),'01')
FROM (
    SELECT bg_name
        ,bg_wid
        ,bug_month
        ,area_name
        ,region_name
        ,mapping.system_name
        ,exp_from_name
        ,camp_type_name
        ,sum(sales_cost) as sales_cost
        ,sum(sales_cost_ly) as sales_cost_ly
        ,sum(sales_cost_ytd) as sales_cost_ytd
        ,sum(sales_cost_ly_ytd) as sales_cost_ly_ytd
        ,0.0 as value
        ,0.0 as value_ytd
        ,0.0 as value_ly
        ,0.0 as value_ytd_ly            
        ,0.0 as value_tax
        ,0.0 as value_ytd_tax
        ,0.0 as value_ly_tax
        ,0.0 as value_ytd_ly_tax
    FROM bigdata_dm.fact_tpm_cost_anay_ka_mapping mapping
    left join bigdata_dm.fact_tpm_cost_anay_f fact
    on mapping.bg_name = fact.bu_name and mapping.system_name = fact.system_name
    WHERE bg_wid IN (1,2) --AND bug_month = 201907
    GROUP BY
        bg_name
        ,bg_wid
        ,bug_month
        ,area_name
        ,region_name
        ,mapping.system_name
        ,exp_from_name
        ,camp_type_name
        union all
        SELECT bg_name
            ,case when biz = '奶粉事业部' then 2 when biz = '酸奶事业部' then 1 end as bg_wid
            ,cast(month_desc as bigint) as bug_month
            ,region
            ,area
            ,system_name
            ,'缺省' as exp_from_name
            ,'缺省' as camp_type_name
            ,0.0 as sales_cost
            ,0.0 as sales_cost_ly
            ,0.0 as sales_cost_ytd
            ,0.0 as sales_cost_ly_ytd
            ,sum(case when biz != '酸奶事业部' then value else case when biz = '酸奶事业部' and prod_gp_lv1_desc  = '低温牛奶' AND prod_gp_lv3_desc = '小白袋' then value/1.09 else value/1.13 end end ) value
            ,sum(case when biz != '酸奶事业部' then value_ytd else case when biz = '酸奶事业部' and prod_gp_lv1_desc  = '低温牛奶' AND prod_gp_lv3_desc = '小白袋' then value_ytd/1.09 else value_ytd/1.13 end end ) value_ytd
            ,sum(case when biz != '酸奶事业部' then value_ly else case when biz = '酸奶事业部' and prod_gp_lv1_desc  = '低温牛奶' AND prod_gp_lv3_desc = '小白袋' then value_ly/1.09 else value_ly/1.13 end end ) value_ly
            ,sum(case when biz != '酸奶事业部' then value_ytd_ly else case when biz = '酸奶事业部' and prod_gp_lv1_desc  = '低温牛奶' AND prod_gp_lv3_desc = '小白袋' then value_ytd_ly/1.09 else value_ytd_ly/1.13 end end ) value_ytd_ly
            ,sum(value) as value_tax
            ,sum(value_ytd) as value_ytd_tax
            ,sum(value_ly) as value_ly_tax
            ,sum(value_ytd_ly) as value_ytd_ly_tax
        FROM bigdata_dm.fact_tpm_cost_anay_ka_mapping mapping
    left join dm.fact_ka_sale_pos_plan_biz fact
    on mapping.bg_name = fact.biz and mapping.system_name = fact.ka_name
where biz in( '奶粉事业部','酸奶事业部')
and area is not null and  ka_focus_flag in ('是')
-- and month_desc = '201907' and region = '酸奶苏皖大区' and area = '鄂东'
        GROUP BY bg_name
            ,case when biz = '奶粉事业部' then 2 when biz = '酸奶事业部' then 1 end
            ,month_desc
            ,region
            ,area
            ,system_name
        ) sales;
