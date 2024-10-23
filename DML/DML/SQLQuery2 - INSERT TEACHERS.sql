USE PD_311_DDL;
GO

INSERT	Teachers
		(last_name, first_name, middle_name, birth_date, works_since, rate)
VALUES	
--		('��������', '��������', '�������������', '2001-01-04', '2024-10-16', 35)
--		('��������', '����������', '����������', '1995-12-23', '2024-10-16', 35)
--		('��������', '������', '����������', '1994-12-01', '2024-10-18', 50)
		(N'������',		 N'����',		N'�����������',	'1985-01-16', '2009-04-04', 35),
		(N'�������',	 N'������',		N'��������',	'1990-09-06', '2022-07-07', 35),
		(N'�����������', N'������',		N'�����������', '1981-02-18', '2003-09-01', 35),
		(N'������',		 N'���������',	N'������������','1989-05-15', '2008-08-01', 35),
		(N'��������',	 N'�����',		N'�������������','1985-02-25','2022-06-09', 35),
		(N'����������',  N'���������',  N'�������',		 '1981-10-29', '2007-10-10',35);

--����� ��������� �� ������������� ��� �������� Execute:
WITH CTE AS 
(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY last_name, first_name, middle_name, birth_date ORDER BY teacher_id) AS rn
    FROM dbo.Teachers
)
DELETE FROM CTE
WHERE rn > 1;
GO