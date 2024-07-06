create database db1;
create database if not exists db2;
show databases ;
drop database db2;
select database();
use db1;
show tables ;
create table student(
  id int,
  name varchar(10),
  gender char(1),
  birthday date,
  scor double,
  email varchar(64),
  tel varchar(20),
  state int #0正常，1休学，2毕业
);
desc student;
drop table student1;
drop table if exists student;
alter table student rename to student1;
alter table student1 add ader varchar(64);
alter table student1 modify ader int;
alter table student1 change ader adr varchar(64);
alter table student1 drop adr;
create table tb_student(
  id int,
  name varchar(10),
  gender char(1),
  birthday date,
  scor double,
  email varchar(64),
  tel varchar(20),
  state int #0正常，1休学，2毕业
);
alter table tb_student add remark varchar(20);
alter table tb_student modify remark varchar(100);
alter table tb_student rename to student;
alter table student change remark intro varchar(30);
alter table student drop intro;

create table stu(
  id int,
  name varchar(10),
  gender char(1),
  birthday date
);

insert into stu(id,name)values (1,'张三');
insert into stu(id, name, gender, birthday) values (2,'李四','男','2000-12-17');
insert into stu values (3,'王五','男','1999-10-10');
insert into stu (id,name)values (4,'北京'),(5,'上海'),(6,'天津');

drop table student;

create table student(
  id int,
  name varchar(10),
  age int,
  birthday date,
  sex char(1),
  address varchar(64)
);

insert into student (id,name,age,sex)values (1,'张三',20,'男');
insert into student(id,name,age,birthday,sex,address)values (2,'王五',23,'2001-10-10','男','中国');
insert into student values (3,'李四',24,'2000-1-1','男','中国');
insert into db1.student (id,name,age,birthday,sex,address)
values
(4,'赵六',22,'2000-2-12','男','中国'),
(5,'',55,'1959-1-1','男','中国');

update student set  sex='女' ;
update student set sex='男'where 1=1;
update student set sex='女' where id=2;
update student set age=26,address='北京' where id=3;

delete from student where id=5;
delete from student where id in (3,4);
delete from student where 1=1;
/*
delete与truncate的区别：
delete是逐行一行一行删除的
truncate是限制性drop table，再执行create table表（先删除表，再创建一张相同的表）
 */
truncate table student;
truncate table stu;

select * from db1.student;
select * from student where id=1;
select id,name from student where id=1;
select id,name from student;
select name as '姓名',age as '年龄'from student;
select distinct name,address from student;

CREATE TABLE student
(
    id      int,
    name    varchar(20),
    age     int,
    sex     varchar(5),
    address varchar(100),
    math    int,
    english int
);

drop table if exists student;

INSERT INTO student(id, NAME, age, sex, address, math, english)
VALUES (1, '马云', 55, '男', '杭州', 66, 78),
       (2, '马化腾', 45, '女', '深圳', 98, 87),
       (3, '马景涛', 55, '男', '香港', 56, 77),
       (4, '柳岩', 20, '女', '湖南', 76, 65),
       (5, '柳青', 20, '男', '湖南', 86, NULL),
       (6, '刘德华', 57, '男', '香港', 99, 99),
       (7, '马德', 22, '女', '香港', 99, 99),
       (8, '德玛西亚', 18, '男', '南京', 56, 65);

select id,name,age,sex,address,math,english
from student
where math>80;

select id,name,age,sex,address,math,english
from student
where english<=80||english is null;

select id,name,age,sex,address,math,english
from student
where english<=80||english is null;

select id,name,age,sex,address,math,english
from student
where age=20;

select id,name,age,sex,address,math,english
from student
where age!=20;

select id,name,age,sex,address,math,english
from student
where age<>18;

select id,name,age,sex,address,math,english
from student
where age>35&&sex='男';

select id,name,age,sex,address,math,english
from student
where id in(1,3,5);

select id,name,age,sex,address,math,english
from student
where id =1 ||id=3||id=5;

select id,name,age,sex,address,math,english
from student
where id not in(1,3,5);

