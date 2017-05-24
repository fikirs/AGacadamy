Create Database AGAcademy
GO
use AGAcademy
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_courseoffsered_course]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[courseoffsered] DROP CONSTRAINT FK_courseoffsered_course
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_prerequisites_courseoffsered]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[prerequisites] DROP CONSTRAINT FK_prerequisites_courseoffsered
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_coursetaken_student]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[coursetaken] DROP CONSTRAINT FK_coursetaken_student
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_enrollment_student]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[enrollment] DROP CONSTRAINT FK_enrollment_student
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[course]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[course]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[courseoffsered]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[courseoffsered]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[coursetaken]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[coursetaken]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[enrollment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[enrollment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[prerequisites]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[prerequisites]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[registereduser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[registereduser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[role]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[role]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[student]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[student]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[userrole]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[userrole]
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[course]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[course] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[credit] [int] NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[courseoffsered]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[courseoffsered] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[seattaken] [int] NOT NULL ,
	[capacity] [int] NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[coursetaken]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[coursetaken] (
	[studentid] [int] NOT NULL ,
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[grade] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[snum] [int] NOT NULL 
) ON [PRIMARY]
END

GO
 
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[enrollment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[enrollment] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL ,
	[sectionnum] [int] NOT NULL ,
	[cnum] [int] NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[prerequisites]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[prerequisites] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[prereq] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cnum] [int] NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[registereduser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[registereduser] (
	[userid] [int] NOT NULL ,
	[name] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[password] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[role]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[role] (
	[roleid] [int] NOT NULL ,
	[role] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[student]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[student] (
	[studentid] [int] NOT NULL ,
	[firstname] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lastname] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[address] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [int] NULL ,
	[major] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[userrole]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[userrole] (
	[userid] [int] NOT NULL ,
	[roleid] [int] NOT NULL 
) ON [PRIMARY]
END

GO

ALTER TABLE [dbo].[course] WITH NOCHECK ADD 
	CONSTRAINT [PK_course] PRIMARY KEY  CLUSTERED 
	(
		[courseid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[courseoffsered] WITH NOCHECK ADD 
	CONSTRAINT [PK_courseoffsered] PRIMARY KEY  CLUSTERED 
	(
		[courseid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[coursetaken] WITH NOCHECK ADD 
	CONSTRAINT [PK_coursetaken] PRIMARY KEY  CLUSTERED 
	(
		[studentid],
		[courseid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[enrollment] WITH NOCHECK ADD 
	CONSTRAINT [PK_enrollment] PRIMARY KEY  CLUSTERED 
	(
		[courseid],
		[studentid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[prerequisites] WITH NOCHECK ADD 
	CONSTRAINT [PK_prerequisites] PRIMARY KEY  CLUSTERED 
	(
		[courseid],
		[prereq]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[registereduser] WITH NOCHECK ADD 
	CONSTRAINT [PK_registereduser] PRIMARY KEY  CLUSTERED 
	(
		[name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[role] WITH NOCHECK ADD 
	CONSTRAINT [PK_role] PRIMARY KEY  CLUSTERED 
	(
		[roleid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[student] WITH NOCHECK ADD 
	CONSTRAINT [PK_student] PRIMARY KEY  CLUSTERED 
	(
		[studentid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[courseoffsered] ADD 
	CONSTRAINT [FK_courseoffsered_course] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
GO

ALTER TABLE [dbo].[coursetaken] ADD 
	CONSTRAINT [FK_coursetaken_student] FOREIGN KEY 
	(
		[studentid]
	) REFERENCES [dbo].[student] (
		[studentid]
	)
GO

ALTER TABLE [dbo].[enrollment] ADD 
	CONSTRAINT [FK_enrollment_student] FOREIGN KEY 
	(
		[studentid]
	) REFERENCES [dbo].[student] (
		[studentid]
	)
GO

ALTER TABLE [dbo].[prerequisites] ADD 
	CONSTRAINT [FK_prerequisites_courseoffsered] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
GO
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
---NEW CODE
CREATE TABLE [dbo].[Teacher] (
	[teacherid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstname] [char] (10)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lastname] [char] (10)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[email][char] (20)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[phone] [int] 
	)

create table dbo.evaluation(
[teacherid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
[studentid] [int] not null, 
[star] [int] ,
[comment] [varchar] (100)
)

CREATE TABLE [dbo].[Language 101] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)
	

CREATE TABLE [dbo].[Language 102] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)
	

CREATE TABLE [dbo].[Language 201] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)


CREATE TABLE [dbo].[Language 202] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)


CREATE TABLE [dbo].[Language 301] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)
	
CREATE TABLE [dbo].[Language 302] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)
	
	
CREATE TABLE [dbo].[Tselot 101] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)
	

CREATE TABLE [dbo].[Tselot 102] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)


CREATE TABLE [dbo].[Tselot 201] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)


CREATE TABLE [dbo].[Ge'ez] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Kedase 101] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Kedase 102] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Kedase 201] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Kedase 202] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Biblestory 101] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Biblestory 102] (
	[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)

CREATE TABLE [dbo].[Biblestory 103] (
		[courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL)
	

alter table [Biblestory 101]
add num int identity (1,1)
alter table [Biblestory 102]
add num int identity (1,1)
alter table [Biblestory 103]
add num int identity (1,1)
alter table [Kedase 101]
add num int identity (1,1)
alter table [Kedase 102]
add num int identity (1,1)
alter table [Kedase 201]
add num int identity (1,1)
alter table [Kedase 202]
add num int identity (1,1)
alter table [Language 101]
add num int identity (1,1)
alter table [Language 102]
add num int identity (1,1)
alter table [Language 201]
add num int identity (1,1)
alter table [Language 202]
add num int identity (1,1)
alter table [Language 301]
add num int identity (1,1)
alter table [Language 302]
add num int identity (1,1)
alter table [Tselot 101]
add num int identity (1,1)
alter table [Tselot 102]
add num int identity (1,1)
alter table [Tselot 201]
add num int identity (1,1)
alter table [Ge'ez]
add num int identity (1,1)

alter table [student]
add email char(30),
[baptismal name] char (20),
BirthYear int , 
parentsname char (30)


ALTER TABLE [dbo].[Biblestory 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredb] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
	
ALTER TABLE [dbo].[Biblestory 101] ADD 
	CONSTRAINT [FK_prerequisites_courseb] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
	
ALTER TABLE [dbo].[Biblestory 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredb2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Biblestory 102] ADD 
	CONSTRAINT [FK_prerequisites_courseb2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [dbo].[Biblestory 103] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredb3] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Biblestory 103] ADD 
	CONSTRAINT [FK_prerequisites_courseb3] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)


ALTER TABLE [dbo].[Kedase 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredk] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Kedase 101] ADD 
	CONSTRAINT [FK_prerequisites_coursek] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Kedase 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredk2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Kedase 102] ADD 
	CONSTRAINT [FK_prerequisites_coursek2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [dbo].[Kedase 201] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredk201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Kedase 201] ADD 
	CONSTRAINT [FK_prerequisites_coursek201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Kedase 202] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredk202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Kedase 202] ADD 
	CONSTRAINT [FK_prerequisites_coursek202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [dbo].[Language 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredl101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 101] ADD 
	CONSTRAINT [FK_prerequisites_coursel101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredl102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 102] ADD 
	CONSTRAINT [FK_prerequisites_coursel102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 201] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredl201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 201] ADD 
	CONSTRAINT [FK_prerequisites_coursel201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 202] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredl202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 202] ADD 
	CONSTRAINT [FK_prerequisites_coursel202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 301] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredl301] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 301] ADD 
	CONSTRAINT [FK_prerequisites_coursel301] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Language 302] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredl302] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Tselot 101] ADD 
	CONSTRAINT [FK_prerequisites_courset101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Tselot 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredt101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Tselot 102] ADD 
	CONSTRAINT [FK_prerequisites_courset102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [dbo].[Tselot 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredt102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)

ALTER TABLE [dbo].[Tselot 201] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredt201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Tselot 201] ADD 
	CONSTRAINT [FK_prerequisites_courset201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [dbo].[Ge'ez] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredg] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [dbo].[Ge'ez] ADD 
	CONSTRAINT [FK_prerequisites_coursetg] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [dbo].[Teacher] ADD 
	CONSTRAINT [PK_teacherid] PRIMARY KEY  CLUSTERED 
	(
		[teacherid]
	)  ON [PRIMARY] 

alter table dbo.evaluation add
constraint [FK_teacher_evaluation] foreign key
( [teacherid])
references dbo.teacher ([teacherid])

alter table dbo.evaluation add constraint [FK_student_evaluation] foreign key
([studentid]) references dbo.student ([studentid])

CREATE SCHEMA Grades; 

CREATE TABLE [Grades].[grade lang 101]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[grade lang 102]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[grade lang 201]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[grade lang 202]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[grade lang 301]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[grade lang 302]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Biblestory 101]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Biblestory 102]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Biblestory 103]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Kedase 101]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Kedase 102]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Kedase 201]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Kedase 202]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Ge'ez]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
	)
