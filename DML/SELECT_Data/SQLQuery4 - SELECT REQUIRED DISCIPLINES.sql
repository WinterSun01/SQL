USE PD_311_2;
GO

SELECT
		--[������� ����������]=discipline_name,
		[��������� ����������]=discipline_name
FROM	Disciplines, RequiredDisciplines
WHERE	discipline_id = required_discipline
AND		target_discipline = 
		(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%ADO.NET%');