USE PD_311_DDL;
GO

--CREATE PROCEDURE PrintStudents
--AS
--BEGIN
--	SELECT 
--			[Ф.И.О.] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
--			[Возраст] = DATEDIFF(DAY, birth_date, GETDATE()) / 365,
--			[Группа] = group_name
--	FROM Students, Groups
--	WHERE [group] = group_id;
--END
------------------------------------------------------------------------
GO

--CREATE PROCEDURE PrintSchedule
--AS
--BEGIN
--	SELECT
--		[Дата] = [date],
--		[Время] = [time],
--		[День] = DATENAME(WEEKDAY, [date]),
--		[Группа] = group_name,
--		[Дисциплина] = discipline_name,
--		[Преподаватель] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
--		[Статус] = IIF(spent = 1, N'Проведено', N'Запланировано')
--	FROM Schedule, Groups, Disciplines, Teachers
--	WHERE [group] = group_id
--	AND discipline = discipline_id
--	AND teacher = teacher_id;
--END
------------------------------------------------------------------------
GO

--CREATE PROCEDURE PrintScheduleForGroup -- Declaration of procedure
----Parameters:
--@group NVARCHAR(50)
--AS
--BEGIN
--	SELECT
--		[Дата] = [date],
--		[Время] = [time],
--		[День] = DATENAME(WEEKDAY, [date]),
--		[Группа] = group_name,
--		[Дисциплина] = discipline_name,
--		[Преподаватель] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
--		[Статус] = IIF(spent = 1, N'Проведено', N'Запланировано')
--	FROM Schedule, Groups, Disciplines, Teachers
--	WHERE [group] = group_id
--	AND discipline = discipline_id
--	AND teacher = teacher_id
--	AND group_name = @group;
--END
GO

------чтобы не было ошибки "уже существует в базе данных":
IF OBJECT_ID('sp_AddScheduleForStacionarGroup', 'P') IS NOT NULL
    DROP PROCEDURE sp_AddScheduleForStacionarGroup;
GO
------

CREATE PROC sp_AddScheduleForStacionarGroup
@start_date DATE,
@group_time TIME,
@group_name NVARCHAR(50),
@discipline_name NVARCHAR(256), 
@teacher_last_name NVARCHAR(150)
AS
BEGIN
    DECLARE @date AS DATE = @start_date;   
    DECLARE @time AS TIME = @group_time;
    DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = @group_name);
    DECLARE @discipline AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name);
    DECLARE @number_of_lessons AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline);
    DECLARE @teacher AS INT = (SELECT teacher_id FROM Teachers WHERE last_name = @teacher_last_name);

    DECLARE @lesson AS SMALLINT = 0;
    WHILE @lesson < @number_of_lessons
    BEGIN
        INSERT INTO Schedule ([date], [time], [group], discipline, teacher, spent)
        VALUES (@date, @time, @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0));
        SET @lesson = @lesson + 1;

        IF @lesson < @number_of_lessons
        BEGIN
            INSERT INTO Schedule ([date], [time], [group], discipline, teacher, spent)
            VALUES (@date, DATEADD(MINUTE, 90, @time), @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0));
            SET @lesson = @lesson + 1;
        END

        SET @date = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date) = 6, 3, 2), @date);
    END
END
GO
