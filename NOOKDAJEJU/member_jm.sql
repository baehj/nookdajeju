-- member Table Create SQL

drop table member cascade constraints;

CREATE TABLE member
(
    mno          NUMBER           CONSTRAINT member_mno_pk PRIMARY KEY	NOT NULL, 
    memail       VARCHAR2(200)    NOT NULL, 
    mpw          VARCHAR2(100)    NOT NULL, 
    mlastname    VARCHAR2(40)     NOT NULL, 
    mfstname     VARCHAR2(60)     NOT NULL, 
    mphone       VARCHAR2(20)     NOT NULL, 
    nickname     VARCHAR2(30)     NOT NULL, 
    mhost        CHAR(1)          default 'n'	NOT NULL, 
    mregdate     DATE             NOT NULL, 
    del          CHAR(1)          default 'n'	NOT NULL
);

select * from member order by mno;

insert into member values(0, 'admin', '1111', '어', '드민', '010-0000-0000', 'admin', 'y', sysdate, 'n');
insert into member values(1, 'user@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(2, 'host1@nookda.com', '1111', '호', '스트1', '010-0000-0000', 'host1', 'y', sysdate, 'n'); 
insert into member values(3, 'host2@nookda.com', '1111', '호', '스트2', '010-0000-0000', 'host2', 'y', sysdate, 'n');

insert into member values(7, 'user2@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(8, 'user3@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(9, 'user4@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(10, 'user5@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(11, 'user6@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(12, 'user7@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(13, 'user8@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(14, 'user9@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(15, 'user10@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(16, 'user11@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(17, 'user13@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(18, 'user14@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(19, 'user15@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(20, 'user16@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');

insert into member values(21, 'user17@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(22, 'user18@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(23, 'user19@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(24, 'user20@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(25, 'user21@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(26, 'user22@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(27, 'user23@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(28, 'user24@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(29, 'user25@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(30, 'user26@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(31, 'user27@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(32, 'user28@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(33, 'user29@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(34, 'user30@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(35, 'user31@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(36, 'user32@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(37, 'user33@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(38, 'user34@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(39, 'user35@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(40, 'user36@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(41, 'user37@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(42, 'user38@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(43, 'user39@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(44, 'user40@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(45, 'user41@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(46, 'user42@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(47, 'user43@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(48, 'user44@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(49, 'user45@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(50, 'user46@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
