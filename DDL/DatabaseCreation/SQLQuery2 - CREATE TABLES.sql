USE PD_311_DDL;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Directions')
BEGIN
	CREATE TABLE Directions
	(
		direction_id	SMALLINT		PRIMARY KEY,
		direction_name	NVARCHAR(150)	NOT NULL
	);
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Groups')
BEGIN
	CREATE TABLE Groups
	(
		group_id		INT				PRIMARY KEY,
		group_name		NVARCHAR(16)	NOT NULL,
		direction		SMALLINT		NOT NULL
		CONSTRAINT	FK_Groups_Directions FOREIGN KEY REFERENCES Directions(direction_id)
	);
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Students')
BEGIN
CREATE TABLE Students
(
	student_id		INT PRIMARY KEY IDENTITY(1,1),
	last_name		NVARCHAR(150) NOT NULL,
	first_name		NVARCHAR(150) NOT NULL,
	middle_name		NVARCHAR(150),
	birth_date		DATE NOT NULL,
	[group]			INT
	CONSTRAINT FK_Students_Groups FOREIGN KEY REFERENCES Groups(group_id)
);
END
GO