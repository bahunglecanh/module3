create database bt1;
use bt1;

create table Class(
	id int auto_increment primary key,
    `name` varchar(50)
);
create table Teacher (
	id int auto_increment primary key,
    `name` varchar(50),
    age int,
    country varchar(50)
);

insert into Class(name) values('Công nghệ thông tin'),('Marketting');

insert into Teacher(name,age,country) values('Ba Hung',22,'Đà Nẵng'),('Le Canh', 24,'Quang Tri');