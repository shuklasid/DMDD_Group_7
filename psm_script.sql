--1. Stored Procedures with Input and Output Parameters


--A.   Stored Procedure to Get Job Seeker Details by Skill
CREATE PROCEDURE GetJobSeekersBySkill
    @SkillID INT,
    @JobSeekerCount INT OUTPUT
AS
BEGIN
    -- Query to retrieve job seekers with a specific skill
    SELECT js.JobSeekerID, u.FirstName, u.LastName
    FROM Job_Seeker_Skills js
    JOIN Job_Seeker j ON js.JobSeekerID = j.JobSeekerID
    JOIN [User] u ON j.UserID = u.UserID -- Use [User] to escape the reserved keyword
    WHERE js.SkillID = @SkillID;

    -- Set the output parameter to the count of job seekers with the given skill
    SELECT @JobSeekerCount = COUNT(*)
    FROM Job_Seeker_Skills
    WHERE SkillID = @SkillID;
END;
DECLARE @JobSeekerCount INT;

-- Execute the stored procedure with a specific SkillID
EXEC GetJobSeekersBySkill
    @SkillID = 5,            -- Replace 5 with the actual SkillID you want to query
    @JobSeekerCount = @JobSeekerCount OUTPUT;

-- Display the output parameter
SELECT @JobSeekerCount AS TotalJobSeekers;

--B.  Stored Procedure to Get Job Seeker Details:
--This procedure retrieves details about a job seeker based on the JobSeekerID. It takes JobSeekerID as an input parameter and returns the job seeker's details, including their name, contact number, and email.

CREATE PROCEDURE GetJobSeekerDetails
	@JobSeekerID INT,
	@Name NVARCHAR(100) OUTPUT,
	@ContactNumber NVARCHAR(15) OUTPUT,
	@Email NVARCHAR(100) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
 
	SELECT @Name = (U.FirstName +' '+U.LastName),
       	@ContactNumber = U.ContactNumber,
       	@Email = U.Email
	FROM Job_Seeker JS
	INNER JOIN [User] U ON JS.UserID = U.UserID
	WHERE JS.JobSeekerID = @JobSeekerID;
END;
 
DECLARE @Name NVARCHAR(100), @ContactNumber NVARCHAR(15), @Email NVARCHAR(100);
 
EXEC GetJobSeekerDetails
	@JobSeekerID = 1,
	@Name = @Name OUTPUT,
	@ContactNumber = @ContactNumber OUTPUT,
	@Email = @Email OUTPUT;
 
SELECT @Name AS Name, @ContactNumber AS ContactNumber, @Email AS Email;

 
--C.  Stored Procedure to Get Job Posting Details:
--This procedure retrieves details of a job posting based on the JobPostingID. It takes JobPostingID as an input parameter and returns the job title, location, and job type.

CREATE PROCEDURE GetJobPostingDetails
	@JobID INT,
	@JobTitle NVARCHAR(100) OUTPUT,
	@Location NVARCHAR(100) OUTPUT,
	@JobType NVARCHAR(MAX) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
 
	SELECT @JobTitle = JP.Description,
       	@Location = JP.Location, 
       	@JobType = JP.JobType
	FROM Job_Posting JP
	WHERE JP.JobID = @JobID;
END;
 
DECLARE @JobTitle NVARCHAR(100), @Location NVARCHAR(100), @JobType NVARCHAR(MAX);
 
EXEC GetJobPostingDetails
	@JobID = 1,
	@JobTitle = @JobTitle OUTPUT,
	@Location = @Location OUTPUT,
	@JobType = @JobType OUTPUT;
 
SELECT @JobTitle AS JobTitle,  @Location AS Location, @JobType AS JobType;
 



--D.  Stored Procedure to Get Application History:
--This procedure retrieves the application history for a job seeker based on the JobSeekerID. It takes JobSeekerID as an input parameter and outputs the job postings the job seeker has applied to, including application type and status

CREATE PROCEDURE GetApplicationHistory
	@JobSeekerID INT
AS
BEGIN
	SET NOCOUNT ON;
 
	SELECT A.ApplicationID,
       	JP.Description as JobTitle,
       	A.ApplicationType,
       	A.Status
	FROM Application A
	INNER JOIN Job_Posting JP ON A.JobID = JP.JobID
	WHERE A.JobSeekerID = @JobSeekerID;
END;
 
EXEC GetApplicationHistory
	@JobSeekerID = 1;


--2. Views for Reporting :



-- View for listing all job seekers and their applied jobs
CREATE VIEW vw_JobSeekerApplications AS
SELECT 
    js.JobSeekerID,
    u.FirstName+ ' '+u.LastName AS JobSeekerName, -- Assuming User table contains the name
    j.JobID,
    j.Description AS JobTitle, -- Mapping to the available column
    a.ApplicationType AS ApplicationDetail -- Using relevant column
FROM Job_Seeker js
JOIN [User] u ON js.UserID = u.UserID -- Mapping to the User table for name
JOIN Application a ON js.JobSeekerID = a.JobSeekerID
JOIN Job_Posting j ON a.JobID = j.JobID;
SELECT * FROM vw_JobSeekerApplications;


