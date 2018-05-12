# create database db_school;
# use db_school;
#
# create table class(
#   cid int primary key auto_increment,
#   caption char(20) not null
# );
# create table student(
#   sid int primary key auto_increment,
#   sname char(16) not null ,
#   gender enum('男','女') not null default '男',
#   class_id int not null ,
#   foreign key (class_id) references class(cid)
# );
#
# create table teacher(
#   tid int primary key auto_increment,
#   tname char(16) not null
# );
# create table course(
#   cid int primary key auto_increment,
#   cname char(20) not null ,
#   teacher_id int not null ,
#   foreign key (teacher_id) references teacher(tid)
# );
# create table score(
#   sid int primary key auto_increment,
#   student_id int not null ,
#   course_id int not null ,
#   num int not null ,
#   foreign key (student_id) references student(sid),
#   foreign key (course_id) references course(cid)
# );
#


# 1
select c.cname,t.tname
from course as c join teacher t
on
c.teacher_id = t.tid
;
# 2
select gender,count(sid)
from student
group by gender;
# 3
select stu.sname
from student as stu
join score s on stu.sid = s.student_id
join course c on s.course_id = c.cid
where c.cname = '物理' and s.num=100
;
# 4
select stu.sname
from student as stu
join score s on stu.sid = s.student_id
group by s.student_id
having avg(s.num) >80
;
# 5
select stu.sid,stu.sname,count(s.course_id),sum(num)
from student as stu
join score s on stu.sid = s.student_id
group by s.student_id
;
# 6
select count(*)
from teacher
where tname like '李%'
;
# 7!!!!!!
select stu.sname
from student stu
join score s on stu.sid = s.student_id
join course c on s.course_id = c.cid
join teacher t on c.teacher_id = t.tid
where t.tname != '李平'
;
-- -----------------------
select stu.sname
from student stu
join score s on stu.sid = s.student_id
where s.course_id in
      (select c.cid
from course c
join teacher t on c.teacher_id = t.tid
where t.tname != '李平')
group by s.student_id
;
# 8
select t1.student_id from
(select s.student_id,s.num
from score s
join course c on s.course_id = c.cid
where c.cname ='物理'
) as t1
join
(select s.student_id,s.num
from score s
join course c on s.course_id = c.cid
where c.cname ='生物'
) as t2
where t1.num>t2.num
;

select t1.student_id
  from
    (
      select student_id,num
      from
        score
      where
        course_id = (select cid
                     from
                       course
                     where
                       cname = '物理')
    ) as t1
  join
    (
      select student_id,num
      from
        score
      where
        course_id = (select cid
                     from
                       course
                     where
                       cname = '生物')
    ) as t2
  on
      t1.student_id =t2.student_id
  where t1.num > t2.num

;
# 8
select t1.student_id from
(select s.student_id,s.num
from score s
join course c on s.course_id = c.cid
where c.cname ='物理'
) as t1
join
(select s.student_id,s.num
from score s
join course c on s.course_id = c.cid
where c.cname ='生物'
) as t2
where t1.num>t2.num
group by
  t1.student_id
;
# 8
SELECT
    t1.student_id
FROM
    (
        SELECT
            student_id,
            num
        FROM
            score
        WHERE
            course_id = (
                SELECT
                    cid
                FROM
                    course
                WHERE
                    cname = '物理'
            )
    ) AS t1
INNER JOIN (
    SELECT
        student_id,
        num
    FROM
        score
    WHERE
        course_id = (
            SELECT
                cid
            FROM
                course
            WHERE
                cname = '生物'
        )
) AS t2 ON t1.student_id = t2.student_id
WHERE
    t1.num > t2.num;

# 9# 9
#
select
  student.sname
from
  student s
where
  s.sid in (
    select
      student_id
    from
      score
    where
      course_id in (
        select
          cid
        from
          course
        where
          cname ='物理'
        or cname ='体育'
      )
    group by
      student_id
    having
      count(course_id) =1
  );

# 10
select
  student.sname,
  c.caption
from
  student
join
  (select
    score.student_id
  from
    score
  where
    score.num < 60
  group by
    student_id
  having
    count(student_id)>1) as t1
on student.sid = t1.student_id
inner join
  class c
on
  student.class_id = c.cid

