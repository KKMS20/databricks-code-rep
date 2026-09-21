# Exploration
select distinct length(accounttype),accounttype
from stgdb_kumaranm.stg_accounts;

# CTAS - Rejection strategy (Target table is not present)
create table stgdb_kumaranm.stg_accounts_reject as
select * from stgdb_kumaranm.stg_accounts where accountid is null or accountid ='';
select * from stgdb_kumaranm.stg_accounts_reject;

# IS Query - Rejection strategy (Target table is already present)
Insert into stgdb_kumaranm.stg_accounts_reject
Select * from stgdb_kumaranm.stg_accounts
where accountid is null or accountid ='';