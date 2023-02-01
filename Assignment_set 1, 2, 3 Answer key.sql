#ASSIGNMENT
#Assignment Set 1 Q 1
Create Database Assignment;

#SET 1 Q 3
create table Countries (Name VARCHAR(50), Population INT, Capital varchar(50));
insert into Countries values("China ", 1382, "Beijing"),
                                                      ("India", 1326,"Delhi"),
                                                     ("United States",  324, "Washington D.C."),
                                                     ("Indonesia",	260, "Jakarta"),
                                                     ("Brazil", 209, "Brasilia"),
													("Pakistan",	 193, "Islamabad"),
                                                    ("Nigeria", 187, "Abuja"),
                                                    ("Bangladesh", 163, "Dhaka"),
                                                    ("Russia",	 143, "Moscow"),
                                                     ("Mexico", 128, "Mexico City"),
                                                    ("Japan", 126, "Tokyo"),
                                                    ("Philippines", 102, "Manila"),
                                                   ("Ethiopia",	101, "Addis Ababa"),
                                                   ("Vietnam", 94, "Hanoi"),
("Egypt", 93, "Cairo"),
("Germany", 81, "Berlin"),
("Iran", 80, "Tehran"),
("Turkey", 79,	"Ankara"),
("Congo", 79, "Kinshasa"),
("France", 64, "Paris"),
("United Kingdom", 65, "London"),
("Italy", 60, "Rome"),
("South Africa", 55, "Pretoria"),
("Myanmar", 54,"Naypyidaw");

#SET 1 Q3 b
Insert into countries
values("Afghnistan",  54 , "Kabul"),
             ("Australia",   122 , "Canberra"),
              ("Bhutan", 95, "Thimphu");

#SET 1 Q 3 c
select* From Countries;
 UPDATE Countries
Set Capital = "New Dwlhi"
WHERE Capital= "Delhi";

#SET 1 Q 4
rename table Countries to big_countries;

#SET 1 Q 5 - a
create table Product(
product_id int primary key ,
product_name Varchar(50) Not null Unique,
supplier_id int,
 FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
); 
#SET 1 Q 6
insert into product
values(101, "Bat", 121),
             (102, "Ball" ,131),
             (103, "Football",142);
             select * from product;
         
  #EST 1 Q 5 - b       
create table Suppliers(
supplier_id int primary key,
supplier_name varchar(50),
location varchar(80)
);
#Set 1 Q 6
insert into suppliers
values(121, "Sagar Wadile", "Delhi"),
             (131, "Nikhil Jagtap", "Pune"),
             (142, "Ketan Tekade", "Nagpur");
select * from suppliers;

#SET 1 Q 5-c
create table Stock(
id int primary key,
product_id int,
 FOREIGN KEY (product_id) REFERENCES product (product_id),
balance_stock int
);
#Set 1 Q 6
insert into stock
values(11, 101, 50),
             (12, 102, 75),
             (13, 103, 25); 
             
#SET 1 Q 7
ALTER TABLE suppliers MODIFY supplier_name varchar(50) NOT NULL;

ALTER TABLE suppliers ADD CONSTRAINT suppliers UNIQUE(supplier_name); 

#SET 1 Q 8
ALTER TABLE emp ADD deptno int default 10;
UPDATE emp
SET deptno = 20
WHERE emp_no%2=0;
update emp 
set deptno=30
 where emp_no % 3=0;
update emp
set deptno=40
where emp_no% 4=0;
update emp
set deptno=50
where emp_no% 5=0;
update emp
set deptno = 10 
 WHERE emp_no%null=0;
 Select* From emp;
 
 alter table emp DROP Column deptno;
 
# SET 1 Q 9
Create  unique index idx_empid
on employee( empid );

#SET 1 Q 10 
CREATE VIEW emp_salary AS 
SELECT t1.emp_no, t1.first_name, t1.last_name, t2.salary
FROM emp AS t1 LEFT JOIN emp AS t2
ON t1.salary = t2.salary
order by salary Desc;



# Assignment Set 2
#SET @ Q 1
SELECT * FROM employee
WHERE salary > 3000
 GROUP BY deptno=10;

#SET 2 Q2 a&b
SELECT CASE WHEN marks BETWEEN 81 AND 100 then 'Distinction' 
            WHEN marks BETWEEN 51 AND 80 then 'First Class' 
           WHEN marks BETWEEN 40 AND 50 then 'Second class'  
            ELSE 'No Grade Available' 
        END Grade,
        COUNT(*) AS stud_count
FROM students 
WHERE marks > 50   
GROUP BY CASE WHEN marks BETWEEN 81 AND 100 then 'Distinction' 
            WHEN marks BETWEEN 51 AND 80 then 'First Class' 
            WHEN marks BETWEEN 40 AND 50 then 'Second class'  
            ELSE 'No Grade Available' 
        END;

