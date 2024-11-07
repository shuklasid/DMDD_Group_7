USE JobPortalSystem;

INSERT INTO UserAccount (Password) VALUES 
('password123'), 
('securePass!'), 
('MyPass@2024'), 
('anotherPass!'), 
('StrongP@ss1'), 
('pass1234'), 
('pass5678'), 
('pwd!@34'), 
('testPass9'), 
('HelloWorld1'), 
('SamplePass0'), 
('SecureIt@12'), 
('test123!'), 
('uniquePwd!'), 
('finalPass@2024');


INSERT INTO Notification (AccountID, Content, IsRead, Time) VALUES
(1, 'Welcome to the platform!', 0, GETDATE()),
(2, 'Your profile was updated successfully.', 1, GETDATE()),
(3, 'New job postings in your area.', 0, GETDATE()),
(4, 'Application status updated.', 1, GETDATE()),
(5, 'Interview scheduled.', 0, GETDATE()),
(6, 'Resume reviewed.', 1, GETDATE()),
(7, 'You have new messages.', 0, GETDATE()),
(8, 'Password changed successfully.', 1, GETDATE()),
(9, 'Weekly job recommendations.', 0, GETDATE()),
(10, 'Profile incomplete reminder.', 0, GETDATE()),
(11, 'New feature update.', 1, GETDATE()),
(12, 'Interview feedback posted.', 1, GETDATE()),
(13, 'Weekly summary.', 1, GETDATE()),
(14, 'New application submission.', 0, GETDATE()),
(15, 'Profile verification complete.', 1, GETDATE());

INSERT INTO [User] (AccountID, FirstName, LastName, ContactNumber, Email) VALUES
(1, 'John', 'Doe', '1234567890', 'john@example.com'),
(2, 'Jane', 'Smith', '0987654321', 'jane@example.com'),
(3, 'Alice', 'Johnson', '4561237890', 'alice@example.com'),
(4, 'Bob', 'Brown', '3216549870', 'bob@example.com'),
(5, 'Charlie', 'Davis', '9871234560', 'charlie@example.com'),
(6, 'David', 'Wilson', '6547891230', 'david@example.com'),
(7, 'Eva', 'Taylor', '7893216540', 'eva@example.com'),
(8, 'Frank', 'Moore', '1239874560', 'frank@example.com'),
(9, 'Grace', 'White', '9876543210', 'grace@example.com'),
(10, 'Hannah', 'Green', '7418529630', 'hannah@example.com'),
(11, 'Isaac', 'King', '8529637410', 'isaac@example.com'),
(12, 'Jake', 'Hill', '1593574860', 'jake@example.com'),
(13, 'Laura', 'Lee', '9638527410', 'laura@example.com'),
(14, 'Mike', 'Martin', '7894561230', 'mike@example.com'),
(15, 'Nina', 'Clark', '3579514860', 'nina@example.com');


INSERT INTO Company (CompanyName, Street, State, City, Email, Pincode, PhoneNumber, Website) VALUES
('TechCorp', '123 Main St', 'MA', 'Boston', 'contact@techcorp.com', '02118', '1234567890', 'www.techcorp.com'),
('InnoSoft', '456 Elm St', 'NY', 'New York', 'info@innosoft.com', '10001', '0987654321', 'www.innosoft.com'),
('Healthify', '789 Oak St', 'CA', 'Los Angeles', 'support@healthify.com', '90001', '5678901234', 'www.healthify.com'),
('FinancePro', '321 Maple Ave', 'IL', 'Chicago', 'help@financepro.com', '60601', '2345678901', 'www.financepro.com'),
('GreenEnergy', '654 Pine Dr', 'TX', 'Houston', 'info@greenenergy.com', '77001', '3456789012', 'www.greenenergy.com'),
('AgroWorld', '987 Cedar Rd', 'FL', 'Miami', 'contact@agroworld.com', '33101', '4567890123', 'www.agroworld.com'),
('NextGenIT', '159 Birch St', 'WA', 'Seattle', 'services@nextgenit.com', '98101', '5678901234', 'www.nextgenit.com'),
('RetailKing', '753 Willow Ln', 'NV', 'Las Vegas', 'sales@retailking.com', '89101', '6789012345', 'www.retailking.com'),
('EduTech', '246 Cypress Ave', 'GA', 'Atlanta', 'support@edutech.com', '30301', '7890123456', 'www.edutech.com'),
('CloudWave', '369 Aspen St', 'AZ', 'Phoenix', 'info@cloudwave.com', '85001', '8901234567', 'www.cloudwave.com'),
('BuildSmart', '159 Oakwood Blvd', 'NC', 'Charlotte', 'contact@buildsmart.com', '28201', '1234567890', 'www.buildsmart.com'),
('EcoLife', '753 Maplewood Ave', 'MI', 'Detroit', 'support@ecolife.com', '48201', '2345678901', 'www.ecolife.com'),
('TravelPlus', '246 Park St', 'FL', 'Orlando', 'info@travelplus.com', '32801', '3456789012', 'www.travelplus.com'),
('MedConnect', '369 Spruce Ln', 'NJ', 'Newark', 'help@medconnect.com', '07101', '4567890123', 'www.medconnect.com'),
('UrbanDesigns', '159 Cedar Blvd', 'PA', 'Philadelphia', 'contact@urbandesigns.com', '19101', '5678901234', 'www.urbandesigns.com');


