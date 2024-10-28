USE PD_311_2;
GO

EXEC PrintSchedule;
PRINT dbo.CompleteLessonsForTeacher(N'Покидюк', '2024-10-01', '2024-10-31') 