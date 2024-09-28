/*
mysql> select * from emp where empno = 7788;
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7788 | SCOTT | ANALYST | 7566 | 1987-04-19 | 3000 | NULL |     20 |
+-------+-------+---------+------+------------+------+------+--------+
1 row in set (0.01 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
mysql>
mysql>
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.03 sec)

ERROR 1415 (0A000): Not allowed to return a result set from a trigger
*/

/*
drop TRIGGER if exists trg1;
delimiter $
create TRIGGER trg1 AFTER INSERT on dept FOR EACH ROW
	BEGIN
		select 222 into @x;
	END; $
delimiter ;


drop TRIGGER if exists trg2;
delimiter $
create TRIGGER trg2 BEFORE INSERT on dept FOR EACH ROW
	BEGIN
		select 555 into @y;
	END; $
delimiter ;
*/

/*
mysql> select @x;
+------------+
| @x         |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> select @x;
+------------+
| @x         |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

mysql> select * from dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     41 | A          | X       |
|     42 | B          | Y       |
|     43 | C          | Z       |
|     50 | P          | Q       |
+--------+------------+---------+
8 rows in set (0.01 sec)

mysql> insert into dept values(60,'P','Q');
Query OK, 1 row affected (0.00 sec)

mysql> select @x;
+------+
| @x   |
+------+
|  200 |
+------+
1 row in set (0.00 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     41 | A          | X       |
|     42 | B          | Y       |
|     43 | C          | Z       |
|     50 | P          | Q       |
|     60 | P          | Q       |
+--------+------------+---------+
9 rows in set (0.00 sec)

#------------------------------------
mysql> select @x;
+------+
| @x   |
+------+
|  200 |
+------+
1 row in set (0.00 sec)

mysql> select @y;
+------+
| @y   |
+------+
| NULL |
+------+
1 row in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     41 | A          | X       |
|     42 | B          | Y       |
|     43 | C          | Z       |
|     50 | P          | Q       |
|     60 | P          | Q       |
|     70 | R          | S       |
|     80 | S          | T       |
+--------+------------+---------+
11 rows in set (0.00 sec)

mysql> insert into dept values(90,'S','T');
Query OK, 1 row affected (0.01 sec)

mysql> select @x;
+------+
| @x   |
+------+
|  222 |
+------+
1 row in set (0.00 sec)

mysql> select @y;
+------+
| @y   |
+------+
|  555 |
+------+
1 row in set (0.00 sec)

*/
#-------------------------------------------------------
/*

drop TRIGGER if exists trg3;
delimiter $
create TRIGGER trg3 BEFORE INSERT, UPDATE on dept FOR EACH ROW
	BEGIN
		select 1000 into @z;
	END; $
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', UPDATE on dept FOR EACH ROW
        BEGIN
                select 1000 into @z;
        END' at line 1

*/
#----------------------------------------------
/*
mysql> insert into dept values(80,'S','T');

	NEW.DEPTNO := 80
	NEW.DNAME := 'S'
	NEW.LOC   := 'T'

*/

/*
mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     41 | A          | X       |
|     42 | B          | Y       |
|     43 | C          | Z       |
|     50 | P          | Q       |
|     60 | P          | Q       |
|     70 | R          | S       |
|     80 | S          | T       |
|     90 | S          | T       |
+--------+------------+---------+
12 rows in set (0.00 sec)

mysql> delete from dept where deptno > 40;
Query OK, 8 rows affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> desc dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   | PRI | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> create table deptbk as select * from dept;
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> table deptbk;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> create table deptbk1 as select * from dept where 1=2;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> table deptbk1;
Empty set (0.00 sec)

mysql> desc deptbk1;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   |     | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

*/
#----------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;

drop TRIGGER if exists trg4;
delimiter $
create trigger trg4 before insert on dept FOR EACH ROW
	BEGIN
		insert into deptbk values(new.deptno, NEW.dname, new.LOC);
	END $
delimiter ;

*/
# mysql> insert into dept values(75,'HRD','BARODA');

#	NEW.DEPTNO := 80
#	NEW.DNAME := 'S'
#	NEW.LOC   := 'T'