INSERT INTO Employers (CompanyID, PhoneNumber, Industry) VALUES
(1, '1234567890', 'IT'),
(2, '0987654321', 'Finance'),
(3, '5678901234', 'Healthcare'),
(4, '2345678901', 'Finance'),
(5, '3456789012', 'Energy'),
(6, '4567890123', 'Agriculture'),
(7, '5678901234', 'IT'),
(8, '6789012345', 'Retail'),
(9, '7890123456', 'Education'),
(10, '8901234567', 'Cloud Computing'),
(11, '1234567890', 'Construction'),
(12, '2345678901', 'Environment'),
(13, '3456789012', 'Travel'),
(14, '4567890123', 'Medical'),
(15, '5678901234', 'Architecture');


INSERT INTO Job_Posting (EmployerID, Description, JobType, Location, Salary, PostedDate) VALUES
(1, 'Software Engineer role', 'Full-time', 'Boston', 70000.00, GETDATE()),
(2, 'Data Analyst position', 'Part-time', 'New York', 40000.00, GETDATE()),
(3, 'Healthcare Administrator', 'Full-time', 'Los Angeles', 65000.00, GETDATE()),
(4, 'Finance Manager', 'Full-time', 'Chicago', 85000.00, GETDATE()),
(5, 'Energy Consultant', 'Contract', 'Houston', 55000.00, GETDATE()),
(6, 'Agricultural Scientist', 'Full-time', 'Miami', 60000.00, GETDATE()),
(7, 'IT Support Specialist', 'Part-time', 'Seattle', 45000.00, GETDATE()),
(8, 'Retail Sales Manager', 'Full-time', 'Las Vegas', 50000.00, GETDATE()),
(9, 'Education Coordinator', 'Full-time', 'Atlanta', 62000.00, GETDATE()),
(10, 'Cloud Architect', 'Full-time', 'Phoenix', 90000.00, GETDATE()),
(11, 'Construction Engineer', 'Contract', 'Charlotte', 75000.00, GETDATE()),
(12, 'Environmental Consultant', 'Full-time', 'Detroit', 68000.00, GETDATE()),
(13, 'Travel Advisor', 'Part-time', 'Orlando', 40000.00, GETDATE()),
(14, 'Medical Research Assistant', 'Full-time', 'Newark', 52000.00, GETDATE()),
(15, 'Architectural Designer', 'Full-time', 'Philadelphia', 85000.00, GETDATE());


INSERT INTO Job_Seeker (UserID) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15);


INSERT INTO Resume (JobSeekerID, FilePath, DateUploaded) VALUES
(1, '/resumes/resume1.pdf', GETDATE()),
(2, '/resumes/resume2.pdf', GETDATE()),
(3, '/resumes/resume3.pdf', GETDATE()),
(4, '/resumes/resume4.pdf', GETDATE()),
(5, '/resumes/resume5.pdf', GETDATE()),
(6, '/resumes/resume6.pdf', GETDATE()),
(7, '/resumes/resume7.pdf', GETDATE()),
(8, '/resumes/resume8.pdf', GETDATE()),
(9, '/resumes/resume9.pdf', GETDATE()),
(10, '/resumes/resume10.pdf', GETDATE()),
(11, '/resumes/resume11.pdf', GETDATE()),
(12, '/resumes/resume12.pdf', GETDATE()),
(13, '/resumes/resume13.pdf', GETDATE()),
(14, '/resumes/resume14.pdf', GETDATE()),
(15, '/resumes/resume15.pdf', GETDATE());

INSERT INTO Application (JobSeekerID, JobID, ResumeID, ApplicationType, Status) VALUES
(1, 1, 1, 'Online', 'Submitted'),
(2, 2, 2, 'Referral', 'Pending'),
(3, 3, 3, 'Online', 'Interview Scheduled'),
(4, 4, 4, 'Referral', 'Rejected'),
(5, 5, 5, 'Online', 'Accepted'),
(6, 6, 6, 'Referral', 'Submitted'),
(7, 7, 7, 'Online', 'Pending'),
(8, 8, 8, 'Referral', 'Interview Scheduled'),
(9, 9, 9, 'Online', 'Rejected'),
(10, 10, 10, 'Referral', 'Accepted'),
(11, 11, 11, 'Online', 'Pending'),
(12, 12, 12, 'Referral', 'Interview Scheduled'),
(13, 13, 13, 'Online', 'Rejected'),
(14, 14, 14, 'Referral', 'Accepted'),
(15, 15, 15, 'Online', 'Submitted');


