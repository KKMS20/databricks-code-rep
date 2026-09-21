# ODS loads from staging with exact copy
# ODS Load from Staging with load_dt and load_ts

#IS QUERY (ETL), TRANSFORMATION - SCRUBBING, STANDARDIZATION, cleansing (filteration/de-duplication), Enrichment
INSERT INTO odsdb_kumaranm.ods_accounts
SELECT distinct #De-duplication/filtering
AccountID,
trim(AccountType), #scrubbing
Balance,CreditScore,
upper(Currency), #standardization
CustomerID,DateOpened,ManagerID,ODLimit,
CURRENT_DATE AS load_dt, #Enrichment
CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_accounts
where (AccountID is not null or AccountID<>''); #filtering
       
INSERT INTO odsdb_kumaranm.ods_transactions
SELECT distinct t.*, 
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_transactions t;

INSERT INTO odsdb_kumaranm.ods_payments
SELECT distinct p.*, 
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_payments p;

INSERT INTO odsdb_kumaranm.ods_creditcard
SELECT distinct c.*, 
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_creditcard c;

INSERT INTO odsdb_kumaranm.ods_loans
SELECT distinct l.*, 
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_loans l;

INSERT INTO odsdb_kumaranm.ods_cust_profile
SELECT distinct Address,
    BranchID,
    CustomerID,
    DateOfBirth,
    Email,
    trim(FirstName),
    trim(LastName),
    substr(PhoneNumber,1,20), 
    CURRENT_DATE AS load_dt, 
    CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_cust_profile cp;

INSERT INTO odsdb_kumaranm.ods_branches
SELECT distinct b.*, 
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_branches b;

INSERT INTO odsdb_kumaranm.ods_employees
SELECT distinct e.*, 
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM stgdb_kumaranm.stg_employees e;