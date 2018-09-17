-- admin.sql
create table admin(
	admin_no number(10) primary key,
	admin_id varchar(50) not null,	/* 관리자 아이디 */
	admin_pwd varchar(50) not null	/* 관리자 비번 */
);
-- 시퀀스 객체 생성
create sequence admin_no_seq 
    increment by 1 start with 1 nocache;
-- 레코드 삽입
insert into admin 
     values(admin_no_seq.nextval,'admin','admin');
-- 레코드 조회
select * from admin;

commit work;