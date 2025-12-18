USE master;
GO
create DataBase Task2_Problem7
GO

USE  Task2_Problem7
GO

-----------Problem 7---------
create table Customers(
    customer_id  int,
    f_name   varchar(20),
    l_name   varchar(20),
    email   varchar(50),
    constraint pk_cus_id PRIMARY KEY (customer_id)
);

create table Orders(
    order_id  int,
    customer_id int,
    order_date  date,
    amount    decimal(6,2),
    constraint pk_or_id PRIMARY KEY (order_id),
    constraint fk_cus_id FOREIGN KEY (customer_id) References Customers (customer_id)
);


INSERT INTO Customers(customer_id, f_name,l_name, email) VALUES
    (1, 'John','Doe', 'john@email.com'),
    (2, 'Jane','Smith', 'jane@email.com'),
    (3, 'Mike','Johnson','mike@email.com');

INSERT INTO Orders (order_id , customer_id, order_date, amount) VALUES
    (101, 1,'2024-03-10', 250.00),
    (102, 1,'2024-02-20', 180.50),
    (103, NULL,'2024-03-10',99.99),
    (104, 2,'2024-03-15',320.00);

    select f_name + ' ' + l_name as Full_Name ,Order_id , amount
    from Customers c full join Orders o
    on c.customer_id = o.customer_id