#SET 2 Q 3
SELECT CITY
FROM STATION
WHERE MOD(ID, 2) = 0


#SET 2 Q 4
#SELECT (COUNT(city) - COUNT(DISTINCT city)) AS difference FROM station;
select (( select count(city)AS N  from station) - ( select count(distinct city)AS N1 from station ))
       as ans;
       
#SET 2 Q 5 a
  SELECT DISTINCT city
    FROM station
    WHERE UPPER(LEFT(city, 1))  IN ('A', 'E', 'I', 'O', 'U');
                     
#SET 2 Q 5 b
       SELECT DISTINCT city
    FROM station
    WHERE UPPER(LEFT(city, 1)) IN ('A', 'E', 'I', 'O', 'U')
                     And lower(RIGHT(city, 1))  IN ('A', 'E', 'I', 'O', 'U');
                     
#SET2 Q 5 c
        SELECT DISTINCT city
    FROM station
    WHERE UPPER(LEFT(city, 1)) NOT  IN ('A', 'E', 'I', 'O', 'U');
           
 #SET 2 Q 5 d          
        SELECT DISTINCT city
    FROM station
    WHERE UPPER(LEFT(city, 1)) Not IN ('A', 'E', 'I', 'O', 'U')
                     AND Lower(RIGHT(city, 1)) Not  IN ('A', 'E', 'I', 'O', 'U'); 
       
 #SET 2 Q 6  
      SELECT *
FROM Emp 
WHERE Salary > 2000
  AND Hire_Date >= DATE_SUB(CURRENT_DATE, INTERVAL 36 MONTH)
ORDER BY salary DESC; 
       
 #SET 2 Q 7      
    SELECT deptno, SUM(salary)
FROM employee 
GROUP BY deptno;   

#SET 2 Q8
select count(*) from CITY WHERE POPULATION > 100000;

#SET 2 Q 9
SELECT sum(POPULATION)
FROM CITY
WHERE DISTRICT = "California";


#SET2 Q 10
select district, avg(population) as avg_population
from city
where countrycode in('JPN', 'USA', 'NLD')
group by district; 



# Set 2 Q11
SELECT a.orderNumber,a.status,
 b.customerNumber,b.customerName AS "Customer_Name"
FROM orders a 
INNER JOIN customers b;

#Assignment Set 3
#Set 3 Q1
Delimiter //
CREATE PROCEDURE Order_status ( IN order_year int, IN order_month  int )
Begin

SELECT orderNumber, orderDate, status   FROM orders 
WHERE year (orderdate)= order_year AND month(orderdate) = order_month;


End //

Call Order_status (2005, 3);

#SET 3 Q2-a
Create Table Cancellations(id int Primary key,
CustomerNumber int,
 foreign key(CustomerNumber) references Customers(CustomerNumber), 
OrderNumber int, 
foreign key(orderNumber) references Orders(orderNumber),
Comment Varchar(400));
#SET  3 Q2-b
insert into Cancellations
values
(001, 448, 10167, " Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them"),
(002, 496, 10179, " Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges"),
(003, 131, 10248, " Order was mistakenly placed. The warehouse noticed the lack of documentation"),
(004, 201, 10253, " Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees"),
(005, 357,10260, " Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager"),
(006, 141, 10262, "This customer found a better offer from one of our competitors. Will call back to renegotiate");
select * From Cancellations;

#SET 3 Q 3-a
Delimiter //
create function pur_stat(cid int)
returns varchar(20)
deterministic
begin
declare stat varchar(20);
declare credit numeric;
SET credit=(select sum(Amount) From Payments where Customernumber= cid);
IF credit >50000 THEN
SET stat ='Platinum';
elseif (credit >= 25000 AND credit <= 50000) THEN
 SET stat= 'Gold';
 elseif credit <25000 THEN
 SET stat = 'Silver';
 END IF;
 RETURN (stat);
 END //
 
 select 103 as Cust_number, pur_stat(103) as purchase_status;
 
 
#SET 3 Q 4
DELIMITER $$
CREATE TRIGGER trg_movies_update
AFTER DELETE ON movies
FOR EACH ROW
BEGIN
    UPDATE rentals
    SET movieid = id
    WHERE movieid = OLD.id ;
END;

DELIMITER $$
CREATE TRIGGER trg_movies_delete 
AFTER DELETE ON movies 
FOR EACH ROW 
BEGIN
    DELETE FROM  rentals
    WHERE movieid 
    NOT IN (SELECT DISTINCT id FROM movies);
END;

#SET 3 Q 5
SELECT fname, salary
FROM employee
ORDER BY salary DESC 
LIMIT 2, 1;

#SET 3 Q 6
SELECT empid,
               fname,
               lname,
               salary,
	RANK() OVER (ORDER BY salary DESC) salary_rank 
FROM 
	employee;
