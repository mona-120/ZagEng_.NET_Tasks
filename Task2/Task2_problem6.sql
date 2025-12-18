USE master;
GO
create DataBase Task2_Problem6
GO

USE  Task2_Problem6
GO

-----------Problem 6----------

create table Supplier(
    supplier_id  int,
    supplier_name varchar(50),
    country   varchar(70),
    CONSTRAINT PK_sup_id PRIMARY KEY (supplier_id)
);

create table Product(
    product_id  int,
    product_name varchar(50),
    supplier_id  int,
    CONSTRAINT PK_pro_id PRIMARY KEY (product_id),
    CONSTRAINT fk_Sup FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

INSERT INTO Supplier (Supplier_id, Supplier_name, country) VALUES
    (201, 'TechCorp', 'USA'),
    (202, 'CompuWorld', 'Canada'),
    (203, 'MobileTech', 'China');

INSERT INTO Product(product_id, product_name, supplier_id) VALUES
    (1, 'iPhone 14', 201),
    (2, 'Laptop Pro', 202),
    (3, 'Samsung Phone', NULL),
    (4, 'Headphones', 201),
    (5, 'Android Phone X', 203);

select Product_name , Supplier_name
from Product p left join Supplier s
on p.supplier_id = s.supplier_id
where product_name like '%Phone%'



