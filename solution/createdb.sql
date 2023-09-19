create database Examination2
on primary
(
	Name='Examination2_pri',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Examination2_pri.mdf',
	SIZE=10MB,
	maxsize=100MB,
	FILEGROWTH=1MB
),
filegroup Examination_FG
( NAME = 'Examination2_Data',
    FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Examination2_Data.ndf',
    SIZE = 10MB,
    MAXSIZE=100MB,
    FILEGROWTH=1MB
)
LOG ON
( NAME='Examination2_log',
    FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Examination2_log.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB
);