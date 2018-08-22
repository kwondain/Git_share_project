-- board.sql
drop table board purge;

create table board(
board_no int primary key
,board_name varchar(20) not null
,board_title varchar(50) not null
,board_cont varchar(4000)
,board_pwd varchar(20) not null
,board_hit int default 0
,board_regdate date
);


-- 시퀀스 생성
drop sequence board_seq;
create sequence board_seq
       increment by 1 start with 1;
-- 레코드 추가
insert into board values(board_seq.nextval,'홍길동',
      '제목1','내용1','1234',default,sysdate);
insert into board values(board_seq.nextval,'이순신',
      '제목2','내용2','1234',default,sysdate);
insert into board values(board_seq.nextval,'유관순',
      '제목3','내용3','1234',default,sysdate);
select * from BOARD;
commit work;

       
       
       
       
       










