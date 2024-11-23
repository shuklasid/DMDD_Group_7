
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'yourStrongPassword!';
CREATE CERTIFICATE Cert_UserData WITH SUBJECT = 'User Data Encryption';
CREATE SYMMETRIC KEY SymmetricKey_UserData WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Cert_UserData;


--Encrypt Data:
ALTER TABLE [User]
ADD TempFirstName NVARCHAR(MAX),
    TempLastName NVARCHAR(MAX);
OPEN SYMMETRIC KEY SymmetricKey_UserData DECRYPTION BY CERTIFICATE Cert_UserData;

UPDATE [User]
SET TempFirstName = EncryptByKey(Key_GUID('SymmetricKey_UserData'), CONVERT(NVARCHAR(MAX), FirstName)),
    TempLastName = EncryptByKey(Key_GUID('SymmetricKey_UserData'), CONVERT(NVARCHAR(MAX), LastName))
CLOSE SYMMETRIC KEY SymmetricKey_UserData;
ALTER TABLE [User]
DROP COLUMN FirstName,
              LastName;

EXEC sp_rename 'User.TempFirstName', 'FirstName', 'COLUMN';
EXEC sp_rename 'User.TempLastName', 'LastName', 'COLUMN';


Select * from [User]
--Decrypt Data:

OPEN SYMMETRIC KEY SymmetricKey_UserData DECRYPTION BY CERTIFICATE Cert_UserData;

SELECT 
    CONVERT(NVARCHAR(MAX), DecryptByKey(FirstName)) AS DecryptedFirstName,
    CONVERT(NVARCHAR(MAX), DecryptByKey(LastName)) AS DecryptedLastName
FROM [User];

CLOSE SYMMETRIC KEY SymmetricKey_UserData;
Select * from [User]