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

mysql> desc dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   | PRI | NULL    |       |
| DNAME  | varchar(20) | YES  |     | NULL    |       |
| LOC    | varchar(15) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.07 sec)
*/

/*
drop procedure if exists procedure1;
delimiter $$
	create procedure procedure1()
	BEGIN 
	declare a int;
	declare b varchar(20);
	declare c varchar(15);
	 declare c1 cursor for select * from dept;
		OPEN c1;
			lbl:LOOP
			 fetch c1 into a, b, c;
			 select a, b, c;
			 end LOOP;
		CLOSE c1;
	END $$
delimiter ;
*/

/*

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql4.sql
Query OK, 0 rows affected, 1 warning (0.02 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call procedure1();
+------+------------+---------+
| a    | b          | c       |
+------+------------+---------+
|   10 | ACCOUNTING | NEWYORK |
+------+------------+---------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> --fetch command fetch only first records

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql4.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call procedure1();
+------+------------+---------+
| a    | b          | c       |
+------+------------+---------+
|   10 | ACCOUNTING | NEWYORK |
+------+------------+---------+
1 row in set (0.00 sec)

+------+----------+--------+
| a    | b        | c      |
+------+----------+--------+
|   20 | RESEARCH | DALLAS |
+------+----------+--------+
1 row in set (0.00 sec)

+------+-------+---------+
| a    | b     | c       |
+------+-------+---------+
|   30 | SALES | CHICAGO |
+------+-------+---------+
1 row in set (0.01 sec)

+------+------------+--------+
| a    | b          | c      |
+------+------------+--------+
|   40 | OPERATIONS | BOSTON |
+------+------------+--------+
1 row in set (0.01 sec)

ERROR 1329 (02000): No data - zero rows fetched, selected, or processed

*/

/*
drop procedure if exists procedure2;
delimiter $$
	create procedure procedure2()
	BEGIN 
	declare a int;
	declare b varchar(20);
	declare c varchar(15);

	 declare exit handler for 1329 select "No more data to fetch"; 
	 # Error : Cursor declaration after handler declaration

	 declare c1 cursor for select * from dept;
		OPEN c1;
			lbl:LOOP
			 fetch c1 into a, b, c;
			 select a, b, c;
			 end LOOP;
		CLOSE c1;
	END $$
delimiter ;

*/
#-----------------------------------------------------------
/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql4.sql
Query OK, 0 rows affected (0.01 sec)

ERROR 1338 (42000): Cursor declaration after handler declaration

