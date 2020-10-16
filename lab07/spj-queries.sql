-- Get the number of suppliers.
SELECT COUNT(*)
  FROM Supplier
  ;

-- Get all data on all suppliers.
SELECT *
  FROM Supplier
  ;

-- Get the loginIDs for a stupid password.
SELECT loginID
  FROM Supplier
 WHERE password = 'joshua'
 ;

-- Get jobs without names.
SELECT *
  FROM Job
 WHERE name IS NULL
 ;

-- Get the names and quantities of parts supplied to jobs at Calvin.
SELECT Part.name, PartJob.quantity
  FROM Part, PartJob, Job
 WHERE Part.ID = PartJob.PartID
   AND PartJob.JobId = Job.ID
   AND Job.address = 'Calvin'
   ;