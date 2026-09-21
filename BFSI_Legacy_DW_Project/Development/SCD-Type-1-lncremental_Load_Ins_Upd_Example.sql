select count(*) from odsdb_kumaranm.ods_loans
select count(*) from edwdb_kumaranm.dim_loans

select * from odsdb_kumaranm.ods_loans where loanid in (1001066376183, 9001066376183) order by loanid
select * from edwdb_kumaranm.dim_loans where loanid in (1001066376183, 9001066376183)


select * from odsdb_kumaranm.ods_loans where loanid=1001066376183
select * from odsdb_kumaranm.ods_loans where loanid=9001066376183

select * from odsdb_kumaranm.ods_loans where load_ts >= '2026-09-10 17:14:00'


desc odsdb_kumaranm.ods_loans

## insert exising load id 1001066376183 and update the Collateral as 'House & Land' from 'House'
insert into odsdb_kumaranm.ods_loans
select 
Amount, 'House & Land' as Collateral, CustomerID, EndDate, InterestRate, LoanID, LoanType, PaymentFrequency, StartDate, Status,
current_date load_dt,
current_timestamp load_ts
from odsdb_kumaranm.ods_loans where loanid in (1001066376183) and collateral ='house'



## insert new record loan id  9001066376183 same as existin loan id 1001066376183  with different Amount, Collateral
insert into odsdb_kumaranm.ods_loans
select 
100000 as Amount, 'House & Land' as Collateral, CustomerID, EndDate, InterestRate, 9001066376183 as LoanID, LoanType, PaymentFrequency, StartDate, Status,
current_date load_dt,
current_timestamp load_ts
from odsdb_kumaranm.ods_loans where loanid in (1001066376183) and collateral ='house'


##SCD-Type-1 Incremental Load -Insert
insert into edwdb_kumaranm.dim_loans
select s.* from odsdb_kumaranm.ods_loans s
left join edwdb_kumaranm.dim_loans t
on s.loanid = t.loanid
where t.loanid is NULL and s.load_dt >= '2026-09-10'

##SCD-Type-1 Incremental Load -Update
SET SQL_SAFE_UPDATES = 0;
update edwdb_kumaranm.dim_loans t
#SELECT t.*, s.* FROM edwdb_kumaranm.dim_loans t
join odsdb_kumaranm.ods_loans s
on t.loanid = s.loanid
set t.amount = s.amount,
t.collateral = s.collateral,
t.customerid = s.customerid,
t.enddate = s.enddate,
t.interestrate = s.interestrate,
t.loantype = s.loantype,
t.paymentfrequency = s.paymentfrequency,
t.startdate = s.startdate,
t.status = s.status,
t.load_dt = CURRENT_DATE,
t.load_ts = CURRENT_TIMESTAMP
where ( t.amount <> s.amount or
t.collateral <> s.collateral or
t.customerid <> s.customerid or
t.enddate <> s.enddate or
t.interestrate <> s.interestrate or
t.loantype <> s.loantype or
t.paymentfrequency <> s.paymentfrequency or
t.startdate <> s.startdate or
t.status <> s.status) and s.load_dt >= '2026-09-10'


/*insert into odsdb_kumaranm.ods_loans
select 
99517.87 as Amount, 'house' as Collateral, CustomerID, EndDate, InterestRate,  1001066376183 as LoanID, LoanType, PaymentFrequency, StartDate, Status,
current_date load_dt,
current_timestamp load_ts
from odsdb_kumaranm.ods_loans where loanid in (9001066376183) 


SET SQL_SAFE_UPDATES = 0;
delete from odsdb_kumaranm.ods_loans where loanid in (9001066376183) and load_ts >'2026-09-11 07:17:16'

select * from odsdb_kumaranm.ods_loans where loanid in (9001066376183)*/