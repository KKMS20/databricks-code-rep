select count(*) from odsdb_kumaranm.ods_employees
select count(*) from edwdb_kumaranm.dim_employees

select * from odsdb_kumaranm.ods_employees order by employeeid

select * from odsdb_kumaranm.ods_employees where employeeid= 2000

select * from edwdb_kumaranm.dim_employees where employeeid= 2000

insert into odsdb_kumaranm.ods_employees
SELECT e. branchid, e.employeeid, e.firstname, e.hiredate, e.lastname, e.managerid, 'Manager' as position,
       CURRENT_DATE AS load_dt, 
       CURRENT_TIMESTAMP AS load_ts
FROM odsdb_kumaranm.ods_employees e  where  employeeid= 2000

insert into edwdb_kumaranm.dim_employees
select s.*, t.* from odsdb_kumaranm.ods_employees s
left join edwdb_kumaranm.dim_employees t
on s.employeeid = t.employeeid
where t.employeeid is NULL and s.load_dt >= CURRENT_DATE

SET SQL_SAFE_UPDATES = 0;
update edwdb_kumaranm.dim_employees t
#SELECT t.*, s.* FROM edwdb_kumaranm.dim_employees t
join odsdb_kumaranm.ods_employees s
on t.employeeid = s.employeeid
set t.firstname = s.firstname,
t.lastname = s.lastname,
t.hiredate = s.hiredate,
t.managerid = s.managerid,
t.position = s.position,
t.load_dt = CURRENT_DATE,
t.load_ts = CURRENT_TIMESTAMP
where (t.firstname <> s.firstname or
t.lastname <> s.lastname or
t.hiredate <> s.hiredate or
t.managerid <> s.managerid or t.position <> s.position) and s.load_dt >= CURRENT_DATE

select * from edwdb_kumaranm.dim_employees where employeeid= 2000