CREATE TABLE [Grades].[Tselot 101]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Tselot 102]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)
CREATE TABLE [Grades].[Tselot 201]
(   [courseid] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[studentid] [int] NOT NULL,
	[testone] [int] null, 
	[testtwo] [int] null,
	[testthree] [int] null,
	[testfour] [int] null
)

ALTER TABLE [Grades].[Biblestory 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgb] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Biblestory 101] ADD 
	CONSTRAINT [FK_prerequisites_coursegb] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Biblestory 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgb2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Biblestory 102] ADD 
	CONSTRAINT [FK_prerequisites_coursegb2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Biblestory 103] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgb3] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Biblestory 103] ADD 
	CONSTRAINT [FK_prerequisites_coursegb3] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgk] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 101] ADD 
	CONSTRAINT [FK_prerequisites_coursegk] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgk2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 102] ADD 
	CONSTRAINT [FK_prerequisites_coursegk2] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [Grades].[Kedase 201] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgk201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 201] ADD 
	CONSTRAINT [FK_prerequisites_coursegk201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 202] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgk202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Kedase 202] ADD 
	CONSTRAINT [FK_prerequisites_coursegk202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)

ALTER TABLE [Grades].[grade lang 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgl101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 101] ADD 
	CONSTRAINT [FK_prerequisites_coursegl101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgl102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 102] ADD 
	CONSTRAINT [FK_prerequisites_coursegl102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 201] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgl201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 201] ADD 
	CONSTRAINT [FK_prerequisites_coursegl201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 202] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgl202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 202] ADD 
	CONSTRAINT [FK_prerequisites_coursegl202] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 301] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgl301] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 301] ADD 
	CONSTRAINT [FK_prerequisites_coursegl301] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 302] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgl302] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[grade lang 302] ADD 
	CONSTRAINT [FK_prerequisites_coursegl302] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Tselot 101] ADD 
	CONSTRAINT [FK_prerequisites_coursegt101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)	
