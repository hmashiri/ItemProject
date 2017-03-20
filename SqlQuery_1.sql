 
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