select id,name,age,sex,address,math,english
from student
where age between 30 and 50;

select id,name,age,sex,address,math,english
from student
where name like '马%';

select id,name,age,sex,address,math,english
from student
where name like '马_';

select id,name,age,sex,address,math,english
from student
order by age desc ;

select id,name,age,sex,address,math,english
from student
order by age ;

select id,name,age,sex,address,math,english
from student
order by age desc ,math desc ;

select count(id) as '学生总数' from student;
select count(*) as '学生总数' from student;

select sum(math) as '数学成绩总分' from student;

select max(math) as '数学成绩最高分' from student;

select min(math) as '数学成绩最低分' from student;

select avg(math) as '数学成绩平均分' from student;

select sum(math)+sum(english) as '英数总分' from student;#1206
select sum(math+english) as '英数总分' from student;#1120，null+任意值=null
select sum(ifnull(math,0)+ifnull(english,0)) as '英数总分' from student;
/*
ifnull(a,b),如果a的值为null，则替换成b；
 */

 -- 车辆表
create table car
(
    id int,
    color char(2),
    price float
);
-- 测试数据
insert into car(id,color,price) values(1,'黄色',16);
insert into car(id,color,price) values(2,'黄色',16);
insert into car(id,color,price) values(3,'蓝色',5);
insert into car(id,color,price) values(4,'红色',60);
insert into car(id,color,price) values(5,'白色',8);
insert into car(id,color,price) values(6,'红色',60);

truncate table car;

select color,sum(price) as '总价'from car group by color;

select color,sum(price) as '总价'
from car
group by color
having sum(price)>30;

select color,sum(price) as '总价'
from car
group by color
having color='黄色';

select * from student limit 0,3;
select * from student limit 3,3;
select * from student limit 6,3;

select * from student limit 1,4;
/*执行顺序：
1.from
2.where
3.group by
4.having
5.select
6.order by
7.limit
 */

drop database beifen;

create database db4;

create table student2(
  id int primary key ,
  name varchar(30),
  age int
);

use db4;

create table student AS select * from db1.student;

alter table student add primary key (id);

alter table student drop primary key ;

insert into student2(id,name,age)values (1,'熊大',20);
insert into student2(id,name,age)values (1,'熊大',20);
insert into student2(id,name,age)values (null,'熊大',20);
insert into student2(name,age)values ('熊大',20);

alter table student2 drop primary key ;

alter table student2 add primary key (id);

create table student3(
  id int primary key auto_increment,
  name varchar(20)
);

insert into student3 (name) values ('张三');

delete from student3 where id=3;

alter table student3 auto_increment=100;

create table student4(
  id int primary key auto_increment,
  name varchar(20) unique
);

insert into student4(name) values ('张三');
insert into student4(name) values ('李四');
insert into student4(name) values (null);

create table student5(
  id int primary key auto_increment,
  name varchar(20) unique not null
);

insert into student5(name) values ('张三');
insert into student5(name) values ('李四');
insert into student5(name) values (null);

alter table student3 modify name varchar(20) not null ;
insert into student3(name) values ('李四');
insert into student3(name) values (null);

alter table student4 modify name varchar(20) unique ;
alter table student4 modify name varchar(20) not null ;

create table student6(
  id int primary key auto_increment,
  name varchar(20) not null unique ,
  address varchar(64) default '广州'
  #,
  #birthday date default now()
);

insert into student6 (id, name, address)values (null,'张三',null);
insert into student6 (id, name)values (null,'李四');

### 外键约束
# 部门表 （主表）
create table department (
    id int primary key auto_increment, -- 主键字段
    dep_name varchar(20),
    dep_location varchar(20)
);
-- 测试数据
insert into department (dep_name, dep_location) values
('研发部', '广州'),
('销售部', '深圳');

