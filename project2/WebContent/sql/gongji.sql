--gongji.sql
create table gongji(
	gongji_no int primary key,
	gongji_name varchar(50) not null,
	gongji_title varchar(200) not null,
	gongji_cont varchar(4000),
	gongji_pwd varchar(50) not null,
	gongji_hit int default 0,   -- 조회수
	gongji_regdate date
);

select * from gongji;

-- 시퀀스 객체 생성
drop sequence gongji_seq
delete GONGJI
create sequence gongji_seq 
   increment by 1 start with 1 nocache;
insert into gongji
     values(gongji_seq.nextval,'관리자','공지1','내용1',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지2','내용2',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지3','내용3',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지4','내용4',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지5','내용5',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지6','내용6',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지7','내용7',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지8','내용8',
     '1234',default, sysdate);
insert into gongji
     values(gongji_seq.nextval,'관리자','공지9','내용9',
     '1234',default, sysdate); 
insert into gongji
     values(gongji_seq.nextval,'관리자','공지10','내용10',
     '1234',default, sysdate); 
insert into gongji
     values(gongji_seq.nextval,'관리자','공지11','내용11',
     '1234',default, sysdate);      
     
select * from GONGJI order by GONGJI_no desc;
commit work;

