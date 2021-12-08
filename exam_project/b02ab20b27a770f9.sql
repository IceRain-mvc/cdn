-- 1、查询"01"课程比"02"课程成绩高的学生的信息及课程分数
-- select s.sid,s.sname,s.sage,s.ssex,sc1.score,sc2.score from student s,sc sc1,sc sc2 where sc1.cid=1 and sc2.cid=2 and sc1.score>sc2.score and sc1.sid=sc2.sid and s.sid=sc1.sid;

-- 1-1、查询同时存在"01"课程和"02"的课程的情况
-- select s.* from student s,sc sc1,sc sc2 where s.sid=sc1.sid and sc1.sid=sc2.sid and sc1.cid=1 and sc2.cid=2;

-- 1-2查询存在"01"但是课程但可能不存在"02"的课程的情况
-- select distinct s.* from student s,sc sc1,sc sc2,sc sc3 where s.sid=sc1.sid and sc1.sid=sc2.sid and sc1.cid=1 and sc2.cid!=2;



-- 22、查询名字中含有"风"字的学生信息
-- select * from student where Sname like "%⻛%";

-- 27、查询课程名称为"数学"，且分数低于60的学生姓名和分数
-- select Sname,score from student course,sc where course.Sid=sc.Sid and Cid="02" and score<60;

-- 28、查询所有学生的课程及分数情况(存在学生没成绩,没选课的情况)；
-- select Sname,Cname,score from student,sc,course where sc.Cid=course.Cid and sc.Sid=student.Sid;

-- 10、查询没学过"张三"老师授课的同学的信息
-- select s.* from student s where s.Sid not in(select sc1.Sid from sc sc1,course c,teacher t where t.Tid=c.Tid and sc1.Cid=c.Cid and t.Tname="张三");

-- 6、查询学过"张三"老师授课的同学的信息
-- select s.* from student s where s.Sid not in(select sc1.Sid from sc sc1,course c,teacher t where t.Tid !=c.Tid and sc1.Cid =c.Cid and t.Tname ="张三");

-- 7、查询没有学全所有课程的同学的信息 
-- select s.* from student s where s.Sid not in(select sc1.Sid from sc sc1,sc sc2,sc sc3 where sc1.Cid=1 and sc2.Cid=2 and sc3.Cid =3 and sc1.Sid=sc2.Sid and sc1.Sid=sc3.Sid);

-- 8、查询至少有一门课与学号为"01"的同学所学相同的同学的信息
-- select distinct s.* from student s,sc sc1 where s.Sid=sc1.Sid and sc1.Cid in(select Cid from sc where Sid=1) and s.Sid<> 1;
-- 
-- 9、查询和"01"号的同学学习的课程完全相同的其他同学的信息(没出来)
-- select s.* from student s where s.Sid in(select distinct sc.Sid from sc where Sid<>1 and sc.Cid in(select distinct Cid from sc where Sid=1)group by sc.Sid having count(1)=(select count(1) from sc where s.Sid=1));
-- 
-- 10、查询没学过"张三"老师讲授的任一门课程的学生姓名
-- select s.* from student s where s.Sid not in(select sc1.Sid from sc sc1,course c,teacher t where sc1.Cid=c.Cid and c.Tid=t.Tid and t.Tname="张三");
-- 
-- 20、查询出只有两门课程的全部学生的学号和姓名（没出来）
-- select s.* from student s,sc group by sc.Sid having count(sc.Sid) = 2 AND s.Sid=sc.Sid;
-- 
-- 24、查询1990年出生的学生名单
-- select * from student where Sage>="1990-01-01 00:00:00" AND Sage<="1990-12-31 00:00:00";
-- SELECT * FROM student s WHERE s.Sage LIKE "1990-%"

-- 25、查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
-- select sc.Cid,avg(score) from sc group by sc.Cid order by avg(score) DESC , sc.Cid;


-- 29、查询任何一门课程成绩在70分以上的姓名、课程名称和分数；
-- select s.sname,c.cname,score from student s,sc,course c where s.sid=sc.sid and sc.cid=c.cid and score>70;
