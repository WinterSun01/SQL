IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'PD_311_DDL')
BEGIN
    CREATE DATABASE PD_311_DDL 
    ON  
(
	NAME = PD_311_DDL_dat,
	FILENAME='D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PD_311_DDL.mdf',
	SIZE = 8MB, 
	MAXSIZE = 512MB, 
	FILEGROWTH = 8MB
)
LOG ON
(
	NAME = PD_311_DDL_log,
	FILENAME='D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PD_311_DDL.ldf',
	SIZE = 8MB,
	MAXSIZE = 512MB,
	FILEGROWTH = 8MB
);
END
