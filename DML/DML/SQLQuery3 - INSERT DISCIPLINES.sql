USE PD_311_DDL;
GO

--��� �������� ���� ������� �� �������, ����� �������� ���������� ���������� �����
DELETE FROM Disciplines;
GO

INSERT	Disciplines
		(discipline_id, discipline_name, number_of_lessons, report_type)
VALUES
		(1, N'����������� ���������������� �� ����� C++', 96,1),
		(2, N'��������-��������������� ���������������� �� ����� C++', 76,1),
		(3, N'UML � �������� ��������������', 18,2),
		(4, N'��������� .NET � ���� ���������������� C#', 32,1),
		(5, N'���������� Windows ���������� �� ����� C++', 18,1),
		(6, N'���������� Windows ���������� �� ����� C#', 18,1),
		(7, N'������ ��� ������ � ���������������� MS SQL Server', 32, 1),
		(8, N'���������� ������� � ������ ADO.NET', 24, 1),
		(9, N'���������� Web-���������� � �������������� ���������� ASP.NET', 48, 1),
		(10, N'������ ���������������� �� ����� Java', 96,1),
		(11, N'���������� Back-End ���������� �� ����� Java', 50, 1),
		(12, N'HTML/CSS', 24,1),
		(13, N'���������������� �� ����� JavaScript', 24,1),
		(14, N'������ ��� ������ � ���������������� MySQL Server', 32,1),
		(15, N'BackEnd ���������� �� ����� PHP', 24,1),
		(16, N'FrontEnd ���������� � �������������� NodeJS', 24,1),
		(17, N'BackEnd ���������� � �������������� ReactJS', 24,1),
		(18, N'Adobe Photoshop', 32,1),
		(19, N'Adobe Illustrator', 32,1),
		(20, N'Adobe Premiere Pro', 32,1),
		(21, N'Adobe AgterEffects', 48,1),
		(22, N'AutoCAD', 32,1),
		(23, N'3DS Max', 44,1),
		(24, N'Maya', 77,1),
		(25, N'Blender', 32,1),
		(26, N'������� ���������� ��������� �����', 24,2),
		(27, N'������������� � IP-�����', 44,1),
		(28, N'��������� ����������� ������', 44,1),
		(29, N'Hardware-PC', 32,1),
		(30, N'����������������� Windows XP/7/8/10/11', 32,1),
		(31, N'����������������� Windows Server', 32,1),
		(32, N'����������������� UNIX', 32,1),
		(33, N'Game Development �� ������ UnrealEngine', 44,1),
		(34, N'Game Development �� ������ Cryengine', 77,1),
		(35, N'Android Development', 32,1);

--����� ��������� �� ������������� ��� �������� Execute:
WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY discipline_name, number_of_lessons, report_type ORDER BY discipline_id) AS rn
    FROM dbo.Disciplines
)
DELETE FROM CTE
WHERE rn > 1;
GO