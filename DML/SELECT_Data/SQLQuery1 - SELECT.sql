USE PD_311_DDL;
GO

--SELECT field1, field2, ..., fieldN
--FROM Table1, Table2, ..., TableN;

SELECT 
		--первый вариант:
		--last_name,		AS N'Фамилия',
		--first_name,		AS N'Имя',
		--middle_name,		AS N'Отчество',
		---------------------------------------------------
		--второй вариант: last_name + ' ' + first_name + ' ' middle_name AS N'Ф.И.О.',
		---------------------------------------------------
		--третий вариант: [Ф.И.О.] = last_name + ' ' + first_name + ' ' + middle_name,
		---------------------------------------------------
		--четвёртый вариант:

		[Ф.И.О.] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		birth_date			AS N'Дата рождения'

FROM	Teachers
--WHERE	birth_date > '1990-01-01' --WHERE - чтобы сузить область поиска
--WHERE	first_name = N'Марина'
ORDER BY birth_date DESC; --ORDER BY - чтобы применить к запросу сортировку
						  --ASC - сортировка по возрастанию
						  --DESC - сортировка по убыванию


