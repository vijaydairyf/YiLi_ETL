

DROP TABLE bigdata_dw.DM_TPM_DEALER_D;
CREATE TABLE bigdata_dw.dm_tpm_dealer_d AS
SELECT a.integration_id
    ,a.daler_name as dealer_name
    ,b.row_id AS tpm_dealer_id
    ,b.name AS tpm_dealer_name
    ,a.attribute1 as is_direct
    ,a.dealer_type2 as dealer_type
    ,bu.name AS bu_name
FROM bigdata_dw.w_dealer_d a
LEFT JOIN sdata_full.tpm_s_org_ext b ON a.integration_id = b.integration_id and b.cust_stat_cd = 'Active'
INNER JOIN sdata_full.tpm_s_org_ext bu ON b.x_divn_id = bu.row_id;


