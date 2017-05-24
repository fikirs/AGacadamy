-- store procedures
-- from registeration to waiting list

insert into [waitinglist].[Biblestory 101] (courseid,studentid)
select courseid,studentid
 from [dbo].[Biblestory 101]
where num >= 26 --- not sure how to delete on the Biblestory 101 while adding on the waiting list

---from waiting list to registeration
insert into dbo.[Biblestory 101] (courseid, studentid)
select courseid, studentid 
from waitinglist.[Biblestory 101] --- not sure how to delete on the waiting list while adding on the Biblestory 101
/*

SELECT *,
       (SELECT AVG(c)
        FROM   (VALUES (testone),
						( testtwo),
						(testthree),
						( testfour))T (c)) AS [Average]
FROM   Grades.[Biblestory 101] */

--to calculate average (determine pass or fail).
select studentid ,courseid, average from (
SELECT *,
       (SELECT AVG(c)
        FROM   (VALUES (testone),
						( testtwo),
						(testthree),
						( testfour))T (c)) AS [Average]
FROM   Grades.[Biblestory 101] ) as A

----- pass or fail with teachers comment and average
select A.studentid,A.average, B.star from [average Biblestory101] A 
inner join dbo.evaluation B
on A.studentid = B.studentid
where B.star > 3 and A.average > 60

------ to drop a class
delete from dbo.[Biblestory 101] where studentid = @studentid --@studentid should be a parameter
-- have to create a table to corelate the table names and course 
------students' transcript