-- View for summarizing job postings by employer
CREATE VIEW vw_EmployerJobSummary AS
SELECT 
    e.EmployerID,
    COUNT(j.JobID) AS TotalJobsPosted,
    AVG(j.Salary) AS AvgSalary
FROM Employers e
JOIN Job_Posting j ON e.EmployerID = j.EmployerID
GROUP BY e.EmployerID;
SELECT * FROM vw_EmployerJobSummary;

-- View for applications by status
CREATE VIEW vw_ApplicationStatusSummary AS
SELECT 
    a.Status,
    COUNT(a.ApplicationID) AS TotalApplications
FROM Application a
GROUP BY a.Status;
SELECT * FROM vw_ApplicationStatusSummary;


--3. User-Defined Functions :

--A.  Calculate Expected Salary Based on Experience

CREATE FUNCTION CalculateExpectedSalary (@YearsExperience INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN @YearsExperience * 10000.0;
END;
DECLARE @Experience INT = 5; 
SELECT dbo.CalculateExpectedSalary(@Experience) AS ExpectedSalary;

--B.  Function to GetJobSeekerFullName
--This scalar function takes a JobSeekerID as input and returns the full name of the job seeker.
CREATE FUNCTION fn_GetJobSeekerFullName (@JobSeekerID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @FullName NVARCHAR(100);

    SELECT @FullName = U.FirstName + ' '+ U.LastName
    FROM Job_Seeker JS
    INNER JOIN [User] U ON JS.UserID = U.UserID
    WHERE JS.JobSeekerID = @JobSeekerID;

    RETURN @FullName;
END;

SELECT dbo.fn_GetJobSeekerFullName(1) AS FullName;

--C.  Function to GetJobApplicationsCount
--This scalar function takes a JobSeekerID as input and returns the total number of job applications submitted by that job seeker.

CREATE FUNCTION fn_GetJobApplicationsCount (@JobSeekerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @ApplicationsCount INT;

    SELECT @ApplicationsCount = COUNT(*)
    FROM Application
    WHERE JobSeekerID = @JobSeekerID;

    RETURN @ApplicationsCount;
END;

SELECT dbo.fn_GetJobApplicationsCount(1) AS ApplicationsCount;

--D.  -- Function to calculate average rating for an employer
CREATE FUNCTION dbo.fn_AvgEmployerRating (@EmployerID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @AvgRating FLOAT;
    SELECT @AvgRating = AVG(f.Rating)
    FROM Feedback f
    JOIN Employers e ON e.EmployerID = f.UserID
    WHERE e.EmployerID = @EmployerID;
    RETURN ISNULL(@AvgRating, 0);
END;
DECLARE @EmployerID INT = 1; 

SELECT dbo.fn_AvgEmployerRating(@EmployerID) AS AverageRating;

--4. DML Triggers :

--A . Trigger to update Application_History when an application status changes

CREATE TRIGGER trg_UpdateApplicationHistory
ON Application
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Status)
    BEGIN
        INSERT INTO Application_History (JobSeekerID, Status, Date, ApplicationID)
        SELECT i.JobSeekerID, i.Status, GETDATE(), i.ApplicationID
        FROM inserted i
        JOIN deleted d ON i.ApplicationID = d.ApplicationID
        WHERE i.Status <> d.Status;
    END
END
UPDATE Application
SET Status = 'Accepted'
WHERE ApplicationID = 1;
SELECT * FROM Application_History
WHERE ApplicationID = 1 AND Status = 'Accepted'



--B. Trigger to update Job_Seeker_Skills when a new skill is added to a job posting


CREATE TRIGGER trg_UpdateJobSeekerSkills
ON JobPosting_Skills
AFTER INSERT
AS
BEGIN
    INSERT INTO Job_Seeker_Skills (JobSeekerID, SkillID)
    SELECT DISTINCT js.JobSeekerID, i.SkillID
    FROM inserted i
    CROSS JOIN Job_Seeker js
    WHERE NOT EXISTS (
        SELECT 1
        FROM Job_Seeker_Skills jss
        WHERE jss.JobSeekerID = js.JobSeekerID
        AND jss.SkillID = i.SkillID
    );
END
INSERT INTO JobPosting_Skills (JobID, SkillID)
VALUES (1, 2);

SELECT * FROM Job_Seeker_Skills
WHERE SkillID = 2;

--C . Trigger to automatically update Job_Seeker_Skills when a job seeker applies for a job

CREATE TRIGGER trg_UpdateJobSeekerSkillsOnApplication
ON Application
AFTER INSERT
AS
BEGIN
    INSERT INTO Job_Seeker_Skills (JobSeekerID, SkillID)
    SELECT DISTINCT i.JobSeekerID, jps.SkillID
    FROM inserted i
    JOIN Job_Posting jp ON i.JobID = jp.JobID
    JOIN JobPosting_Skills jps ON jp.JobID = jps.JobID
    WHERE NOT EXISTS (
        SELECT 1
        FROM Job_Seeker_Skills jss
        WHERE jss.JobSeekerID = i.JobSeekerID
        AND jss.SkillID = jps.SkillID
    );
END
INSERT INTO Application (JobSeekerID, JobID, ResumeID, ApplicationType, Status)
VALUES (1, 1, 1, 'Online', 'Pending');
SELECT * FROM Job_Seeker_Skills
WHERE JobSeekerID = 1;
