USE PD_311_DDL;
GO

--SELECT field1, field2, ..., fieldN
--FROM Table1, Table2, ..., TableN;

SELECT 
		--������ �������:
		--last_name,		AS N'�������',
		--first_name,		AS N'���',
		--middle_name,		AS N'��������',
		---------------------------------------------------
		--������ �������: last_name + ' ' + first_name + ' ' middle_name AS N'�.�.�.',
		---------------------------------------------------
		--������ �������: [�.�.�.] = last_name + ' ' + first_name + ' ' + middle_name,
		---------------------------------------------------
		--�������� �������:

		[�.�.�.] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		birth_date			AS N'���� ��������'

FROM	Teachers
--WHERE	birth_date > '1990-01-01' --WHERE - ����� ������ ������� ������
--WHERE	first_name = N'������'
ORDER BY birth_date DESC; --ORDER BY - ����� ��������� � ������� ����������
						  --ASC - ���������� �� �����������
						  --DESC - ���������� �� ��������


