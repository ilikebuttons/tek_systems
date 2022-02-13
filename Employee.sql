-- create database called example-db
CREATE database example_db;
use example_db;

-- employee table has emp id, name, and age.
CREATE table employee (
	emp_id int(4) primary key auto_increment, 				-- not null not needed, implied b/c its primary key
	name varchar(255) not null default 'MISSING',			-- not null and default shouldn't actually be together
	age tinyint check(age >= 0)
);
describe employee;

insert into employee(`name`, `age`) values ('keith', 25);
-- insert into employee(`name`, `age`) values ('jafer', -1); -- throws error
insert into employee(`name`, `age`) values ('jafer', 1);
insert into employee(`name`, `age`) values ('reema', 45);
insert into employee(`age`) values (33);
select * from employee;

delete * from employee where emp_id = 3;

-- address table address id, address street, city, state, fk_emp_id, timestamp w/ default time of now
-- constraints fk in address table for employee table
CREATE table address (
	address_id int(11) primary key auto_increment,
	address_street varchar(255) not null default 'unknown',
	city varchar(255) not null default 'unknown',
	state char(2) not null default 'NA',
	timestamp TIMESTAMP not null default NOW(6),	-- needs to be not null b/c otherwise it could be spoofed later... wait what?
	fk_emp_id int(4),
	constraint some_name foreign key(fk_emp_id) references employee(emp_id)
);
describe address;

insert into address (`address_street`, `city`, `state`, `fk_emp_id`)
values ('123 street', 'plano', 'TX', 2);
values ('123 street', 'plano', 'TX', 120);
select * from address;