# SCD Type-2- History is  maintained 

select *from edwdb_kumaranm.dim_branches where branchid in (275)

update  odsdb_kumaranm.ods_branches set city='Robinville-Exten' where branchid=275;

select *from odsdb_kumaranm.ods_branches where branchid in (275)
select *from edwdb_kumaranm.dim_branches where branchid in (275)



SET SQL_SAFE_UPDATES = 0;

UPDATE edwdb_kumaranm.dim_branches d
JOIN odsdb_kumaranm.ods_branches o
  ON d.BranchID = o.BranchID
SET d.end_date = CURRENT_DATE - INTERVAL 1 DAY,
    d.is_current = 0
WHERE d.is_current = 1
  AND d.BranchID IS NOT NULL  # ensures key column is used
  AND (d.Address   <> o.Address
    OR d.BranchName <> o.BranchName
    OR d.City       <> o.City
    OR d.State      <> o.State
    OR d.Zipcode    <> o.Zipcode);

select *from odsdb_kumaranm.ods_branches where branchid in (275)
select *from edwdb_kumaranm.dim_branches where branchid in (275)


INSERT INTO edwdb_kumaranm.dim_branches (
    Address,
    BranchID,
    BranchName,
    City,
    State,
    Zipcode,
    start_date,
    end_date,
    is_current,
    load_dt,
    load_ts
)
SELECT
    o.Address,
    o.BranchID,
    o.BranchName,
    o.City,
    o.State,
    o.Zipcode,
    CURRENT_DATE,
    NULL,
    1,
    CURRENT_DATE,
    CURRENT_TIMESTAMP
FROM odsdb_kumaranm.ods_branches o
LEFT JOIN edwdb_kumaranm.dim_branches d
       ON o.BranchID = d.BranchID
      AND d.is_current = 1
WHERE d.BranchID IS NULL
   OR d.Address   <> o.Address
   OR d.BranchName <> o.BranchName
   OR d.City       <> o.City
   OR d.State      <> o.State
   OR d.Zipcode    <> o.Zipcode;

select *from odsdb_kumaranm.ods_branches where branchid in (275);
select *from edwdb_kumaranm.dim_branches where branchid in (275);