# 员工表 （从表）
create table employee(
  id int primary key auto_increment,
  name varchar(20),
  age int,
  dep_id int,
  constraint emp_depid_ref_dep_id_fk foreign key (dep_id) references department(id)
);
-- 测试数据
insert into employee (name, age, dep_id) values
('张三', 20, 1),
('李四', 21, 1),
('王五', 20, 1),
('老王', 20, 2),
('大王', 22, 2),
('小王', 18, 2);
insert into employee(name, age, dep_id) VALUES ('测试',20,10);

alter table employee drop foreign key emp_depid_ref_dep_id_fk;

alter table employee
  add
    constraint fk_emp_dep_id
      foreign key (dep_id) references department (id) on update cascade on delete cascade;

update department set id=10 where id=1;
delete from department where id=10;

create database db5;
use db5;

## 高级查询：多表查询
-- 创建部门表
CREATE TABLE dept (
    id INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(20)
);
-- 创建员工表
CREATE TABLE emp (
        id INT PRIMARY KEY AUTO_INCREMENT,
        NAME VARCHAR(10),
        gender CHAR(1),   -- 性别
        salary DOUBLE,   -- 工资
        join_date DATE,  -- 入职日期
        dept_id INT, -- 部门id(外键字段)
        foreign key(dept_id) references dept(id)-- 外键约束
);
-- 测试数据
INSERT INTO dept (NAME) VALUES
('开发部'),
('市场部'),
('财务部');
INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES
('孙悟空','男',7200,'2013-02-24',1),
('猪八戒','男',3600,'2010-12-02',2),
('唐僧','男',9000,'2008-08-08',2),
('白骨精','女',5000,'2015-10-07',3),
('蜘蛛精','女',4500,'2011-03-14',1);

select emp.id, emp.NAME, gender, salary, join_date, dept_id,
       dept.id,dept.NAME
from emp,dept;

select emp.id, emp.NAME, gender, salary, join_date, dept_id,
       dept.id,dept.NAME
from emp,dept
where dept_id=dept.id;

select emp.id, emp.NAME, gender, salary, join_date, dept_id,
       dept.id,dept.NAME
from emp,dept
where dept_id=dept.id&&emp.NAME='孙悟空';

select emp.id, emp.NAME, gender, salary,
       dept.NAME
from emp,dept
where emp.dept_id=dept.id&&emp.NAME='唐僧';

select emp.id, emp.NAME, gender, salary,
       dept.NAME
from emp inner join dept
on emp.dept_id = dept.id #on优先级高于where
where emp.NAME='唐僧';

select emp.id, emp.NAME, gender, salary,
       dept.NAME
from emp inner join dept
on emp.dept_id = dept.id
and emp.NAME='唐僧';

select e.id, e.NAME, gender, salary,
       d.NAME
from emp as e inner join dept as d
on e.dept_id = d.id
where e.NAME='唐僧';

select dept.NAME,
       emp.id, emp.NAME, gender, salary, join_date
from emp,dept
where dept_id=dept.id;

insert into dept(id,NAME) values (null,'行政部');

select dept.NAME,
       emp.id, emp.NAME, gender, salary, join_date
from dept left join emp
on dept_id=dept.id;

select emp.NAME,dept.NAME,
       emp.id,  gender, salary, join_date
from dept right join emp
on dept_id=dept.id;

select max(salary) from emp;

select emp.id, NAME, gender, emp.salary, join_date, dept_id
from emp,(select salary  from emp where salary>(select salary from emp where NAME='蜘蛛精')) as s
where emp.salary=s.salary;

select *
from emp
where salary=(select max(salary)from emp);

select *
from emp
where salary >(select salary from emp where NAME='蜘蛛精');

select id, NAME
from dept,(select dept_id from emp where salary>5000)as d
where id=d.dept_id;

select dept.id, dept.NAME,
       emp.id, emp.NAME, gender, salary, join_date, dept_id
from dept inner join emp
on dept.id = emp.dept_id and salary>5000;
#where dept.id in (select dept_id from emp where salary>5000);

select emp.id, emp.NAME, gender, salary, join_date, dept_id
from emp
where salary>(select max(salary) from emp where dept_id=1);

select max(salary) from emp where dept_id=1;

