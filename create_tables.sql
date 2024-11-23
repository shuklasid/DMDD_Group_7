CREATE DATABASE JobPortalSystem;
USE JobPortalSystem;

-- Drop existing tables in correct order based on dependencies

DROP TABLE IF EXISTS JobPosting_Skills;
DROP TABLE IF EXISTS Job_Seeker_Skills;
DROP TABLE IF EXISTS Skills;
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Interview;
DROP TABLE IF EXISTS Application_History;
DROP TABLE IF EXISTS Application;
DROP TABLE IF EXISTS Resume;
DROP TABLE IF EXISTS Job_Seeker;
DROP TABLE IF EXISTS Job_Posting;
DROP TABLE IF EXISTS Employers;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS [User];
DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS UserAccount;


CREATE TABLE UserAccount (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    Password VARCHAR(100) NOT NULL
);

CREATE TABLE Notification (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT FOREIGN KEY REFERENCES UserAccount(AccountID),
    Content TEXT NOT NULL,
    IsRead BIT DEFAULT 0,
    Time DATETIME NOT NULL
);

CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT FOREIGN KEY REFERENCES UserAccount(AccountID),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
	CHECK (ContactNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR ContactNumber IS NULL)
);

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName VARCHAR(100) NOT NULL,
    Street VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100),
    Pincode VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Website VARCHAR(100)
);

CREATE TABLE Employers (
    EmployerID INT PRIMARY KEY IDENTITY(1,1),
    CompanyID INT FOREIGN KEY REFERENCES Company(CompanyID),
    PhoneNumber VARCHAR(15),
    Industry VARCHAR(50)
);

CREATE TABLE Job_Posting (
    JobID INT PRIMARY KEY IDENTITY(1,1),
    EmployerID INT FOREIGN KEY REFERENCES Employers(EmployerID),
    Description TEXT,
    JobType VARCHAR(20) CHECK (JobType IN ('Full-time', 'Part-time', 'Contract')),
    Location VARCHAR(50),
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    PostedDate DATE DEFAULT GETDATE()
);

CREATE TABLE Job_Seeker (
    JobSeekerID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES [User](UserID)
);

CREATE TABLE Resume (
    ResumeID INT PRIMARY KEY IDENTITY(1,1),
    JobSeekerID INT FOREIGN KEY REFERENCES Job_Seeker(JobSeekerID),
    FilePath VARCHAR(255),
    DateUploaded DATE DEFAULT GETDATE()
);

CREATE TABLE Application (
    ApplicationID INT PRIMARY KEY IDENTITY(1,1),
    JobSeekerID INT FOREIGN KEY REFERENCES Job_Seeker(JobSeekerID),
    JobID INT FOREIGN KEY REFERENCES Job_Posting(JobID),
    ResumeID INT FOREIGN KEY REFERENCES Resume(ResumeID),
    ApplicationType VARCHAR(20) CHECK (ApplicationType IN ('Online', 'Referral')),
    Status VARCHAR(20) NOT NULL
);

CREATE TABLE Application_History (
    ApplicationHistoryID INT PRIMARY KEY IDENTITY(1,1),
    JobSeekerID INT FOREIGN KEY REFERENCES Job_Seeker(JobSeekerID),
    Status VARCHAR(20),
    Date DATE,
    ApplicationID INT FOREIGN KEY REFERENCES Application(ApplicationID)
);

CREATE TABLE Interview (
    InterviewID INT PRIMARY KEY IDENTITY(1,1),
    JobSeekerID INT FOREIGN KEY REFERENCES Job_Seeker(JobSeekerID),
    EmployerID INT FOREIGN KEY REFERENCES Employers(EmployerID),
    InterviewDate DATE,
    Mode VARCHAR(20)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    Description TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    PostedDate DATE DEFAULT GETDATE()
);

CREATE TABLE Skills (
    SkillID INT PRIMARY KEY IDENTITY(1,1),
    SkillName VARCHAR(50) NOT NULL
);

CREATE TABLE JobPosting_Skills (
    JobPostingSkillID INT PRIMARY KEY IDENTITY(1,1),
    JobID INT FOREIGN KEY REFERENCES Job_Posting(JobID),
    SkillID INT FOREIGN KEY REFERENCES Skills(SkillID)
);

CREATE TABLE Job_Seeker_Skills (
    JobSeekerSkillID INT PRIMARY KEY IDENTITY(1,1),
    JobSeekerID INT FOREIGN KEY REFERENCES Job_Seeker(JobSeekerID),
    SkillID INT FOREIGN KEY REFERENCES Skills(SkillID)
);

