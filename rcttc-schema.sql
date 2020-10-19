drop database if exists tiny_theaters;
create database tiny_theaters;

use tiny_theaters;

create table theater(
theater_id int primary key auto_increment not null,
theater varchar(25) not null,
theater_address varchar(65) not null,
theater_phone varchar(25) not null,
theater_email varchar(25) not null
);

create table customer(
customer_id int primary key auto_increment not null,
customer_first varchar(25) not null,
customer_last varchar(25) not null,
customer_email varchar(45),
customer_phone varchar(25),
customer_address varchar(25) not null
);

create table seat(
seat_id int primary key auto_increment not null,
seat varchar(2) not null,
theater_id int not null,
constraint fk_seat_theater_id
	foreign key (theater_id)
	references theater(theater_id)
);

create table show_date(
show_date_id int primary key auto_increment not null,
show_date date not null
);

create table `show` (
show_id int primary key auto_increment not null,
`show` varchar(25) not null
);

create table theater_show_date (
theater_id int not null,
show_date_id int not null,
show_id int not null,
price decimal(4,2) not null,
constraint pk_theater_show_date
	primary key(theater_id, show_date_id),
constraint fk_theater_show_date_theater_id
	foreign key(theater_id)
    references theater(theater_id),
constraint fk_theater_show_date_show_date_id
	foreign key(show_date_id)
    references show_date(show_date_id),
constraint fk_theater_show_date_show_id
	foreign key(show_id)
    references `show`(show_id)
);

create table ticket(
	ticket_id int primary key auto_increment not null,
    theater_id int not null,
    customer_id int not null,
    show_date_id int not null,
    seat_id int not null,
constraint fk_ticket_theater_id
	foreign key(theater_id)
    references theater(theater_id),
constraint fk_ticket_customer_id
	foreign key(customer_id)
	references customer(customer_id),
constraint fk_ticket_show_date_id
	foreign key(show_date_id)
	references show_date(show_date_id),
constraint fk_ticket_seat_id
	foreign key(seat_id)
	references seat(seat_id)
    );