INSERT INTO Application_History (JobSeekerID, Status, Date, ApplicationID) VALUES
(1, 'Submitted', GETDATE(), 1),
(2, 'Pending', GETDATE(), 2),
(3, 'Interview Scheduled', GETDATE(), 3),
(4, 'Rejected', GETDATE(), 4),
(5, 'Accepted', GETDATE(), 5),
(6, 'Submitted', GETDATE(), 6),
(7, 'Pending', GETDATE(), 7),
(8, 'Interview Scheduled', GETDATE(), 8),
(9, 'Rejected', GETDATE(), 9),
(10, 'Accepted', GETDATE(), 10),
(11, 'Pending', GETDATE(), 11),
(12, 'Interview Scheduled', GETDATE(), 12),
(13, 'Rejected', GETDATE(), 13),
(14, 'Accepted', GETDATE(), 14),
(15, 'Submitted', GETDATE(), 15);


INSERT INTO Interview (JobSeekerID, EmployerID, InterviewDate, Mode) VALUES
(1, 1, GETDATE(), 'Online'),
(2, 2, DATEADD(DAY, 1, GETDATE()), 'In-person'),
(3, 3, DATEADD(DAY, 2, GETDATE()), 'Online'),
(4, 4, DATEADD(DAY, 3, GETDATE()), 'Phone'),
(5, 5, DATEADD(DAY, 4, GETDATE()), 'Video'),
(6, 6, DATEADD(DAY, 5, GETDATE()), 'In-person'),
(7, 7, DATEADD(DAY, 6, GETDATE()), 'Phone'),
(8, 8, DATEADD(DAY, 7, GETDATE()), 'Online'),
(9, 9, DATEADD(DAY, 8, GETDATE()), 'Video'),
(10, 10, DATEADD(DAY, 9, GETDATE()), 'In-person'),
(11, 11, DATEADD(DAY, 10, GETDATE()), 'Phone'),
(12, 12, DATEADD(DAY, 11, GETDATE()), 'Video'),
(13, 13, DATEADD(DAY, 12, GETDATE()), 'Online'),
(14, 14, DATEADD(DAY, 13, GETDATE()), 'Phone'),
(15, 15, DATEADD(DAY, 14, GETDATE()), 'In-person');


INSERT INTO Feedback (UserID, Description, Rating, PostedDate) VALUES
(1, 'Great experience', 5, GETDATE()),
(2, 'Good platform', 4, GETDATE()),
(3, 'Average service', 3, GETDATE()),
(4, 'Not satisfied', 2, GETDATE()),
(5, 'Excellent features', 5, GETDATE()),
(6, 'Could be better', 3, GETDATE()),
(7, 'Helpful team', 4, GETDATE()),
(8, 'Decent platform', 3, GETDATE()),
(9, 'Improvements needed', 2, GETDATE()),
(10, 'Exceptional service', 5, GETDATE()),
(11, 'Satisfied', 4, GETDATE()),
(12, 'Good support', 4, GETDATE()),
(13, 'User-friendly', 5, GETDATE()),
(14, 'Okay service', 3, GETDATE()),
(15, 'Love the platform', 5, GETDATE());

INSERT INTO Skills (SkillName) VALUES
('Python'), ('Java'), ('SQL'), ('Data Analysis'), ('Machine Learning'),
('Project Management'), ('Communication'), ('Teamwork'), ('Problem Solving'), ('Leadership'),
('C++'), ('HTML'), ('CSS'), ('JavaScript'), ('React');


INSERT INTO JobPosting_Skills (JobID, SkillID) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(4, 6), (4, 7), (5, 8), (6, 9), (7, 10),
(8, 11), (9, 12), (10, 13), (11, 14), (12, 15);


INSERT INTO Job_Seeker_Skills (JobSeekerID, SkillID) VALUES
(1, 1), (1, 2), (2, 3), (3, 4), (4, 5),
(5, 6), (6, 7), (7, 8), (8, 9), (9, 10),
(10, 11), (11, 12), (12, 13), (13, 14), (14, 15);


-- Select query for verification of the data

-- Select all data from UserAccount
SELECT * FROM UserAccount;

-- Select all data from Notification
SELECT * FROM Notification;

-- Select all data from User
SELECT * FROM [User];

-- Select all data from Company
SELECT * FROM Company;

-- Select all data from Employers
SELECT * FROM Employers;

-- Select all data from Job_Posting
SELECT * FROM Job_Posting;

-- Select all data from Job_Seeker
SELECT * FROM Job_Seeker;

-- Select all data from Resume
SELECT * FROM Resume;

-- Select all data from Application
SELECT * FROM Application;

-- Select all data from Application_History
SELECT * FROM Application_History;

-- Select all data from Interview
SELECT * FROM Interview;

-- Select all data from Feedback
SELECT * FROM Feedback;

-- Select all data from Skills
SELECT * FROM Skills;

-- Select all data from JobPosting_Skills
SELECT * FROM JobPosting_Skills;

-- Select all data from Job_Seeker_Skills
SELECT * FROM Job_Seeker_Skills;
