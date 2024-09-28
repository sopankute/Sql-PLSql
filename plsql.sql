
#-------------Procedure, exception handlers, forceful termination-----------------

/*
-- mysql> set @y:="Sopan";
drop procedure if exists pro3;
delimiter $
	create procedure pro3()
	BEGIN
		declare x varchar(15) default "Hello";
		set @z:= "Wel-Come";
		select x, @y, @z;
		select concat(x," ",@y);
	END $
delimiter ;
*/

#---------------------------------------------------------------
/*
drop procedure if exists pro4;
delimiter $$
	create procedure pro4(x int, y int)
	BEGIN
	declare z int;
		set z := x + y;
		select z R1;
	END	$$
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro5;
delimiter $$
	create procedure pro5(IN x int, IN y int)
	BEGIN 
	 declare z int;
	 set z := x + y;
	 select z R1;
	 select (x + y) R2;
	END $$
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro6;
delimiter $$
	create procedure pro6(in x int, in y int, out z int)
		BEGIN
			set z:= x + y;
		END $$
delimiter ;
*/

#---------------------------------------------------------------
/*
drop procedure if exists pro7;
delimiter $$
	create procedure pro7(x int, y int, OUT z1 int, OUT z2 int, OUT z3 int, OUT z4 int)
		BEGIN 
			set z1 := x + y;
			set z2 := x - y;
			set z3 := x * y;
			set z4 := x / y;
		END $$
delimiter ;
*/

#---------------------------------------------------------------
/*
drop procedure if exists pro8;
delimiter $$
	create procedure pro8(deptno_d int, dname_d varchar(20), loc_d varchar(15))
	BEGIN
		insert into dept values(deptno_d, dname_d, loc_d); 
	END $$	
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro9;
delimiter $$
	create procedure pro9(in deptno_d int)
		BEGIN
			delete from dept where deptno = deptno_d;
		END $$
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro10;
delimiter $$
	create procedure pro10(deptno_d int, dname_d varchar(20), loc_d varchar(15))
		BEGIN
			update dept set dname = dname_d, loc = loc_d where deptno = deptno_d;
			select "Updated Successful" as "messsage window";
		END $$
delimiter ;
*/

#---------------------------------------------------------------
/*
drop procedure if exists pro11;
delimiter $$
	create procedure pro11(in a int)
		BEGIN
			declare x int;
			select deptno INTO x from dept where deptno = a;
			select x;
		END $$
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro12;
delimiter $$
	create procedure pro12(deptno_d int, dname_d varchar(20), loc_d varchar(15))
		BEGIN 
			declare x int;
			select deptno INTO x from dept where deptno = deptno_d;

			IF x is NOT NULL THEN
				update dept set dname = dname_d, loc = loc_d where deptno = deptno_d;
				select "Updated Successful" as "Window Messsage";
			ELSE
				select "record Not Found" as "Window Messsage";
			END IF;

		END $$		
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro9;
delimiter $$
	create procedure pro9(in deptno_d int)
		BEGIN
			declare x int;
			select deptno INTO x from dept where deptno = deptno_d;

			IF x is NOT NULL THEN
				delete from dept where deptno = deptno_d;
				select "record Deleted Successful" as "Window Messsage";
			ELSE
				select "record Not Found" as "Window Messsage";
			END IF;
			
		END $$
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro12;
delimiter $$
	create procedure pro12(deptno_d int, dname_d varchar(20), loc_d varchar(15))
		BEGIN 
			declare x int;
			select loc INTO x from dept where deptno = deptno_d;

			IF x is NOT NULL THEN
				update dept set dname = dname_d, loc = loc_d where deptno = deptno_d;
				select "Updated Successful" as "Window Messsage";
			ELSE
				select "record Not Found" as "Window Messsage";
			END IF;

		END $$		
delimiter ;
*/
#---------------------------------------------------------------

