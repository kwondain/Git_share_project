create table pet_Member(
member_id varchar(20) primary key
,member_pass varchar(20) not null
,member_name varchar(30) not null
,member_nickname varchar(100) not null
,member_gender varchar(5) not null
,member_email varchar2(40) not null
,member_zip1 varchar(3) not null
,member_zip2 varchar(3) not null
,member_addr1 varchar(100) not null
,member_addr2 varchar(100) not null
);