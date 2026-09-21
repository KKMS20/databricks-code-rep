# SCD Type-1- History is not maintained 

select *from edwdb_kumaranm.dim_customers where customerid in (443008, 100000)
select count(*)from edwdb_kumaranm.dim_customers  
select count(*) from odsdb_kumaranm.ods_cust_profile where customerid in (443008, 100000)
select *from stgdb_kumaranm.stg_cust_profile where customerid in (443008, 100000)


SET SQL_SAFE_UPDATES = 0;
update  odsdb_kumaranm.ods_cust_profile set address='101 Castle point blvd, NJ 62812' where customerid=443008;

insert into odsdb_kumaranm.ods_cust_profile (customerid, FirstName, Address) values
(100000, 'Irfan', '139, Velacherry, Chennai-600042')

truncate table edwdb_kumaranm.dim_customers;
INSERT INTO edwdb_kumaranm.dim_customers (
    CustomerID,
    FirstName,
    LastName,
    Email,
    PhoneNumber,
    Address,
    DateOfBirth,
    BranchID,
    effective_date
)
SELECT DISTINCT
    CustomerID,
    FirstName,
    LastName,
    Email,
    PhoneNumber,
    Address,
    DateOfBirth,
    BranchID,
    CURRENT_DATE
FROM odsdb_kumaranm.ods_cust_profile;

select *from edwdb_kumaranm.dim_customers where customerid in (443008, 100000)