USE PD_311_DDL;
GO

INSERT	Disciplines
		(discipline_name, number_of_lessons, report_type)
VALUES
		(N'Процедурное программирование на языке C++', 96,1),
		(N'Объектно-ориентированное программирование на языке C++', 76,1),
		(N'UML и Паттерны проектирования', 18,2),
		(N'Платформа .NET и язык программирования C#', 32,1),
		(N'Разработка Windows приложений на языке C++', 18,1),
		(N'Разработка Windows приложений на языке C#', 18,1),
		(N'Теория Баз Данных и программирование MS SQL Server', 32, 1),
		(N'Технология доступа к данным ADO.NET', 24, 1),
		(N'Разработка Web-приложений с использованием технологии ASP.NET', 48, 1),
		(N'Основы программирования на языке Java', 96,1),
		(N'Разработка Back-End приложений на языке Java', 50, 1),
		(N'HTML/CSS', 24,1),
		(N'Программирование на языке JavaScript', 24,1),
		(N'Теория Баз Данных и программирование MySQL Server', 32,1),
		(N'BackEnd разработка на языке PHP', 24,1),
		(N'FrontEnd разработка с использованием NodeJS', 24,1),
		(N'BackEnd разработка с использованием ReactJS', 24,1),
		(N'Adobe Photoshop', 32,1),
		(N'Adobe Illustrator', 32,1),
		(N'Adobe Premiere Pro', 32,1),
		(N'Adobe AgterEffects', 48,1),
		(N'AutoCAD', 32,1),
		(N'3DS Max', 44,1),
		(N'Maya', 77,1),
		(N'Blender', 32,1),
		(N'Базовые технологии локальных сетей', 24,2),
		(N'Маршрутизация в IP-сетях', 44,1),
		(N'Протоколы прикладного уровня', 44,1),
		(N'Hardware-PC', 32,1),
		(N'Администрирование Windows XP/7/8/10/11', 32,1),
		(N'Администрирование Windows Server', 32,1),
		(N'Администрирование UNIX', 32,1),
		(N'Game Development на движке UnrealEngine', 44,1),
		(N'Game Development на движке Cryengine', 77,1),
		(N'Android Development', 32,1);

--чтобы постоянно не дублировалось при нажатиях Execute:
WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY discipline_name, number_of_lessons, report_type ORDER BY discipline_id) AS rn
    FROM dbo.Disciplines
)
DELETE FROM CTE
WHERE rn > 1;
GO