ALTER TABLE [Grades].[Tselot 101] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgt101] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Tselot 102] ADD 
	CONSTRAINT [FK_prerequisites_coursegt102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Tselot 102] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgt102] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Tselot 201] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgt201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Tselot 201] ADD 
	CONSTRAINT [FK_prerequisites_coursegt201] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Ge'ez] ADD 
	CONSTRAINT [FK_prerequisites_courseoffseredgg] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[courseoffsered] (
		[courseid]
	)
ALTER TABLE [Grades].[Ge'ez] ADD 
	CONSTRAINT [FK_prerequisites_coursetgg] FOREIGN KEY 
	(
		[courseid]
	) REFERENCES [dbo].[course] (
		[courseid]
	)
ALTER TABLE [Grades].[Biblestory 101] ADD
constraint [FK_student_GradesB101] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Biblestory 102] ADD
constraint [FK_student_GradesB102] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Biblestory 103] ADD
constraint [FK_student_GradesB103] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Ge'ez] ADD
constraint [FK_student_Gradesg] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[grade lang 101] ADD
constraint [FK_student_Gradesl101] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[grade lang 102] ADD
constraint [FK_student_Gradesl102] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[grade lang 201] ADD
constraint [FK_student_Gradesl201] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[grade lang 202] ADD
constraint [FK_student_Gradesl202] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[grade lang 301] ADD
constraint [FK_student_Gradesl301] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[grade lang 302] ADD
constraint [FK_student_Gradesl302] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Kedase 101] ADD
constraint [FK_student_Gradesk101] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Kedase 102] ADD
constraint [FK_student_Gradesk102] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Kedase 201] ADD
constraint [FK_student_Gradesk201] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Kedase 202] ADD
constraint [FK_student_Gradesk202] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Tselot 101] ADD
constraint [FK_student_Gradest101] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Tselot 102] ADD
constraint [FK_student_Gradest102] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
ALTER TABLE [Grades].[Tselot 201] ADD
constraint [FK_student_Gradest201] FOREIGN KEY
([studentid])
REFERENCES [dbo].[student]
([studentid])
