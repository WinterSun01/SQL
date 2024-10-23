USE PD_311_DDL;
GO

INSERT	Disciplines
		(discipline_name, number_of_lessons, report_type)
VALUES
		(N'����������� ���������������� �� ����� C++', 96,1),
		(N'��������-��������������� ���������������� �� ����� C++', 76,1),
		(N'UML � �������� ��������������', 18,2),
		(N'��������� .NET � ���� ���������������� C#', 32,1),
		(N'���������� Windows ���������� �� ����� C++', 18,1),
		(N'���������� Windows ���������� �� ����� C#', 18,1),
		(N'������ ��� ������ � ���������������� MS SQL Server', 32, 1),
		(N'���������� ������� � ������ ADO.NET', 24, 1),
		(N'���������� Web-���������� � �������������� ���������� ASP.NET', 48, 1),
		(N'������ ���������������� �� ����� Java', 96,1),
		(N'���������� Back-End ���������� �� ����� Java', 50, 1),
		(N'HTML/CSS', 24,1),
		(N'���������������� �� ����� JavaScript', 24,1),
		(N'������ ��� ������ � ���������������� MySQL Server', 32,1),
		(N'BackEnd ���������� �� ����� PHP', 24,1),
		(N'FrontEnd ���������� � �������������� NodeJS', 24,1),
		(N'BackEnd ���������� � �������������� ReactJS', 24,1),
		(N'Adobe Photoshop', 32,1),
		(N'Adobe Illustrator', 32,1),
		(N'Adobe Premiere Pro', 32,1),
		(N'Adobe AgterEffects', 48,1),
		(N'AutoCAD', 32,1),
		(N'3DS Max', 44,1),
		(N'Maya', 77,1),
		(N'Blender', 32,1),
		(N'������� ���������� ��������� �����', 24,2),
		(N'������������� � IP-�����', 44,1),
		(N'��������� ����������� ������', 44,1),
		(N'Hardware-PC', 32,1),
		(N'����������������� Windows XP/7/8/10/11', 32,1),
		(N'����������������� Windows Server', 32,1),
		(N'����������������� UNIX', 32,1),
		(N'Game Development �� ������ UnrealEngine', 44,1),
		(N'Game Development �� ������ Cryengine', 77,1),
		(N'Android Development', 32,1);

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