USE PD_311;
GO

SELECT 
		--last_name,		AS N'�������',
		--first_name,		AS N'���',
		--middle_name,		AS N'��������',
		---------------------------------------------------
		--last_name + ' ' + first_name + ' ' middle_name AS N'�.�.�.',
		--[�.�.�.] = last_name + ' ' + first_name + ' ' + middle_name,
		[�.�.�.] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		birth_date			AS N'���� ��������',
FROM	Teachers;
--WHERE	birth_date = N'������'
--WHERE	first_name = N'������'
ORDER BY birth_date DESC; 

--SELECT field1, field2, ..., fieldN
--FROM Table1, Table2, ..., TableN;