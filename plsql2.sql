/*
drop function if exists fun;
delimiter $$
create function fun() returns varchar(400)
	BEGIN
		declare x varchar(20); 
		#select "Hello World";	
		select "Hello World" into x;
		return (x);
	END $$
delimiter ;
*/
/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected, 1 warning (0.01 sec)

ERROR 1415 (0A000): Not allowed to return a result set from a function

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

ERROR 1418 (HY000): This function has none of DETERMINISTIC, NO SQL, 
or READS SQL DATA in its declaration and binary logging is enabled 
(you *might* want to use the less safe log_bin_trust_function_creators variable)

mysql> set global log_bin_trust_function_creators = 1;
Query OK, 0 rows affected (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call fun();
ERROR 1305 (42000): PROCEDURE demo.fun does not exist

mysql> select fun();
ERROR 1406 (22001): Data too long for column 'x' at row 1

mysql> select fun();
ERROR 1406 (22001): Data too long for column 'x' at row 1

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> select fun();
+-------------+
| fun()       |
+-------------+
| Hello World |
+-------------+
1 row in set (0.00 sec)

mysql> select fun() R1;
+-------------+
| R1          |
+-------------+
| Hello World |
+-------------+
1 row in set (0.00 sec)

*/
#------------------------------------------------------------------------------
/*
ERROR : COZ of fun1(IN x int, IN y int) - IN not required 
drop function if exists fun1;
delimiter $
create function fun1(IN x int, IN y int) returns int
	BEGIN
		declare x int;
		set sum := x + y;
		return (sum);
	END $
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'IN x int, IN y int) returns int
        BEGIN
                declare x int;
                set sum := x + y;
                re' at line 1

*/
#--------------------------------------------------------
/*
drop function if exists fun1;
delimiter $
create function fun1(x int, y int) returns int
	BEGIN
		# declare sum int;
		# set sum := x + y;
		# return (sum);
		# return (x + y);

		return (ifnull(x,0) + ifnull(y,0));
	END $
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> select fun1(7, 2);
+------------+
| fun1(7, 2) |
+------------+
|          9 |
+------------+
1 row in set (0.00 sec)

mysql> select fun1(8, 15);
+-------------+
| fun1(8, 15) |
+-------------+
|          23 |
+-------------+
1 row in set (0.00 sec)

sql> select * from emp where deptno = fun1(5,5);
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7782 | CLARK  | MANAGER   | 7839 | 1983-06-09 | 2450 | NULL |     10 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
3 rows in set (0.00 sec)
#---------------------
mysql> select ename, sal, comm, fun1(comm, sal) from emp;
+--------+------+------+-----------------+
| ename  | sal  | comm | fun1(comm, sal) |
+--------+------+------+-----------------+
| SMITH  |  800 | NULL |            NULL |
| ALLEN  | 1600 |  300 |            1900 |
| WARD   | 1250 |  500 |            1750 |
| JONES  | 2975 | NULL |            NULL |
| MARTIN | 1250 | 1400 |            2650 |
| BLAKE  | 2850 | NULL |            NULL |
| CLARK  | 2450 | NULL |            NULL |
| SCOTT  | 3000 | NULL |            NULL |
| KING   | 5000 | NULL |            NULL |
| TURNER | 1500 |    0 |            1500 |
| ADAMS  | 1100 | NULL |            NULL |
| JAMES  |  950 | NULL |            NULL |
| FORD   | 3000 | NULL |            NULL |
| MILLER | 1300 | NULL |            NULL |
+--------+------+------+-----------------+
14 rows in set (0.00 sec)

mysql> select * from emp where deptno = fun1(10,null);
Empty set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> select * from emp where deptno = fun1(10,null);
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7782 | CLARK  | MANAGER   | 7839 | 1983-06-09 | 2450 | NULL |     10 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
3 rows in set (0.00 sec)

mysql> select ename, sal, comm, fun1(comm, sal) from emp;
+--------+------+------+-----------------+
| ename  | sal  | comm | fun1(comm, sal) |
+--------+------+------+-----------------+
| SMITH  |  800 | NULL |             800 |
| ALLEN  | 1600 |  300 |            1900 |
| WARD   | 1250 |  500 |            1750 |
| JONES  | 2975 | NULL |            2975 |
| MARTIN | 1250 | 1400 |            2650 |
| BLAKE  | 2850 | NULL |            2850 |
| CLARK  | 2450 | NULL |            2450 |
| SCOTT  | 3000 | NULL |            3000 |
| KING   | 5000 | NULL |            5000 |
| TURNER | 1500 |    0 |            1500 |
| ADAMS  | 1100 | NULL |            1100 |
| JAMES  |  950 | NULL |             950 |
| FORD   | 3000 | NULL |            3000 |
| MILLER | 1300 | NULL |            1300 |
+--------+------+------+-----------------+
14 rows in set (0.00 sec)

*/
#-----------------------------------------------
/*
drop function if exists fun2;
delimiter $
create function fun2(x int) returns varchar(1000)
	begin
	     declare y, z int;
	     select sal, comm into y, z from emp where empno = x;
	     return (ifnull(y,0) + ifnull(z, 0));
	end $
delimiter ;
*/

/*
mysql> select ename, sal, comm, fun2(empno) from emp where empno = 7788;
+-------+------+------+-------------+
| ename | sal  | comm | fun2(empno) |
+-------+------+------+-------------+
| SCOTT | 3000 | NULL | 3000        |
+-------+------+------+-------------+
1 row in set (0.00 sec)

mysql> select ename, sal, comm, fun2(empno) from emp;
+--------+------+------+-------------+
| ename  | sal  | comm | fun2(empno) |
+--------+------+------+-------------+
| SMITH  |  800 | NULL | 800         |
| ALLEN  | 1600 |  300 | 1900        |
| WARD   | 1250 |  500 | 1750        |
| JONES  | 2975 | NULL | 2975        |
| MARTIN | 1250 | 1400 | 2650        |
| BLAKE  | 2850 | NULL | 2850        |
| CLARK  | 2450 | NULL | 2450        |
| SCOTT  | 3000 | NULL | 3000        |
| KING   | 5000 | NULL | 5000        |
| TURNER | 1500 |    0 | 1500        |
| ADAMS  | 1100 | NULL | 1100        |
| JAMES  |  950 | NULL | 950         |
| FORD   | 3000 | NULL | 3000        |
| MILLER | 1300 | NULL | 1300        |
+--------+------+------+-------------+
14 rows in set (0.00 sec)

*/

/*
drop function if exists fun3;
delimiter $$
create function fun3(x int) returns varchar(100)
	BEGIN
		delete from dept where deptno = x;
		return "Record deleted successful";
	END $$
delimiter ;
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

mysql> insert into dept values(101, "EnTC", "PUNE");
Query OK, 1 row affected (0.01 sec)

mysql> table dept;
+--------+------------+---------+
| DEPTNO | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NEWYORK |
|     20 | RESEARCH   | DALLAS  |
|     30 | SALES      | CHICAGO |
|     40 | OPERATIONS | BOSTON  |
|    101 | EnTC       | PUNE    |
+--------+------------+---------+
5 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> select fun3(101);
+---------------------------+
| fun3(101)                 |
+---------------------------+
| Record deleted successful |
+---------------------------+
1 row in set (0.01 sec)

*/
#----------------------------------------------
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
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected (0.01 sec)

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

mysql> insert into dept values(fun4(), 'A', 'X');
Query OK, 1 row affected (0.01 sec)

mysql> insert into dept values(fun4(), 'B', 'Y');
Query OK, 1 row affected (0.01 sec)

mysql> insert into dept values(fun4(), 'C', 'Z');
Query OK, 1 row affected (0.00 sec)

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
+--------+------------+---------+
7 rows in set (0.00 sec)

*/
#--------------------------------------------------------
/*
drop function if exists fun5;
delimiter $$
create function fun5() returns varchar(10)
	BEGIN
		declare x int default 0;
		select max(cast(substr(c1, 4) as signed)) + 1 into x from xyz;
		return concat("CG-",x);
	END $$
delimiter ;
*/
/*
mysql>  create table xyz(c1 varchar(30), c2 int);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into xyz values('CG-100', 76);
Query OK, 1 row affected (0.01 sec)

mysql> insert into xyz values('CG-101', 43);
Query OK, 1 row affected (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql2.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> insert into xyz values(fun5(), 98);
Query OK, 1 row affected (0.01 sec)

mysql> insert into xyz values(fun5(), 21);
Query OK, 1 row affected (0.01 sec)

mysql> insert into xyz values(fun5(), -86);
Query OK, 1 row affected (0.01 sec)

mysql> insert into xyz values(fun5(), 92);
Query OK, 1 row affected (0.00 sec)

mysql> table xyz;
+--------+------+
| c1     | c2   |
+--------+------+
| CG-100 |   76 |
| CG-101 |   43 |
| CG-102 |   98 |
| CG-103 |   21 |
| CG-104 |  -86 |
| CG-105 |   92 |
+--------+------+
6 rows in set (0.00 sec)

mysql> insert into xyz values('2341', 94);
Query OK, 1 row affected (0.01 sec)

mysql> table xyz;
+--------+------+
| c1     | c2   |
+--------+------+
| CG-100 |   76 |
| CG-101 |   43 |
| CG-102 |   98 |
| CG-103 |   21 |
| CG-104 |  -86 |
| CG-105 |   92 |
| 2341   |   94 |
+--------+------+
7 rows in set (0.00 sec)

mysql> delete from xyz where c1 = '2341';
Query OK, 1 row affected (0.00 sec)

mysql> table xyz;
+--------+------+
| c1     | c2   |
+--------+------+
| CG-100 |   76 |
| CG-101 |   43 |
| CG-102 |   98 |
| CG-103 |   21 |
| CG-104 |  -86 |
| CG-105 |   92 |
+--------+------+
6 rows in set (0.00 sec)

mysql> insert into xyz values('CG-2341', 94);
Query OK, 1 row affected (0.00 sec)

mysql> table xyz;
+---------+------+
| c1      | c2   |
+---------+------+
| CG-100  |   76 |
| CG-101  |   43 |
| CG-102  |   98 |
| CG-103  |   21 |
| CG-104  |  -86 |
| CG-105  |   92 |
| CG-2341 |   94 |
+---------+------+
7 rows in set (0.00 sec)

mysql> insert into xyz values(fun5(), 94);
Query OK, 1 row affected (0.01 sec)

mysql> insert into xyz values(fun5(), 53);
Query OK, 1 row affected (0.00 sec)

mysql> insert into xyz values(fun5(), 29);
Query OK, 1 row affected (0.00 sec)

mysql> table xyz;
+---------+------+
| c1      | c2   |
+---------+------+
| CG-100  |   76 |
| CG-101  |   43 |
| CG-102  |   98 |
| CG-103  |   21 |
| CG-104  |  -86 |
| CG-105  |   92 |
| CG-2341 |   94 |
| CG-2342 |   94 |
| CG-2343 |   53 |
| CG-2344 |   29 |
+---------+------+
10 rows in set (0.00 sec)
*/

drop procedure if exists pro23;
delimiter $$
	create procedure pro23()
	begin
		select "Hello";
	end; $$
delimiter ;

