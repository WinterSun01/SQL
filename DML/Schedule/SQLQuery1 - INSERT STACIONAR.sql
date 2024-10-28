USE PD_311_DDL;
GO

DECLARE @start_date AS DATE = '2023-11-27';
DECLARE @date AS DATE = @start_date;
DECLARE @time AS TIME = '14:30';
DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = N'PD_212');
DECLARE @discipline AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL Server%');
DECLARE @number_of_lessons AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE '%MS SQL Server%');
DECLARE @teacher AS INT = (SELECT teacher_id FROM Teachers WHERE last_name = N'�������');

PRINT	(@group)
PRINT	@discipline
PRINT	@teacher

DECLARE @lesson AS SMALLINT = 0;
WHILE @lesson < @number_of_lessons
BEGIN
    --�������� �� ������������� ������ ����� ��������
    IF NOT EXISTS 
	(
        SELECT 1 
        FROM Schedule 
        WHERE [date] = @date 
          AND [time] = @time 
          AND [group] = @group 
          AND discipline = @discipline 
          AND teacher = @teacher
    )

    BEGIN

	--PRINT(FORMATMESSAGE(N'%s %s', N'����:', CAST(@date AS NVARCHAR(50))));
	--PRINT(FORMATMESSAGE(N'%s %s', N'����:', DATENAME(WEEKDAY, @date)));
	--PRINT(FORMATMESSAGE(N'%s %s', N'�����:', CAST(@time AS NVARCHAR(50))));
	--PRINT(FORMATMESSAGE(N'%s %i', N'���� �:', @lesson));

        INSERT Schedule ([date], [time], [group], discipline, teacher, spent)
        VALUES (@date, @time, @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0));
    END

    SET @lesson = @lesson + 1;

    IF @lesson < @number_of_lessons
    BEGIN
        --�������� �� ������������� ������ ����� ��������
        IF NOT EXISTS 
		(
            SELECT 1 
            FROM Schedule 
            WHERE [date] = @date 
              AND [time] = DATEADD(MINUTE, 90, @time) 
              AND [group] = @group 
              AND discipline = @discipline 
              AND teacher = @teacher
        )
        BEGIN

	--PRINT(FORMATMESSAGE(N'%s %s', N'����:', CAST(@date AS NVARCHAR(50)))); 
	--PRINT(FORMATMESSAGE(N'%s %s', N'�����:', CAST(DATEADD(MINUTE, 90, @time) AS NVARCHAR(50))));
	--PRINT(FORMATMESSAGE(N'%s %i', N'���� �:', @lesson));

            INSERT Schedule ([date], [time], [group], discipline, teacher, spent)
            VALUES (@date, DATEADD(MINUTE, 90, @time), @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0));
        END

        SET @lesson = @lesson + 1;
    END

    SET @date = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date) = 6, 3, 2), @date);
	PRINT('-------------------------------------')
END
GO

--�������� ���������� � �������
;WITH CTE AS 
(
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY [date], [time], [group], discipline, teacher ORDER BY (SELECT NULL)) AS rn
    FROM Schedule
)
DELETE FROM CTE WHERE rn > 1;

SELECT
    [����] = [date],
    [�����] = [time],
    [����] = DATENAME(WEEKDAY, [date]),
    [������] = group_name,
    [����������] = discipline_name,
    [�������������] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
    [������] = IIF(spent = 1, N'�������', N'������������')
FROM	Schedule, Groups, Disciplines, Teachers
WHERE	[group]=group_id
AND		discipline=discipline_id
AND		teacher=teacher_id;

--SELECT * FROM Teachers;
--SELECT * FROM Disciplines;
