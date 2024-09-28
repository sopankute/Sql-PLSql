/*
drop procedure if exists display;
delimiter $$
	create procedure display(in msg varchar(1000))
		BEGIN
			select msg as "(display)Message Window"; 
		END $$
delimiter ;

drop procedure if exists pro17;
delimiter $$
	create procedure pro17()
		BEGIN
			call display("calling another procedure");
		END $$
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call display("Call me from pro17");
+--------------------+
| Message Window     |
+--------------------+
| Call me from pro17 |
+--------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call pro17;
+-------------+
| Hello World |
+-------------+
| Hello World |
+-------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro17();
+---------------------------+
| (display)Message Window   |
+---------------------------+
| calling another procedure |
+---------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

*/
#------------------------------------------------------------------
/*
mysql> desc
    -> xyz;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| c1    | int  | YES  |     | NULL    |       |
| c2    | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> drop table xyz;
Query OK, 0 rows affected (0.02 sec)

mysql> drop table xyz;
ERROR 1051 (42S02): Unknown table 'demo.xyz'

mysql> drop table if exists xyz;
Query OK, 0 rows affected, 1 warning (0.00 sec)

*/

drop procedure if exists pro18;
delimiter $$
create procedure pro18()
	BEGIN
		#declare exit handler for 1051 call display("table Not found...!");
		declare exit handler for 1050 call display("table xyz found");

		#drop table if exists xyz;
		create table xyz(c1 int, c2 int);
		call display("table xyz created");
	END $$
delimiter ;

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro18();
+-------------------------+
| (display)Message Window |
+-------------------------+
| table Not found...!     |
+-------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> desc xyz;
ERROR 1146 (42S02): Table 'demo.xyz' doesn't exist

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro18();
Query OK, 0 rows affected (0.02 sec)

mysql> desc xyz;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| c1    | int  | YES  |     | NULL    |       |
| c2    | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro18();
ERROR 1050 (42S01): Table 'xyz' already exists
mysql>

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro18();
+-------------------------+
| (display)Message Window |
+-------------------------+
| table xyz found         |
+-------------------------+
1 row in set (0.00 sec)
*/
#---------------------------------------------------------------------
/*
drop procedure if exists pro19;
delimiter $$
create procedure pro19()
	BEGIN
		declare exit handler for 1051 call display("table Not found...!");
		declare exit handler for 1050 call display("table xyz found");
		drop table xyz;

		create table xyz(c1 int, c2 int);
		call display("table xyz created");
	END $$
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call pro19();
+-------------------------+
| (display)Message Window |
+-------------------------+
| table xyz created       |
+-------------------------+
1 row in set (0.02 sec)

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
#---------------------------------------------------------
/*
drop procedure if exists pro20;
delimiter $$
create procedure pro20()
	BEGIN
		declare cnt int default 0;
		# declare cnt int;           # infinite loop

		# declare cnt int; # valid
		# set cnt := 0;

		incr:LOOP
			select cnt;
			set cnt := cnt + 1;
			if cnt > 4 then
				leave incr;
			end if;
			call display("after end of IF");
		END LOOP incr;
		call display("after end of LOOP");
	END $$
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro20();
+------+
| cnt  |
+------+
|    0 |
+------+
1 row in set (0.00 sec)

+-------------------------+
| (display)Message Window |
+-------------------------+
| after end of IF         |
+-------------------------+
1 row in set (0.00 sec)

+------+
| cnt  |
+------+
|    1 |
+------+
1 row in set (0.00 sec)

+-------------------------+
| (display)Message Window |
+-------------------------+
| after end of IF         |
+-------------------------+
1 row in set (0.00 sec)

+------+
| cnt  |
+------+
|    2 |
+------+
1 row in set (0.01 sec)

+-------------------------+
| (display)Message Window |
+-------------------------+
| after end of IF         |
+-------------------------+
1 row in set (0.01 sec)

+------+
| cnt  |
+------+
|    3 |
+------+
1 row in set (0.01 sec)

+-------------------------+
| (display)Message Window |
+-------------------------+
| after end of IF         |
+-------------------------+
1 row in set (0.01 sec)

+------+
| cnt  |
+------+
|    4 |
+------+
1 row in set (0.01 sec)

+-------------------------+
| (display)Message Window |
+-------------------------+
| after end of LOOP       |
+-------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.02 sec)
*/
#--------------------------------------------------------
/*
drop procedure if exists pro21;
delimiter $$
	create procedure pro21(OUT x varchar(200))
		BEGIN 
			 set x := "Hello world Good Morning";
		END $$
delimiter ;

drop procedure if exists pro22;
delimiter $$
	create procedure pro22()
		BEGIN 
			declare xx varchar(200);
 			#call pro21(xx);
 			call display(xx);
		END $$
delimiter ;
*/

/*
mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro22();
+--------------------------+
| (display)Message Window  |
+--------------------------+
| Hello world Good Morning |
+--------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> source D:\C-DAC Hydrabad\Lecture videos\MySQL\plsql1.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call pro22();
+-------------------------+
| (display)Message Window |
+-------------------------+
| NULL                    |
+-------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

*/