/*
drop procedure if exists pro12;
delimiter $$
	create procedure pro12(deptno_d int, dname_d varchar(20), loc_d varchar(15))
		BEGIN 
			declare x int;
			select TRUE INTO x from dept where deptno = deptno_d;

			IF x is NOT NULL THEN
				update dept set dname = dname_d, loc = loc_d where deptno = deptno_d;
				select "Updated Successful" as "Window Messsage";
			ELSE
				select "record Not Found" as "Window Messsage";
			END IF;

		END $$		
delimiter ;
*/
#---------------------------------------------------------------
/*
mysql> desc xyz;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| a     | int         | YES  |     | NULL    |       |
| b     | varchar(10) | YES  |     | NULL    |       |
| c     | varchar(10) | YES  |     | NULL    |       |
| d     | varchar(15) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> table xyz;
Empty set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro13(101,'B','C','D');
+-----------------------------+
| Message Window              |
+-----------------------------+
| records inserted successful |
+-----------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> table xyz;
+------+------+------+------+
| a    | b    | c    | d    |
+------+------+------+------+
|  101 | B    | C    | D    |
+------+------+------+------+
1 row in set (0.00 sec)

mysql> drop table xyz;
Query OK, 0 rows affected (0.03 sec)


mysql> desc xyz;
ERROR 1146 (42S02): Table 'demo.xyz' doesn't exist

mysql> table xyz;
ERROR 1146 (42S02): Table 'demo.xyz' doesn't exist

*/

/*
#--------------------Exception handler-----------------------
drop procedure if exists pro13;
delimiter $$
	create procedure pro13(a int, b varchar(10), c varchar(10), d varchar(15))
	BEGIN
		declare exit handler for 1146 select "Table doesn't exists" as "Error Window";
		insert into xyz values(a, b, c, d);
		select "records inserted successful" as "Message Window";
	END $$
delimiter ;
*/
#---------------------------------------------------------------
/*

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro13(101,'B','C','D');
+----------------------+
| Error Window         |
+----------------------+
| Table doesn't exists |
+----------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
*/

#---------------------------------------------------------------
/*
drop procedure if exists pro14;
DELIMITER $$
	create PROCEDURE pro14(in a int)
	BEGIN
		declare x int;
		#select TRUE into x from emp where deptno = a;
		select distinct TRUE into x from emp where deptno = a;
		#select TRUE into x from emp where deptno = a limit 1;	# valid in procedure, function and triggers

		IF x is not null THEN
			select * from emp where deptno = a;	    # in function it will raise an Error
		ELSE
			select concat("Employee for deparment no ",a," is Not found") R1;
		END IF;
	END $$
DELIMITER ;
*/

/*
output :
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro14(10);
ERROR 1172 (42000): Result consisted of more than one row
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro14(10);
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
|  7782 | CLARK  | MANAGER   | 7839 | 1983-06-09 | 2450 | NULL |     10 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
3 rows in set (0.00 sec)

mysql> call pro14(60);
+-------------------------------------------+
| R1                                        |
+-------------------------------------------+
| Employee for deparment no 60 is Not found |
+-------------------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

*/
#---------------------------------------------------------------
/*
drop procedure if exists pro15;
delimiter $$
	create procedure pro15()
		BEGIN 
			create table xyz(c1 int, c2 int);
		END $$
delimiter ;
*/
/*
drop procedure if exists pro15;
delimiter $$
	create procedure pro15()
		BEGIN 
			create table xyz(c1 int, c2 int);
		END $$
delimiter ;
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro15;
Query OK, 0 rows affected (0.02 sec)

mysql> desc xyz;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| c1    | int  | YES  |     | NULL    |       |
| c2    | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

*/
#---------------------------------------------------------------
/*
drop procedure if exists pro15;
delimiter $$
	create procedure pro15(x varchar(20))
		BEGIN 
			drop table 'x' ;
		END $$
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro15('xyz');
ERROR 1051 (42S02): Unknown table 'demo.x'

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro15(xyz);
ERROR 1054 (42S22): Unknown column 'xyz' in 'field list'

mysql> call pro15('xyz');
ERROR 1051 (42S02): Unknown table 'demo.x'

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''x' ;
                END' at line 3

*/

/*
drop procedure if exists pro16;
delimiter $
	create procedure pro16()
	begin
		declare x, y int;
		if x < y then
			select "NO";
		else 
			select "YES";
		end if;	
			select "Last line";
	end $
delimiter ;
*/

/*
Query OK, 0 rows affected (0.00 sec)

mysql> call pro16();
+-----+
| YES |
+-----+
| YES |
+-----+
1 row in set (0.00 sec)

+-----------+
| Last line |
+-----------+
| Last line |
+-----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
*/


/*
drop procedure if exists pro16;
delimiter $
	create procedure pro16()
	begin
		declare balance, withdraw int;
		declare ex condition for sqlstate '42000';

		set withdraw := 1000;
		set balance := 500;
		
		if balance < withdraw then
			signal ex set message_text = "withdraw Amount is more than 			balance";
		else 
			select "Withdraw successful !!";
		end if;	
			select "Last line";
	end $
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call pro16();
ERROR 1644 (42000): withdraw Amount is more than balance
*/

