CREATE DATABASE BAITAPLON
GO
USE BAITAPLON
GO

CREATE TABLE admin (
	maad VARCHAR(50) PRIMARY KEY,
	username VARCHAR(50),
	password VARCHAR(50),
	name NVARCHAR(100),
	birthday DATE,
	gender NVARCHAR(10),
	phone CHAR(20),
	address NVARCHAR(255),
	email VARCHAR(50),
	adtype NVARCHAR(50),
	-- backspace + space
)
GO

INSERT INTO admin 
values( '01', 'phuc', 'phuc', 'phuc', '19990920', N'Nam', '0359008140', N'Thanh Hóa', 'phamduyphuc96@gmail.com', 'admin')

select * from admin


CREATE TABLE giaovien (
	magv VARCHAR(50) PRIMARY KEY,
	username VARCHAR(50),
	password VARCHAR(50),
	name NVARCHAR(100),
	birthday DATE,
	address NVARCHAR(255),
	phone CHAR(20),
	gender NVARCHAR(10),	
	email VARCHAR(50),
	qualifications NVARCHAR(50),
	n_salary FLOAT
)

insert into giaovien
values('01', 'phuc', 'phuc', 'phuc', '19990920', 'thanh hoa', '0359008140', 'nam', 'phamduyphuc95', 'khongbiet', 10)
select * from giaovien

delete from giaovien where magv = '01'

CREATE TABLE sinhvien (
	masv VARCHAR(50) PRIMARY KEY,
	username VARCHAR(50),
	password VARCHAR(50),
	name NVARCHAR(100),
	birthday DATE,
	address NVARCHAR(255),
	phone CHAR(20),
	magv VARCHAR(50), 
	gender NVARCHAR(10),
	email VARCHAR(50),
	Constraint fk_magv foreign key(magv) references giaovien(magv) ON DELETE CASCADE
)

insert into sinhvien
values('At14', 'phuc', 'phuc', 'phuc', '19990920', 'thanh hoa', '0359008140', '01', 'nam', 'phamduyphuc95')
select * from sinhvien

CREATE TABLE scores (
	masv VARCHAR(50) FOREIGN KEY REFERENCES dbo.sinhvien(masv) ON DELETE CASCADE,
	scores INT
)
GO

CREATE TABLE question (
	questionid	INT PRIMARY KEY IDENTITY(1,1),
	content NVARCHAR(255),
	correct NVARCHAR(255),
	answer_a NVARCHAR(255),
	answer_b NVARCHAR(255),
	answer_c NVARCHAR(255),
	answer_d NVARCHAR(255)
)
GO

CREATE TABLE sv_question (
	masv VARCHAR(50) FOREIGN KEY REFERENCES dbo.sinhvien(masv) ON DELETE CASCADE,
	questionid INT FOREIGN KEY REFERENCES dbo.question(questionid) ON DELETE CASCADE,
	answer NVARCHAR(100)
)
GO

INSERT INTO dbo.question
(
    content,
    correct,
    answer_a,
    answer_b,
    answer_c,
    answer_d
)
VALUES
(   
	N'If you ______ your money to mine, we shall have enough.', -- content - nvarchar(255)
	N'add', -- correct - nvarchar(255)
	N'add', -- answer_a - nvarchar(255)
	N'combine', -- answer_b - nvarchar(255)
	N'join', -- answer_c - nvarchar(255)
	N'unite'  -- answer_d - nvarchar(255)
),
(   
	N'I’ll phone as soon as I ______ to London.', -- content - nvarchar(255)
	N'get', -- correct - nvarchar(255)
	N'make', -- answer_a - nvarchar(255)
	N'get', -- answer_b - nvarchar(255)
	N'reach', -- answer_c - nvarchar(255)
	N'got'  -- answer_d - nvarchar(255)
)
