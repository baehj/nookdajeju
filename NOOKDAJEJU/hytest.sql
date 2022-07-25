--이것만 실행해주세요 일단 review의 bookno에 null 들어가도록 수정 --
alter table review modify (bookno number null);

-- 리뷰 테스트하고 싶으신 분 실행해주세요 --
insert into review values(1,4,'호텔 바로 앞에 바다가 있어서 정말 좋았어요ㅎㅎㅎ위치가 정말 환상적인 호텔이네요',sysdate,1,5,1,'1.jpg','n');
insert into review values(2,5,'위치좋고 공항에서 가까워서 자주 이용하는 호텔이에요.저같은 뚜벅이 여행자들에겐 택시로 이용할 수 있거든요.',sysdate,2,5,2,'2.jpg','n');
insert into review values(3,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,1,5,3,'3.jpg','n');

-- 테스트파일 실행하지 마세요 --
select * from member;
delete from member where mno > 5;
update member set mhost = 'y' where mno = 8;

select * from likes;
insert into likes values (1,5,1);
insert into likes values (2,5,2);
insert into likes values (3,5,3);
insert into likes values (4,5,4);
insert into likes values (5,5,5);
insert into likes values (6,5,6);
insert into likes values (7,5,7);
insert into likes values (8,5,8);
insert into likes values (9,5,9);
insert into likes values (10,5,10);
insert into likes values (11,5,11);
select count(*) from likes where mno = 5;

select * from booking;
insert into booking values (1,5,1,20220512,20220518,20220519,2,200000,'credit card',null,'y');
insert into booking values (2,5,2,20220512,20220519,20220520,2,300000,'credit card',null,'y');
insert into booking values (3,5,1,20220512,20220625,20220627,2,600000,'credit card',null,'y');
update booking set bookstatus='y' where bookno=1;

select * from review;
select count(*) from review where del = 'n' and acmno = 1;
update review set del='n' where rvno = 1;

select * from (select e.*, rowNum rn
from (select l.*, acm.acm_name
from likes l, acm acm
where l.acmno = acm.acmno and l.mno = 5 and acm.del='n' order by lno desc) e)
		where rn between 0 and 7;

		select * from (select a.*, rowNum rn 
					   from (select * from acm where mno=#{mno}
					   order by acmno ) a)
		where rn between #{startRow} and #{endRow}

