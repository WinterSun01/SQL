USE PD_311_2;
GO

SELECT
		[�.�.�.] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
		[����������] = discipline_name
FROM	Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher = teacher_id
AND		discipline = discipline_id
AND		discipline_name LIKE '%SQL%';
--ORDER BY [����������] DESC;