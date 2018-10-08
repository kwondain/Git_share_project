create table reservation(
	id varchar2(20) not null,
	leave_id varchar2(20) not null,
	pet_number number(3) not null,
	startdate varchar2(50) not null,
	enddate varchar2(50) not null,
	regdate DATE DEFAULT (sysdate)
);

select * from reservation;

drop table reservation;