#-----------------
/*
mysql> create table deptbk as select * from dept where 1=2;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   | PRI | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc deptbk;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   |     | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', UPDATE on dept FOR EACH ROW
        BEGIN
                select 1000 into @z;
        END' at line 1
mysql>
mysql>
mysql>
mysql>
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> select * from dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> select * from deptbk;
Empty set (0.00 sec)

mysql> insert into dept values(75,'HRD','BARODA');
Query OK, 1 row affected (0.00 sec)

mysql> select * from dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     75 | HRD        | BARODA  |
+--------+------------+---------+
5 rows in set (0.00 sec)

mysql> select * from deptbk;
+--------+-------+--------+
| DEPTNO | DNAME | LOC    |
+--------+-------+--------+
|     75 | HRD   | BARODA |
+--------+-------+--------+
1 row in set (0.00 sec)

*/
#-------------------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;

drop TRIGGER if exists trg5;
delimiter $
create trigger trg5 before insert on dept for each row
	begin
		insert into deptbk values(
			new.deptno, new.dname, new.loc, curdate(), curtime(), user());
	end $
delimiter ;

*/

/*
mysql> desc deptbk;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   |     | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
| dt     | date        | YES  |     | NULL    |       |
| ti     | time        | YES  |     | NULL    |       |
| usr    | varchar(30) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> insert into dept values(1,'1','1');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql>
mysql> desc dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   | PRI | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2022-07-03 |
+------------+
1 row in set (0.00 sec)

mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 10:16:48  |
+-----------+
1 row in set (0.00 sec)

mysql> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> #------------------------------------------

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> insert into dept values(1,'1','1');
Query OK, 1 row affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      1 | 1          | 1       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     75 | HRD        | BARODA  |
+--------+------------+---------+
6 rows in set (0.00 sec)

mysql> select * from deptbk;
+--------+-------+--------+------------+----------+----------------+
| DEPTNO | DNAME | LOC    | dt         | ti       | usr            |
+--------+-------+--------+------------+----------+----------------+
|     75 | HRD   | BARODA | NULL       | NULL     | NULL           |
|      1 | 1     | 1      | 2022-07-03 | 10:20:14 | root@localhost |
+--------+-------+--------+------------+----------+----------------+
2 rows in set (0.00 sec)

*/
#--------------------------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;
drop TRIGGER if exists trg5;

drop TRIGGER if exists trg6;
delimiter $
create trigger trg6 before insert on dept for each row
	begin
		insert into deptbk values(
			new.deptno, new.dname, new.loc, curdate(), curtime(), user());
	end $
delimiter ;

drop TRIGGER if exists trg7;
delimiter $
create trigger trg7 before delete on dept for each row
	begin
		insert into deptbk values(
			old.deptno, old.dname, old.loc, curdate(), curtime(), user());
	end $
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> table deptbk;
+--------+-------+--------+------------+----------+----------------+
| DEPTNO | DNAME | LOC    | dt         | ti       | usr            |
+--------+-------+--------+------------+----------+----------------+
|     75 | HRD   | BARODA | NULL       | NULL     | NULL           |
|      1 | 1     | 1      | 2022-07-03 | 10:20:14 | root@localhost |
+--------+-------+--------+------------+----------+----------------+
2 rows in set (0.00 sec)

mysql> insert into dept values(2,'2','2');
Query OK, 1 row affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      2 | 2          | 2       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
5 rows in set (0.00 sec)

mysql> show local variables like 'auto%';
+--------------------------+-------+
| Variable_name            | Value |
+--------------------------+-------+
| auto_generate_certs      | ON    |
| auto_increment_increment | 1     |
| auto_increment_offset    | 1     |
| autocommit               | ON    |
| automatic_sp_privileges  | ON    |
+--------------------------+-------+
5 rows in set (0.06 sec)

