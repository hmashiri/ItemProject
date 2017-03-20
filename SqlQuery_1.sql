
-- PLEASE CHECK BELOW FOR ANSWERS TO THE SQL ASSESSMENT -- 

-- create table Departments( DepartmentId int not null primary key Identity(1,1), Name varchar(100) not null ); 
--insert into Departments(Name) values('second department');
--insert into Departments(Name) values('HR'), ('Customer Service'); 

--select 
--	e.Name, 
--	d.Name as Department_Name, 
--	e1.Name as Boss_Name 
--from
--	Employees e,
--	Employees e1,
--	Departments d
--where 
--	e.DepartmentID = d.DepartmentID and 
--	e.BossID = e1.EmployeeID;

--select Name, Salary, EmployeeID, BossID from Employees;
--select * from Departments;

--create table Employees( 
--						EmployeeID int not null primary key identity(1,1), 
--						DepartmentID int, 
--						BossID int, 
--						Name varchar(100), 
--						Salary numeric(10,2),
--						foreign key (BossID) references Departments(DepartmentID) );   

--insert into Employees( DepartmentID, BossID, Name, Salary ) values( 2, 1, 'Jimmy Kimmel', 40000.00 ),(2,1,'Hadjumyster', 35000); 

--insert into Employees( DepartmentID, BossID, Name, Salary ) values( 1,2, 'Oompa Loompa', 10000.00 ), ( 4,1, 'Tom Brady', 24000000.00);

--insert into Employees( DepartmentID, BossID, Name, Salary ) values( 5,NULL, 'Cristiano Ronaldo', 80000000.00 ), ( 5, 2, 'Sarah Thomas', 14000.00);

--insert into Employees( DepartmentID, BossID, Name, Salary ) values( 1,2, 'Lionel Messi', 90000000.00 ), ( 2,1, 'Justin Beaver', 91000000 );

--select 
--	e.EmployeeID, 
--	e.BossID, 
--	e.Name, 
--	e.Salary, 
--	d.Name as Department 
--from
--	Employees e,
--	Departments d
--where
--	e.DepartmentID = d.DepartmentID;  

--------------------------------------------------ANSWERS OF SQL TEST------------------------------------------------------

-- a)

--select
--	e.Name
--from
--	Employees e,
--	Employees b

--where
--	e.BossID = b.EmployeeID and
--	e.Salary > b.Salary

-- b)

--select DepartmentID, MAX(Salary) as salary from employees group by DepartmentID;

--select DepartmentID, Name, Salary 
--from (select DepartmentID, Name, Salary, 
--rank() Over(Partition by DepartmentID order by salary desc) as rank 
--from Employees) emp where emp.rank = 1;

-- c)

-- select DepartmentID  from Employees group by DepartmentID having count(*) < 3;

-- d)

--select DepartmentID , count(*) as "Number of employees" from Employees group by DepartmentID;

-- e) 

--select DepartmentID, Name from Employees where BossID is null or BossID = EmployeeID order by DepartmentID; 

-- f) 

--select DepartmentID, sum(Salary) as "Total Salary" from Employees group by DepartmentID; 

