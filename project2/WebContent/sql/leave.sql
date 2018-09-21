create table pet_leave(
	leave_id varchar2(20) primary key,
	leave_name varchar2(20) not null,
	leave_birth varchar2(30) not null,
	leave_tel varchar2(30) not null,
	leave_address varchar2(200) not null,
	leave_title varchar2(100) not null,
	leave_size varchar2(10) not null,
	leave_age varchar2(10) not null,
	leave_option varchar2(200),
	leave_file varchar2(100) not null
);

select * from pet_leave;

drop table pet_leave;
truncate table pet_leave;