select emp.id, emp.NAME, gender, salary, join_date, dept_id
from emp
where salary> any (select salary from emp where dept_id=1);

select * from emp where join_date>'2011-1-1';

select a.id, a.NAME, a.gender, salary, join_date, dept_id,dept.NAME
from (select * from emp where join_date>'2011-1-1') as a left join dept
on a.dept_id=dept.id;

create database db3;
use db3;
create table account
(
  id    int primary key auto_increment,
  name  varchar(20),
  money double
);
insert into account
values (null, '小明', 1000);
insert into account
values (null, '翠花', 1000);

start transaction ;

update account set money=money-500 where name='小明';
update account set money=money+500 where name='翠花';

commit ;

rollback ;

select @@autocommit;

SELECT @@transaction_isolation;

select now();
select sysdate();
select curdate();
select curtime();
select year(curdate());
select month(curdate());
select date(curdate());
select week(now());
select hour(now());
select minute(now());
select second(now());

create table student(
  id int primary key auto_increment,
  name varchar(10) not null ,
  age int,
  gender char(1),
  birthday date,
  score double
);
insert into student (id, name, age, gender, birthday, score)
values (null,'赵六',24,'男','2000-1-12',92),
(null,'李四',24,'男','2000-2-14',92),
(null,'王五',24,'男','2000-5-15',92);

select name,month(birthday),day(birthday)
from student;

select name,concat(month(birthday),'月',day(birthday),'日')as "生日"
from student;

create table user(
  id int primary key auto_increment,
  name varchar(20) not null unique ,
  sex int default 0,
  age int
);

insert into user(id, name, sex, age)
values (null, '熊大', 2, 12),
       (null, '熊二', 1, 10);

select id,
       name,
       case sex
         when 2 then '女'
         when 1 then '男'
         else '未知'
         end as "性别",
       age
from user;

select id,
       name,
       case
         when sex=2 then '女'
         when sex=1 then '男'
         else '未知'
         end as gender,
       age
from user;

select char_length('hello');#字符串长度
select char_length(name)from user;
select concat('I ','am ','BaiYan \'s ','father');#连接字符串
select lower('Ii');#小写
select upper('Ii');#大写
select substr('BaiYan',3,2);#截取，索引从1开始，截取几位
select trim('  Bai  yan  ');#取出字符串前后空格

select rand();#随机数，范围0-1
select round('3.14159265358',4);#四舍五入
select truncate('3.14159265358',4);#截取位数
select least(11,5,2,5,9);#获取给定列表的最小值
select greatest(11,5,2,5,9);#获取给定列表的最大值

#查看性能
show global status like 'Innodb_rows%';

create database db2;

use db2;

-- 1. 准备表
CREATE TABLE `user`(
	id INT,
	username VARCHAR(32),
	`password` VARCHAR(32),
	sex VARCHAR(6),
	email VARCHAR(50)
);

-- 2. 创建存储过程，实现批量插入记录
DELIMITER $$ -- 声明存储过程的结束符号为$$
CREATE PROCEDURE auto_insert()
BEGIN
    DECLARE i INT DEFAULT 1;
	START TRANSACTION; -- 开启事务
    WHILE(i<=10000000)DO
        INSERT INTO `user` VALUES(i,CONCAT('jack',i),MD5(i),'male',CONCAT('jack',i,'@jensen.cn'));
        SET i=i+1;
    END WHILE;
	COMMIT; -- 提交
END$$ -- 声明结束
DELIMITER ; -- 重新声明分号为结束符号


-- 3. 查看存储过程
SHOW CREATE PROCEDURE auto_insert;

-- 4. 调用存储过程
CALL auto_insert();#6m

select * from user where id=22;#8s

alter table user add primary key (id);#1m39s

select * from user where id=22;#32ms
select * from user where id=88888;#25ms
select * from user where username='jack1234567';#9s

create table student2(
  id int primary key auto_increment,
  name varchar(32),
  telephone varchar(11) unique ,
  sex char(1),
  birthday date
);

create index idx_student2_name on student2(name);