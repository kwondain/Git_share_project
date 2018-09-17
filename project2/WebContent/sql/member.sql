drop table pet_Member purge;
-- 회원관리 테이블 작성
create table pet_Member(
member_id varchar(20) primary key
,member_pass varchar(20) not null
,member_name varchar(30) not null
,member_nickname varchar(100) not null
,member_gender varchar(10) not null
,member_email varchar(40) not null
,member_zip varchar(10) not null
,member_addr1 varchar(100) not null
,member_addr2 varchar(100) not null
);
-- 테이블 구조
select * from pet_Member;
truncate table pet_Member;
insert into pet_Member(member_id,member_pass,member_name,
member_nickname,member_gender,member_email,member_zip,member_addr1,
member_addr2)
values('hong','1234','홍길동','의적','남','lampshade26@naver.com','123',
'서울시 강남구 테헤란로', 'IT정보기술원');

update pet_Member set member_pass=1233, member_name='홍길동', member_nickname='의적', member_gender='여', member_email='lampshade26@naver.com',
	member_zip=123, member_addr1='서울시 강남구 테헤란로', member_addr2='IT정보기술원' where member_id='hong';

commit work;