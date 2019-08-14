drop database if exists bamazonDB;

create database bamazonDB;

use bamazonDB;

create table products(
id integer AUTO_INCREMENT not null,
product_name varchar(100) not null,
department_name varchar(100) not null,
price decimal (8,2) not null,
stock_quantity integer not null,
primary key (id)
);


insert into products (product_name, department_name, price, stock_quantity) values ("SS17 Swim Spa", "sales", 25000.00, 10);
insert into products (product_name, department_name, price, stock_quantity) values ("SS15 Swim Spa", "sales", 20000.00, 10);
insert into products (product_name, department_name, price, stock_quantity) values ("FS11 Spa", "sales", 15000.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("PL8 Spa", "sales", 10000.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("B5 Spa", "sales", 4500.00, 5);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa Pump", "warranty", 350.00, 200);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa Topside", "warranty", 300.00, 10);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa Ozonator", "warranty", 200.00, 20);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa Cover", "warranty", 700.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa Plumbing", "warranty", 150.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("Filter", "ecommerce", 80.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa First-Aid Kit", "ecommerce", 150.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("Spa Shock", "ecommerce", 30.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("Massage Jet Upgrade Pack", "ecommerce", 200.00, 15);
insert into products (product_name, department_name, price, stock_quantity) values ("Fitness Kit", "ecommerce", 1500.00, 15);

select * from products;

