
drop table bigdata_dw.dm_tpm_area_d;
create table bigdata_dw.dm_tpm_area_d as
select mdm.dept_name AS tpm_bu_name
    ,area.name AS tpm_area_name
    ,area.row_id AS tpm_area_id
    ,rg.name AS tpm_region_name
    ,rg.row_id AS tpm_region_id
    ,mdm.dept_name AS bu_name
    ,b.big_area_name
    ,case when max(b.area_name) = '新疆销售区域' then '新疆' 
          when max(b.area_name) = '港澳' then '广州' else max(b.area_name) end as area_name
    ,'region' AS div_type
    from
(SELECT DISTINCT dept_name
    ,regional_name
    ,area_name
    ,hr_org_id
FROM sdata_full.mdmn_mdm_sales_area mdm
WHERE mdm.hr_org_id IS NOT NULL
    AND lower(mdm.STATUS) = 'yy'
    AND dept_name IN
    ('健康饮品事业部',
     '冷饮事业部',
     '奶粉事业部',
     '酸奶事业部',
     '液态奶事业部')
union all
SELECT DISTINCT dept_name
    ,regional_name
    ,area_name
    ,hr_org_id
FROM sdata_full.mdmn_mdm_sales_area mdm
WHERE mdm.hr_org_id IS NOT NULL
    AND lower(mdm.STATUS) = 'ny' and area_name = '哈尔滨'
    AND dept_name IN
    ('健康饮品事业部')
) mdm
left join
(SELECT DISTINCT big_area_name
    ,area_name
FROM bigdata_dw.w_area_d)    b
on mdm.regional_name = b.big_area_name and mdm.area_name = b.area_name
LEFT JOIN sdata_full.tpm_s_org_ext rg ON mdm.hr_org_id = rg.integration_id
LEFT JOIN sdata_full.tpm_s_org_ext area ON rg.par_divn_id = area.row_id
LEFT JOIN sdata_full.tpm_s_org_ext bu ON rg.x_divn_id = bu.row_id
where mdm.dept_name in('冷饮事业部','奶粉事业部')
    or (mdm.dept_name = '酸奶事业部' and b.area_name <> '特渠' and b.big_area_name not in('酸奶上海直辖区域','酸奶华东大区') and area.name <> '液态奶事业部销售部晋冀蒙营销总部内蒙销售区域')
    or (mdm.dept_name = '液态奶事业部' and b.area_name <> '晋北')
    or (mdm.dept_name = '健康饮品事业部' and (b.big_area_name <> '北部' or (b.big_area_name = '北部' and b.area_name <> '重庆')))
    group by
    area.name
    ,area.row_id
    ,rg.name
    ,rg.row_id
    ,mdm.dept_name
    ,b.big_area_name;


insert into table bigdata_dw.dm_tpm_area_d
SELECT DISTINCT tpm_bu_name
    ,tpm_area_name
    ,tpm_area_id
    ,tpm_area_name
    ,tpm_area_id
    ,bu_name
    ,big_area_name
    ,big_area_name
    ,'area' as div_type
FROM bigdata_dw.dm_tpm_area_d a
WHERE tpm_region_id is not null  and big_area_name <> '销售部电商';

insert into table bigdata_dw.dm_tpm_area_d
select * from
bigdata_dw.dm_tpm_area_d_manual;

insert overwrite table bigdata_dw.dm_tpm_area_d
select
tpm_bu_name,
tpm_area_name,
tpm_area_id,
tpm_region_name,
tpm_region_id,
bu_name,
case when big_area_name='销售部软冰业务' and area_name='销售部软冰业务' then '冷饮事业部销售大区' else big_area_name end,
case when big_area_name='销售部软冰业务' and area_name='销售部软冰业务' then '缺省' else area_name end,
div_type
from bigdata_dw.dm_tpm_area_d ;

insert into table bigdata_dw.dm_tpm_area_d               
select tpm_bu_name,tpm_area_name,tpm_area_id,tpm_region_name,
tpm_region_id,bu_name,big_area_name,area_name,'region' from bigdata_dw.dm_tpm_area_d where div_type = 'area';

insert overwrite table bigdata_dw.dm_tpm_area_d
select * from bigdata_dw.dm_tpm_area_d where 
(tpm_region_id not in('1-5A3E','1-5A86','1-5AK3','1-5AJ5'))
 or 
(tpm_region_id in('1-5A3E','1-5A86','1-5AK3','1-5AJ5') and big_area_name <> '销售部电商');