*/
#--------------------------------------------------
/*
drop procedure if exists procedure2;
delimiter $$
	create procedure procedure2()
	BEGIN 
	declare a int;
	declare b varchar(20);
	declare c varchar(15);
	 declare c1 cursor for select * from dept;
	 declare exit handler for 1329 select "No more data to fetch" as 'Error Window'; 
		OPEN c1;
    #	select sleep(10)
			lbl:LOOP
				 fetch c1 into a, b, c;
				 select a R1, b R2, c R3;
			 end LOOP;
		CLOSE c1;
	END $$
delimiter ;

*/
/*

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql4.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call procedure2();
+------+------------+---------+
| R1   | R2         | R3      |
+------+------------+---------+
|   10 | ACCOUNTING | NEWYORK |
+------+------------+---------+
1 row in set (0.00 sec)

+------+----------+--------+
| R1   | R2       | R3     |
+------+----------+--------+
|   20 | RESEARCH | DALLAS |
+------+----------+--------+
1 row in set (0.00 sec)

+------+-------+---------+
| R1   | R2    | R3      |
+------+-------+---------+
|   30 | SALES | CHICAGO |
+------+-------+---------+
1 row in set (0.00 sec)

+------+------------+--------+
| R1   | R2         | R3     |
+------+------------+--------+
|   40 | OPERATIONS | BOSTON |
+------+------------+--------+
1 row in set (0.00 sec)

+-----------------------+
| Error Window          |
+-----------------------+
| No more data to fetch |
+-----------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

*/
#-------------------------------------------------
/*
drop procedure if exists procedure3;
delimiter $$
	create procedure procedure3(x1 int)
	BEGIN 
	declare a, b, c int;
	declare d varchar(15);
	declare e varchar(10);
	 declare c1 cursor for select empno, ename, job, sal, deptno from emp 
	 where deptno = x1;
	 declare exit handler for 1329 select "No more data to fetch" as 'Error Window'; 
		OPEN c1;
			lbl:LOOP
				 fetch c1 into a, d, e, b, c;
				 select a R1, d R2, e R3, b R4, c R5;
			 end LOOP;
		CLOSE c1;
	END $$
delimiter ;

*/
/*
mysql> desc emp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| EMPNO    | int         | NO   | PRI | NULL    |       |
| ENAME    | varchar(15) | YES  |     | NULL    |       |
| JOB      | varchar(10) | YES  |     | NULL    |       |
| MGR      | int         | YES  |     | NULL    |       |
| HIREDATE | date        | YES  |     | NULL    |       |
| SAL      | int         | YES  | MUL | NULL    |       |
| COMM     | int         | YES  |     | NULL    |       |
| DEPTNO   | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.02 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql4.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call procedure3(10);
+------+--------+-------+------+------+
| R1   | R2     | R3    | R4   | R5   |
+------+--------+-------+------+------+
| 7934 | MILLER | CLERK | 1300 |   10 |
+------+--------+-------+------+------+
1 row in set (0.01 sec)

+------+-------+---------+------+------+
| R1   | R2    | R3      | R4   | R5   |
+------+-------+---------+------+------+
| 7782 | CLARK | MANAGER | 2450 |   10 |
+------+-------+---------+------+------+
1 row in set (0.01 sec)

+------+------+-----------+------+------+
| R1   | R2   | R3        | R4   | R5   |
+------+------+-----------+------+------+
| 7839 | KING | PRESIDENT | 5000 |   10 |
+------+------+-----------+------+------+
1 row in set (0.02 sec)

+-----------------------+
| Error Window          |
+-----------------------+
| No more data to fetch |
+-----------------------+
1 row in set (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

*/
#--------------------------------------------------------
/*
drop procedure if exists procedure4;
delimiter $$
	create procedure procedure4(x1 int)
	BEGIN 
	declare a, b, c int;
	declare d varchar(15);
	declare e varchar(10);
	 declare c1 cursor for select empno, ename, job, sal, deptno from emp;
	 declare exit handler for 1329 select "No more data to fetch" as 'Error Window'; 

		OPEN c1;

			lbl:LOOP
				 fetch c1 into a, d, e, b, c;
				 if c = x1 then
				 	select a R1, d R2, e R3, b R4, c R5;
				 end if;
			end LOOP;

		CLOSE c1;
	END $$
delimiter ;
*/
/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql4.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call procedure4(10);
+------+-------+---------+------+------+
| R1   | R2    | R3      | R4   | R5   |
+------+-------+---------+------+------+
| 7782 | CLARK | MANAGER | 2450 |   10 |
+------+-------+---------+------+------+
1 row in set (0.00 sec)

+------+------+-----------+------+------+
| R1   | R2   | R3        | R4   | R5   |
+------+------+-----------+------+------+
| 7839 | KING | PRESIDENT | 5000 |   10 |
+------+------+-----------+------+------+
1 row in set (0.01 sec)

+------+--------+-------+------+------+
| R1   | R2     | R3    | R4   | R5   |
+------+--------+-------+------+------+
| 7934 | MILLER | CLERK | 1300 |   10 |
+------+--------+-------+------+------+
1 row in set (0.01 sec)

+-----------------------+
| Error Window          |
+-----------------------+
| No more data to fetch |
+-----------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

*/