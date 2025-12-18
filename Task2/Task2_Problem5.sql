USE master;
GO
create DataBase Task2_problem5
GO

USE Task2_problem5
GO


--------------Problem 5-----------

create table Departments(
     dept_id int,
     dept_name  varchar(50),
     constraint pk_dept Primary KEY (dept_id)
);
create table Employees(
    emp_id int ,
    emp_name  varchar(50),
    dept_id int,
    CONSTRAINT PK_id PRIMARY KEY (emp_id),
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
    (101, 'Sales'),
    (102, ' Marketing'),
    (103, 'IT');

    INSERT INTO Employees (emp_id, emp_name,dept_id) VALUES
    (1, 'Alice', 101),
    (2, ' Bob',   Null),
    (3, 'Charlie', 102),
    (4, 'Diana', Null);

    select emp_name AS EMP_NAME , ISNULL(dept_name,'Unassigned') As DEPT_NAME
    from Employees e left join Departments d
    on d.dept_id = e.dept_id




