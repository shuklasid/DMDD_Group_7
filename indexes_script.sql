CREATE NONCLUSTERED INDEX idx_Application_JobID
ON Application (JobID);
GO

-- Non-clustered index on EmployerID in Job_Posting
CREATE NONCLUSTERED INDEX idx_JobPosting_EmployerID
ON Job_Posting (EmployerID);
GO

-- Non-clustered index on JobSeekerID in Application
CREATE NONCLUSTERED INDEX idx_Application_JobSeekerID
ON Application (JobSeekerID);
GO