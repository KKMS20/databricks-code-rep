truncate table cc_mart_kumaranm.fact_creditcard ;
truncate table loans_mart_kumaranm.fact_high_value_loans;
truncate table payment_mart_kumaranm.fact_payments;
truncate table trans_mart_kumaranm.fact_transactions;
truncate table trans_mart_kumaranm.agg_branch_trans_summary;


truncate table edwdb_kumaranm.dim_branches;
truncate table edwdb_kumaranm.dim_loans;
truncate table edwdb_kumaranm.dim_employees;
truncate table edwdb_kumaranm.fact_loans;
truncate table edwdb_kumaranm.fact_loan_summary;


truncate table odsdb_kumaranm.ods_employees;
truncate table odsdb_kumaranm.ods_cust_profile;
truncate table odsdb_kumaranm.ods_branches;
truncate table odsdb_kumaranm.ods_loans;
truncate table odsdb_kumaranm.ods_payments;
truncate table odsdb_kumaranm.ods_transactions;
truncate table odsdb_kumaranm.ods_creditcard;
truncate table odsdb_kumaranm.ods_accounts;

truncate table stgdb_kumaranm.stg_employees;
truncate table stgdb_kumaranm.stg_cust_profile;
truncate table stgdb_kumaranm.stg_branches;
truncate table stgdb_kumaranm.stg_loans;
truncate table stgdb_kumaranm.stg_payments;
truncate table stgdb_kumaranm.stg_transactions;
truncate table stgdb_kumaranm.stg_creditcard;
truncate table stgdb_kumaranm.stg_accounts;