USE PD_311_DDL;
GO

SELECT
		[�.�.�.] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
		--[������] = group_name,
		[����������� ��������] = direction_name
FROM	Students, Groups, Directions
WHERE	[group] = group_id
AND		direction = direction_id
AND		direction_name = N'Java BackEnd Development';