mysql> delete from dept where deptno=40;
Query OK, 1 row affected (0.00 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      2 | 2          | 2       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      2 | 2          | 2       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> table deptbk;
+--------+------------+--------+------------+----------+----------------+
| DEPTNO | DNAME      | LOC    | dt         | ti       | usr            |
+--------+------------+--------+------------+----------+----------------+
|     75 | HRD        | BARODA | NULL       | NULL     | NULL           |
|      1 | 1          | 1      | 2022-07-03 | 10:20:14 | root@localhost |
|      2 | 2          | 2      | 2022-07-03 | 10:35:24 | root@localhost |
|     40 | OPERATIONS | BOSTON | 2022-07-03 | 10:37:16 | root@localhost |
+--------+------------+--------+------------+----------+----------------+
4 rows in set (0.00 sec)

mysql> select deptno, dname, loc from deptbk where deptno=40;
+--------+------------+--------+
| deptno | dname      | loc    |
+--------+------------+--------+
|     40 | OPERATIONS | BOSTON |
+--------+------------+--------+
1 row in set (0.00 sec)

mysql> insert into dept select deptno, dname, loc from deptbk where deptno=40;
ERROR 1442 (HY000): Can't update table 'deptbk' in stored function/trigger because it is already used by statement which invoked this stored function/trigger.
mysql>
mysql> drop trigger tgr6;
ERROR 1360 (HY000): Trigger does not exist
mysql>
mysql> drop trigger trg6;
Query OK, 0 rows affected (0.01 sec)

mysql> insert into dept select deptno, dname, loc from deptbk where deptno=40;
Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      2 | 2          | 2       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
5 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

*/
#--------------------------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;
drop TRIGGER if exists trg5;
drop TRIGGER if exists trg6;
drop TRIGGER if exists trg7;

drop TRIGGER if exists trg8;
delimiter $
create trigger trg8 before insert on dept for each row
	begin
		set new.dname := upper(new.dname);
		set new.loc   := upper(new.loc);
	end $
delimiter ;

#insert into dept values(3,ucase('marketing'),upper('mumbai'));
#insert into dept values(5,'purchase','nagpur');
*/

/*
mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      2 | 2          | 2       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
5 rows in set (0.00 sec)

mysql> drop TRIGGER if exists trg1;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> drop TRIGGER if exists trg2;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> drop TRIGGER if exists trg3;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> drop TRIGGER if exists trg4;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> drop TRIGGER if exists trg5;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> drop TRIGGER if exists trg6;
Query OK, 0 rows affected (0.00 sec)

mysql> drop TRIGGER if exists trg7;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into dept values(1,'hrd','pune');
Query OK, 1 row affected (0.00 sec)

mysql> insert into dept values(2,ucase('marketing'),upper('mumbai'));
ERROR 1062 (23000): Duplicate entry '2' for key 'dept.PRIMARY'
mysql>
mysql> insert into dept values(3,ucase('marketing'),upper('mumbai'));
Query OK, 1 row affected (0.00 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      1 | hrd        | pune    |
|      2 | 2          | 2       |
|      3 | MARKETING  | MUMBAI  |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
7 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

ERROR 1362 (HY000): Updating of NEW row is not allowed in after trigger
mysql>
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> insert into dept values(5,'purchase','nagpur');
Query OK, 1 row affected (0.00 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      1 | hrd        | pune    |
|      2 | 2          | 2       |
|      3 | MARKETING  | MUMBAI  |
|      5 | PURCHASE   | NAGPUR  |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
8 rows in set (0.00 sec)
*/
#--------------------------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;
drop TRIGGER if exists trg5;
drop TRIGGER if exists trg6;
drop TRIGGER if exists trg7;
drop TRIGGER if exists trg8;

drop TRIGGER if exists trg9;
delimiter $
create trigger trg9 before update on dept for each row
	begin
		insert into deptbk values(
			new.deptno, old.dname, old.loc, curdate(), curtime(), user());
	end $
delimiter ;

*/

/*
mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      1 | hrd        | pune    |
|      2 | 2          | 2       |
|      3 | MARKETING  | MUMBAI  |
|      5 | PURCHASE   | NAGPUR  |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
8 rows in set (0.00 sec)

mysql> table deptbk;
+--------+------------+--------+------------+----------+----------------+
| DEPTNO | DNAME      | LOC    | dt         | ti       | usr            |
+--------+------------+--------+------------+----------+----------------+
|     75 | HRD        | BARODA | NULL       | NULL     | NULL           |
|      1 | 1          | 1      | 2022-07-03 | 10:20:14 | root@localhost |
|      2 | 2          | 2      | 2022-07-03 | 10:35:24 | root@localhost |
|     40 | OPERATIONS | BOSTON | 2022-07-03 | 10:37:16 | root@localhost |
+--------+------------+--------+------------+----------+----------------+
4 rows in set (0.00 sec)

mysql>  delete from deptbk;
Query OK, 4 rows affected (0.00 sec)

mysql> table deptbk;
Empty set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      1 | hrd        | pune    |
|      2 | 2          | 2       |
|      3 | MARKETING  | MUMBAI  |
|      5 | PURCHASE   | NAGPUR  |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
8 rows in set (0.00 sec)

mysql> table deptbk;
Empty set (0.00 sec)

mysql> update dept set dname = 'abc', loc = 'aurangabad' where deptno = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> table deptbk;
+--------+-------+------+------------+----------+----------------+
| DEPTNO | DNAME | LOC  | dt         | ti       | usr            |
+--------+-------+------+------------+----------+----------------+
|      1 | hrd   | pune | 2022-07-03 | 11:51:11 | root@localhost |
+--------+-------+------+------------+----------+----------------+
1 row in set (0.00 sec)

mysql> table dept;
+--------+------------+------------+
| DEPTNO | DNAME      | LOC        |
+--------+------------+------------+
|      1 | abc        | aurangabad |
|      2 | 2          | 2          |
|      3 | MARKETING  | MUMBAI     |
|      5 | PURCHASE   | NAGPUR     |
|     10 | ACCOUNTING | NEWYORK    |
|     20 | RESEARCH   | DALLAS     |
|     30 | SALES      | CHICAGO    |
|     40 | OPERATIONS | BOSTON     |
+--------+------------+------------+
8 rows in set (0.00 sec)

mysql> update dept set dname = 'Sopan', loc = 'Parbhani' where deptno = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> table dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|      1 | Sopan      | Parbhani |
|      2 | 2          | 2        |
|      3 | MARKETING  | MUMBAI   |
|      5 | PURCHASE   | NAGPUR   |
|     10 | ACCOUNTING | NEWYORK  |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
8 rows in set (0.00 sec)

mysql> table deptbk;
+--------+-------+------------+------------+----------+----------------+
| DEPTNO | DNAME | LOC        | dt         | ti       | usr            |
+--------+-------+------------+------------+----------+----------------+
|      1 | hrd   | pune       | 2022-07-03 | 11:51:11 | root@localhost |
|      1 | abc   | aurangabad | 2022-07-03 | 11:54:05 | root@localhost |
+--------+-------+------------+------------+----------+----------------+
2 rows in set (0.00 sec)

*/
#--------------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;
drop TRIGGER if exists trg5;
drop TRIGGER if exists trg6;
drop TRIGGER if exists trg7;
drop TRIGGER if exists trg8;
drop TRIGGER if exists trg9;

drop TRIGGER if exists trg10;
delimiter $
create trigger trg10 before insert on dept for each row
	begin
		declare x int default 0;
		select max(deptno) + 1 into x from dept;
		set new.deptno := x;
		set new.dname := upper(new.dname);
		set new.loc   := upper(new.loc);
	end $
delimiter ;
*/

/*
drop function if exists fun4;
delimiter $$
	create function fun4() returns int
		BEGIN 
			declare x int default 0;
			select max(deptno) + 1 into x from dept;
			return x;
		END $$
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> insert into dept values(fun4(), '2','2');
Query OK, 1 row affected (0.01 sec)

mysql> insert into dept values(fun4(), '3','3');
Query OK, 1 row affected (0.01 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> table dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|      1 | Sopan      | Parbhani |
|      2 | 2          | 2        |
|      3 | MARKETING  | MUMBAI   |
|      5 | PURCHASE   | NAGPUR   |
|     10 | ACCOUNTING | NEWYORK  |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
|     41 | 2          | 2        |
|     42 | 3          | 3        |
+--------+------------+----------+
10 rows in set (0.00 sec)

mysql> insert into dept values(default, '4','5');
ERROR 1364 (HY000): Field 'DEPTNO' doesn't have a default value

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> table dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|      1 | Sopan      | Parbhani |
|      2 | 2          | 2        |
|      3 | MARKETING  | MUMBAI   |
|      5 | PURCHASE   | NAGPUR   |
|     10 | ACCOUNTING | NEWYORK  |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
|     41 | 2          | 2        |
|     42 | 3          | 3        |
+--------+------------+----------+
10 rows in set (0.00 sec)

mysql> insert into dept(dname, loc) values('4','4');
Query OK, 1 row affected (0.00 sec)

mysql> insert into dept(dname, loc) values('5','5');
Query OK, 1 row affected (0.01 sec)

mysql> table dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|      1 | Sopan      | Parbhani |
|      2 | 2          | 2        |
|      3 | MARKETING  | MUMBAI   |
|      5 | PURCHASE   | NAGPUR   |
|     10 | ACCOUNTING | NEWYORK  |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
|     41 | 2          | 2        |
|     42 | 3          | 3        |
|     43 | 4          | 4        |
|     44 | 5          | 5        |
+--------+------------+----------+
12 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> insert into dept(dname, loc) values('xyz','nanded');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> table dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|      1 | Sopan      | Parbhani |
|      2 | 2          | 2        |
|      3 | MARKETING  | MUMBAI   |
|      5 | PURCHASE   | NAGPUR   |
|     10 | ACCOUNTING | NEWYORK  |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
|     41 | 2          | 2        |
|     42 | 3          | 3        |
|     43 | 4          | 4        |
|     44 | 5          | 5        |
|     45 | XYZ        | NANDED   |
+--------+------------+----------+

*/
#-----------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;
drop TRIGGER if exists trg5;
drop TRIGGER if exists trg6;
drop TRIGGER if exists trg7;
drop TRIGGER if exists trg8;
drop TRIGGER if exists trg9;

drop TRIGGER if exists trg11;
delimiter $
create trigger trg11 before insert on dept for each row
	begin
		declare x int default 0;
		select count(*) into x from dept;
		if x > 5 then
			SIGNAL SQLSTATE '42000' set MESSAGE_TEXT = 'invalid';
		end if;	
	end $
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql3.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> insert into dept values(1,1,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into dept values(2,1,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into dept values(3,1,1);
ERROR 1644 (42000): invalid
mysql> insert into dept values(4,1,1);
ERROR 1644 (42000): invalid
mysql>
mysql>
mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|      1 | 1          | 1       |
|      2 | 1          | 1       |
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
6 rows in set (0.00 sec)

mysql> select count(*) from dept;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.01 sec)

*/

#-----------------------------------------------------
/*
drop trigger if exists trg12;
delimiter $
create trigger trg 12 before insert on dept for each row
	BEGIN 
	    declare x int default 0;
	    declare ex condition for SIGNAL SQLSTATE '42000';
	    select count(*) into x from dept;
		if x > 5 then
		    SIGNAL ex set MESSAGE_TEXT = 'second exception syntax';
		end if;	
	END$
delimiter ;
*/
#----------------------------------------------------------
/*
drop TRIGGER if exists trg1;
drop TRIGGER if exists trg2;
drop TRIGGER if exists trg3;
drop TRIGGER if exists trg4;
drop TRIGGER if exists trg5;
drop TRIGGER if exists trg6;
drop TRIGGER if exists trg7;
drop TRIGGER if exists trg8;
drop TRIGGER if exists trg9;
drop TRIGGER if exists trg11;
drop trigger if exists trg12;

drop trigger if exists trg13;
delimiter $
create trigger trg13 before insert on dept for each row
	BEGIN 
		if new.deptno < 40 or new.deptno > 50 then
		SIGNAL SQLSTATE '42000' set MESSAGE_TEXT = 'Not allowed';
		end if;	
	END$
delimiter ;
	
	# insert into dept values(1,1,1);
	# insert into dept values(51,1,1);
	# insert into dept values(41,1,1);
	# insert into dept values(50,1,1);

*/

/*
mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
+--------+------------+---------+
4 rows in set (0.00 sec)

mysql> insert into dept values(1,1,1);
ERROR 1644 (42000): Not allowed
mysql>
mysql> insert into dept values(51,1,1);
ERROR 1644 (42000): Not allowed
mysql>
mysql> insert into dept values(41,1,1);
Query OK, 1 row affected (0.00 sec)

mysql> insert into dept values(50,1,1);
Query OK, 1 row affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|     41 | 1          | 1       |
|     50 | 1          | 1       |
+--------+------------+---------+
6 rows in set (0.00 sec)

*/
#-----------------------------------------------------------------