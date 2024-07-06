# SQL-Learning
本文涵盖了MySQL中常见的数据库和表操作、数据插入、更新、删除、查询以及一些高级功能。通过这些示例，您可以快速掌握MySQL的基本用法并应用于实际项目中。
好的，下面是一个包含上述 SQL 操作的 README 文件示例，用中文编写：


# 数据库操作指南

## 目录
- [创建数据库](#创建数据库)
- [表操作](#表操作)
- [数据插入](#数据插入)
- [数据修改](#数据修改)
- [数据删除](#数据删除)
- [高级查询](#高级查询)
- [事务管理](#事务管理)
- [日期和时间函数](#日期和时间函数)
- [字符串函数](#字符串函数)
- [数学函数](#数学函数)
- [性能监控](#性能监控)
- [存储过程](#存储过程)

## 创建数据库
```sql
-- 创建新数据库
CREATE DATABASE db1;

-- 如果数据库不存在，则创建数据库
CREATE DATABASE IF NOT EXISTS db2;

-- 显示所有数据库
SHOW DATABASES;

-- 删除数据库
DROP DATABASE db2;

-- 选择当前数据库
SELECT DATABASE();

-- 使用特定数据库
USE db1;
```

## 表操作
```sql
-- 创建新表
CREATE TABLE student(
  id INT,
  name VARCHAR(10),
  gender CHAR(1),
  birthday DATE,
  score DOUBLE,
  email VARCHAR(64),
  tel VARCHAR(20),
  state INT -- 0: 正常, 1: 休学, 2: 毕业
);

-- 描述表结构
DESC student;

-- 如果表存在，则删除表
DROP TABLE IF EXISTS student;

-- 重命名表
ALTER TABLE student RENAME TO student1;

-- 向表中添加新列
ALTER TABLE student1 ADD ader VARCHAR(64);

-- 修改列的数据类型
ALTER TABLE student1 MODIFY ader INT;

-- 修改列名和数据类型
ALTER TABLE student1 CHANGE ader adr VARCHAR(64);

-- 删除列
ALTER TABLE student1 DROP adr;
```

## 数据插入
```sql
-- 插入数据
INSERT INTO stu(id, name) VALUES (1, '张三');
INSERT INTO stu(id, name, gender, birthday) VALUES (2, '李四', '男', '2000-12-17');
INSERT INTO stu VALUES (3, '王五', '男', '1999-10-10');
INSERT INTO stu(id, name) VALUES (4, '北京'), (5, '上海'), (6, '天津');

-- 插入多条数据
INSERT INTO student(id, name, age, sex) VALUES (1, '张三', 20, '男');
INSERT INTO student(id, name, age, birthday, sex, address) VALUES (2, '王五', 23, '2001-10-10', '男', '中国');
INSERT INTO student VALUES (3, '李四', 24, '2000-1-1', '男', '中国');
```

## 数据修改
```sql
-- 更新数据
UPDATE student SET sex='女';
UPDATE student SET sex='男' WHERE 1=1;
UPDATE student SET sex='女' WHERE id=2;
UPDATE student SET age=26, address='北京' WHERE id=3;
```

## 数据删除
```sql
-- 删除数据
DELETE FROM student WHERE id=5;
DELETE FROM student WHERE id IN (3, 4);
DELETE FROM student WHERE 1=1;

-- 清空表数据
TRUNCATE TABLE student;
TRUNCATE TABLE stu;
```

## 高级查询
```sql
-- 简单选择
SELECT * FROM student WHERE id=1;
SELECT id, name FROM student WHERE id=1;
SELECT id, name FROM student;
SELECT name AS '姓名', age AS '年龄' FROM student;
SELECT DISTINCT name, address FROM student;

-- 聚合函数
SELECT COUNT(id) AS '学生总数' FROM student;
SELECT SUM(math) AS '数学成绩总分' FROM student;
SELECT MAX(math) AS '数学成绩最高分' FROM student;
SELECT MIN(math) AS '数学成绩最低分' FROM student;
SELECT AVG(math) AS '数学成绩平均分' FROM student;

-- 分组查询
SELECT color, SUM(price) AS '总价' FROM car GROUP BY color;
SELECT color, SUM(price) AS '总价' FROM car GROUP BY color HAVING SUM(price) > 30;
SELECT color, SUM(price) AS '总价' FROM car GROUP BY color HAVING color = '黄色';

-- 分页查询
SELECT * FROM student LIMIT 0, 3;
SELECT * FROM student LIMIT 3, 3;
SELECT * FROM student LIMIT 6, 3;
```

## 事务管理
```sql
-- 启动事务
START TRANSACTION;

-- 提交事务
COMMIT;

-- 回滚事务
ROLLBACK;
```

## 日期和时间函数
```sql
SELECT NOW();
SELECT SYSDATE();
SELECT CURDATE();
SELECT CURTIME();
SELECT YEAR(CURDATE());
SELECT MONTH(CURDATE());
SELECT DATE(CURDATE());
SELECT WEEK(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());
```

## 字符串函数
```sql
SELECT CHAR_LENGTH('hello'); -- 字符串长度
SELECT CHAR_LENGTH(name) FROM user;
SELECT CONCAT('I ', 'am ', 'BaiYan\'s ', 'father'); -- 连接字符串
SELECT LOWER('Ii'); -- 小写
SELECT UPPER('Ii'); -- 大写
SELECT SUBSTR('BaiYan', 3, 2); -- 截取字符串，从第3个字符开始，截取2个字符
SELECT TRIM('  Bai  yan  '); -- 去除字符串前后的空格
```

## 数学函数
```sql
SELECT RAND(); -- 随机数，范围0-1
SELECT ROUND('3.14159265358', 4); -- 四舍五入，保留4位小数
SELECT TRUNCATE('3.14159265358', 4); -- 截取位数，保留4位小数
SELECT LEAST(11, 5, 2, 5, 9); -- 获取给定列表的最小值
SELECT GREATEST(11, 5, 2, 5, 9); -- 获取给定列表的最大值
```

## 性能监控
```sql
SHOW GLOBAL STATUS LIKE 'Innodb_rows%';
```

## 存储过程
```sql
-- 创建存储过程，实现批量插入记录
DELIMITER $$ -- 声明存储过程的结束符号为 $$
CREATE PROCEDURE auto_insert()
BEGIN
    DECLARE i INT DEFAULT 1;
    START TRANSACTION; -- 开启事务
    WHILE (i <= 10000000) DO
        INSERT INTO `user` VALUES (i, CONCAT('jack', i), MD5(i), 'male', CONCAT('jack', i, '@jensen.cn'));
        SET i = i + 1;
    END WHILE;
    COMMIT; -- 提交事务
END$$ -- 声明结束
DELIMITER ; -- 重新声明分号为结束符号

-- 调用存储过程
CALL auto_insert();
```

## 示例查询
```sql
-- 简单查询
SELECT * FROM user WHERE id = 22;

-- 添加主键
ALTER TABLE user ADD PRIMARY KEY (id);

-- 带主键查询
SELECT * FROM user WHERE id = 22;
SELECT * FROM user WHERE id = 88888;
SELECT * FROM user WHERE username = 'jack1234567';
```
```

这个 README 文件包含了创建数据库和表、插入、更新和删除数据、查询操作、事务管理、日期和时间函数、字符串函数、数学函数、性能监控和存储过程的详细示例和解释。
