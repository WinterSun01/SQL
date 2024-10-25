USE PD_311_2;
GO

--EXEC PrintStudents;
--EXEC PrintSchedule;
--EXEC sp_AddScheduleForStacionarGroup '2024-01-10', '14:30', N'PD_212', N'%ADO.NET%', N'Покидюк'
--EXEC PrintScheduleForGroup N'PD_212';

EXEC sp_AddAlternatingDisciplineToSchedule N'PD_311', N'Hardware%', '2023-09-15', '13:30', 'Кобылинский', 2, 4
--PRINT (DATEPART(WEEKDAY, GETDATE()))