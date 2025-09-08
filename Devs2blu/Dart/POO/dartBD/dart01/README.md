Só põe isso no MySql e ve se funfa

create User 'paozinho'@'localhost' identified by 'senha';
grant all privileges on *.* to 'paozinho'@'localhost';
select * from mysql.user;
create database biblioteca;

use biblioteca;

create table livros(
idlivro int primary key auto_increment,
titulo varchar(45) not null,
autor varchar(45) not null
);

select * from livros;