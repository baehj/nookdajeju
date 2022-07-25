----------------- 월별 매출액 #{acmno}를 7번으로 가정.
SELECT  TO_CHAR(b.dt, 'YYYY-MM') AS checkout, NVL(SUM(a.income), 0) income
FROM (SELECT TO_CHAR(TO_DATE(checkout), 'YYYY-MM-DD') AS checkout, sum(bookprice) income
	  FROM booking
	  WHERE (TO_DATE(checkout)) BETWEEN TO_DATE((select to_char(sysdate,'yyyy')||'-01-01'from dual)) AND TO_DATE((select to_char(sysdate,'yyyy')||'-12-31' from dual)) and bookstatus != 'n' and acmno=7
	  GROUP BY checkout ) a,
	 (SELECT TO_DATE((select to_char(sysdate,'yyyy')||'-01-01'from dual)) + LEVEL - 1 AS dt
      FROM dual 
      CONNECT BY LEVEL <= (TO_DATE((select to_char(sysdate,'yyyy')||'-12-31' from dual)) - TO_DATE((select to_char(sysdate,'yyyy')||'-01-01'from dual)) + 1) ) b
WHERE b.dt = a.checkout(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM');
----------------------
SELECT TO_CHAR(b.dt, 'YYYY-MM') AS checkout, NVL(SUM(a.income), 0) income
FROM (SELECT TO_CHAR(TO_DATE(checkout), 'YYYY-MM-DD') AS checkout, sum(bookprice) income
		FROM booking
		WHERE (TO_DATE(checkout)) BETWEEN TO_DATE((select to_char(sysdate,'yyyy')||'-01-01'from dual)) AND TO_DATE((select to_char(sysdate,'yyyy')||'-12-31' from dual)) and bookstatus != 'n' and acmno=#{acmno}
		GROUP BY checkout ) a,
		(SELECT TO_DATE((select to_char(sysdate,'yyyy')||'-01-01'from dual)) + LEVEL - 1 AS dt
		FROM dual
		CONNECT BY LEVEL <![CDATA[<=]]> (TO_DATE((select to_char(sysdate,'yyyy')||'-12-31' from dual)) - TO_DATE((select to_char(sysdate,'yyyy')||'-01-01'from dual)) + 1) ) b
		WHERE b.dt = a.checkout(+)
		GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
		ORDER BY TO_CHAR(b.dt, 'YYYY-MM');
   
select * from booking;
		
(select to_char(sysdate,'yyyy')||'-12-31' from dual)
(select to_char(sysdate,'yyyy')||'-01-01' from dual)
to_char(sysdate,'yyyy')||'1231'
from dual;

sysdate;

select 

select * from acm;
-- 1) 사이기간 날짜구하기 
SELECT YMD
FROM (SELECT TO_DATE ('2022-06-02', 'YYYY-MM-DD')+(LEVEL-1) YMD
	  FROM DUAL
	  CONNECT BY TO_DATE ('2022-06-02', 'YYYY-MM-DD')+(LEVEL-1) <=TO_DATE ('2022-06-05', 'YYYY-MM-DD'));
	  
-- 2) 사이날짜
SELECT TO_CHAR(TO_DATE('2022-06-02', 'YYYY-MM-DD') + (LEVEL-1), 'YYYY-MM-DD') AS "booked"
FROM DUAL
CONNECT BY LEVEL <= TO_DATE('2022-06-05', 'YYYY-MM-DD') - TO_DATE('2022-06-02', 'YYYY-MM-DD') + 1;

-- 2) 사이날짜 - 컬럼대입
from ( SELECT TO_CHAR(TO_DATE(checkin), 'YYYY-MM-DD') + (LEVEL-1), 'YYYY-MM-DD') AS "booked"
		FROM DUAL
		CONNECT BY LEVEL <= TO_CHAR(TO_DATE(checkout), 'YYYY-MM-DD') - TO_CHAR(TO_DATE(checkin), 'YYYY-MM-DD') + 1 ) dd,
	booking b (select * from booking where acmno = 22);

-- 1) 사이날짜 - 컬럼대입
SELECT YMD
FROM (SELECT TO_CHAR(TO_DATE(checkin), 'YYYY-MM-DD')+(LEVEL-1) YMD
	  FROM DUAL, BOOKING b
	  CONNECT BY TO_CHAR(TO_DATE(checkin), 'YYYY-MM-DD')+(LEVEL-1) <= TO_CHAR(TO_DATE(checkout), 'YYYY-MM-DD')) dd
where dd.checkin = '2022-06-02' and dd.checkout = '2022-06-05';


-- acmno 17번이 하루나의 뜰. okok 
select * from booking where acmno = 22;

select * from acm;

select * from booking;
select * from review;				
select * from member;
select * from acm order by acmno desc;
delete from acm where acmno > 29;
select * from likes order by lno;
delete from likes where lno=9;
select * from acmpic order by acm_picno desc;
delete from acmpic where acm_picno > 89;

delete from acmpic where acm_picno > 91;

update acm set del = 'n';

  // 예약중
  // 완료 

select * from member;
select * from booking where acmno =2;

-- 1) 2번 숙소에 대한  올해의 월별 매출 내역
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno=2 and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno;
-- 얘는 위에꺼에서 group by뺀건데 안됨. not a single-group group function 이라고 함~~~ 
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno=2 and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY');

--1) 여기서 내가 더 해야하는 것. acmno인데 어떤 acmno냐? 내가 관리하는 acmno 여야하고(sql) - 월별매출내역이 없다면? 0 으로 표시해야함(js로 가능할듯?).

-- not a single-group group function! 그룹화해줘야함. 
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno = (select acmno from acm where mno=2) and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY');

-- not a GROUP BY expression! select절의 컬럼과 group by절의 컬럼이 같지 않아서. 
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno = (select a.acmno from acm a where a.mno = 2) and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by b.acmno;

-- 그래서 같게해줌 -> group function is not allowed here 그룹안된대. why? 그룹바이 절에는 그룹 함수를 사용할 수 없습니다. 따라서 그룹 함수에 쓰여진 컬럼만 작성하시면 됩니다.
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno = (select a.acmno from acm a where a.mno = 2) and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno;

-- 오키 알게씀! 수정 -> single-row subquery returns more than one row
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno = (select a.acmno from acm a where a.mno = 2) and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by b.bookprice, TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno;

-- 오키 수정 acmno로 월별 매출액 나옴. 2022도꺼 -> 이걸 foreach 돌려서 acmno = acmno라면 그안에서 월별 foreach 돌려서 1달 내역있다면? 없다면 0 으로. 해서 js로 값 보내기. 
select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno in (select a.acmno from acm a where a.mno = 2) and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno;
---------------------------------------------- fix!! 
-- 아니아니 fix아님. 원하는 숙소에 대해서 해당 월 내역이 없다면 0 으로 불러오는 것 까지하자. 그래서 숙소리스트에서 이 쿼리를 한번씩 돌리는거야.
select  NVL(sum(b.bookprice), 0), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno
from booking b 
where b.acmno = 2 and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno;

'(TO_DATE(sysdate), 'YYYY')-01-01'

select * from acm where mno = 2 and del='n';
select b.* from booking b where b.acmno in (select a.acmno from acm a where a.mno=2);

----------------- 아래껄로 fix!!!!!!!!!!!!!!!!!!!!!! 월별 매출액.  NVL2(a.acmno, 7)
SELECT  TO_CHAR(b.dt, 'YYYY-MM') AS checkout, NVL(SUM(a.income), 0) income, NVL(a.acmno, 7)
FROM (SELECT TO_CHAR(TO_DATE(checkout), 'YYYY-MM-DD') AS checkout, sum(bookprice) income, acmno
	  FROM booking
	  WHERE (TO_DATE(checkout)) BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD') and bookstatus != 'n' and acmno=7
	  GROUP BY checkout, acmno ) a,
	 (SELECT TO_DATE('2022-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt
      FROM dual 
      CONNECT BY LEVEL <= (TO_DATE('2022-12-31','YYYY-MM-DD') - TO_DATE('2022-01-01','YYYY-MM-DD') + 1) ) b
WHERE b.dt = a.checkout(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM'), a.acmno
ORDER BY TO_CHAR(b.dt, 'YYYY-MM');
----------------------
SELECT  TO_CHAR(b.dt, 'YYYY-MM') AS checkout, NVL(SUM(a.income), 0) income
FROM (SELECT TO_CHAR(TO_DATE(checkout), 'YYYY-MM-DD') AS checkout, sum(bookprice) income
	  FROM booking
	  WHERE (TO_DATE(checkout)) BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD') and bookstatus != 'n' and acmno=7
	  GROUP BY checkout; ) a,
	 (SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -LEVEL+1), 'YYYYMM') AS dt
	  FROM DUAL 
      CONNECT BY LEVEL <= MONTHS_BETWEEN( TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM'), 'YYYYMM'), TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, -12), 'YYYYMM'), 'YYYYMM') ) b
WHERE b.dt = a.checkout(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM')


where b.acmno = 2 and b.bookstatus != 'n' and TO_CHAR(TO_DATE(b.checkout), 'YYYY') = TO_CHAR(TO_DATE(sysdate), 'YYYY')
group by TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), b.acmno;




select * from booking where acmno =2 and bookstatus !='n';

select sum(b.bookprice), TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM'), ab.acm_name
from booking b, (select * from acm a where a.acmno = b.acmno) ab
where b.acmno = (select a.acmno from acm a where a.mno=2) and b.bookstatus != 'n' group by TO_CHAR(TO_DATE(b.checkout), 'YYYY-MM') ;



select a.acm_name, a.acmno from booking b, acm a where a.acmno=b.acmno GROUP BY a.acm_name, a.acmno;

select bookstatus, CASE WHEN checkout > to_char(sysdate, 'YYYY-MM-DD') and bookstatus != 'n' THEN 'y'
 		 	  	  		WHEN checkout = to_char('0000-00-00') THEN 'n'                  				  
		      	 		WHEN to_char(sysdate, 'YYYY-MM-DD') >= checkout THEN 'z'
              	 		ELSE 'x' END as "bs" from booking;
  

select b.*, CASE WHEN b.checkout > to_char(sysdate, 'YYYY-MM-DD') and b.bookstatus != 'n' THEN 'y'
 		 	  	  		WHEN to_char(sysdate, 'YYYY-MM-DD') >= b.checkout and b.bookstatus != 'n' THEN 'z'
              	 		ELSE 'n' END as bs from booking b;
로 하면 bs의 y는 체크아웃 전 (예약중) y / 체크아웃일 또는 체크아웃 이후 (사용완료) n /                				   
update acm set del = 'n' where acmno = 30;
update booking set bookstatus='y' where bookno=7;

-- 리뷰 테스트하고 싶으신 분 실행해주세요 --
alter table review modify (bookno number null);
-- rvno / star_rate / rv_content / rv_regdate / acmno / mno / bookno / rvpic / del   
insert into review values(2,4,'호텔 바로 앞에 바다가 있어서 정말 좋았어요ㅎㅎㅎ위치가 정말 환상적인 호텔이네요',sysdate,1,1,1,'1.jpg','n');
insert into review values(3,5,'위치좋고 공항에서 가까워서 자주 이용하는 호텔이에요.저같은 뚜벅이 여행자들에겐 택시로 이용할 수 있거든요.',sysdate,2,1,2,'2.jpg','n');
insert into review values(4,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');

insert into review values(5,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');
insert into review values(6,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');
insert into review values(7,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');
insert into review values(8,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');
insert into review values(9,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');
insert into review values(10,5,'이번엔 렌트카 없이 갔는데 룸 컨디션도 좋고 조식도 좋았어요!',sysdate,3,1,3,'3.jpg','n');

select r.*, m.nickname, a.acm_name from member m, review r, acm a
where m.mno = r.mno and r.acmno in (select b.acmno from acm b where b.mno =2) and r.del = 'n' group by r.rvno, m.nickname, a.acm_name order by r.rvno desc;

select acmno from acm where mno = 2;
select acmno from acm;

select r.*, a.acm_name, m.nickname
from review r, acm a, member m
where r.acmno=a.acmno and r.mno = m.mno and a.mno=2;

select b.*, a.acm_name from booking b, acm a where b.acmno = a.acmno;

select a.acmno, a.acm_name
from acm a, booking b ( select * from booking where #{checkout} < checkin and #{checkin} >= checkout)
where acm_loc = #{acm_loc} and <![CDATA[#{guestcnt} <= acm_capa]]> and a.acmno = b.acmno;

select a.acmno, a.acm_name 예약이있는게 아닌. 예약이 210521-210519야 그러면 #{ci} < ci이거나 #{co} >co 
from acm a, not(select * from booking where '210521' < checkin or '210519' >= checkout and bookstatus = 'y') b
where acm_loc = '애월읍' and 2 <= acm_capa and a.acmno = b.acmno ;

select * from booking where 210519 >= checkout and 210521 < checkin;
select * from booking where '210519' >= checkout and '210521' < checkin;
select acmno from booking where '230513' < checkin;
select acmno from booking where 230513 < checkin or checkout < ;
							이게나의 체크아웃   또는    체크인 
update booking set bookstatus='y';
	
- 안되는 상황 
1 		체크인 인 체크아웃 웃   (checkin <= #{checkin} and #{checkin}< checkout) 
4	 	체크인 인-웃 체크아웃 			or 		
2 	쳌인	체크인 	 체크아웃 쳌아웃 (#{checkin} <= checkin and checkin < #{checkout}) 
3 	쳌인	체크인 쳌웃	 체크아웃

select b.*, a.* from booking b , acm a where a.acmno=b.acmno ;

select * from acm where acm_loc in 
			<foreach item="acm_loc" index="index" collection="acm_loc.split(',')"  open="(" separator="," close=")">
				#{acm_loc} 
			</foreach>
		and <![CDATA[#{guestcnt} <= acm_capa]]>


select *
from acm a
where a.acm_loc in #{acm_loc} 
					and #{guestcnt} <= acm_capa and a.acmno not(select b.acmno from booking b
																where (b.checkin <= #{checkin} and #{checkin}< b.checkout)
													   				or (#{checkin} <= b.checkin and b.checkin < #{checkout})); 
															   
															   
select * from acm where 지역이=한림읍,애월읍 and 2명 <= 최대인원 and 숙소번호 -가 아닌(from booking where 체크인~ 체크아웃~);		
	   															(북인230512) <= (입230512) and (입230512) < (북웃230513)
    																	(입230512) <= (북인230512) and (북인230512) < (웃230514)
															   			예약입력 (입230512) ~ (웃230512)
select * from booking;													   
select * from booking where acmno=2;
select * from acm where acm_loc='애월읍' order by acm_view;
select * from acm where acm_loc='애월읍' and acm_capa >= 2 and acmno not in (select acmno from booking where ((checkin <='2022-05-12' and '2022-05-12'2<checkout)
						   				or ('2022-05-12'<=checkin and checkin<'2022-05-14')) );
update booking set checkin='2022-05-12' , checkout='2022-05-13' where bookno = 4;
						   				
select * from acm where acm_loc='애월읍' and acm_capa >= 2;
						   				
select * from review;

update review set rvpic = '1.jpg' where rvno = 0;
update review set rvpic = '2.jpg' where rvno = 1;
update review set rvpic = '3.jpg' where rvno = 2;
update review set rvpic = '1.jpg' where rvno = 3;
update review set rvpic = '2.jpg' where rvno = 4;

update acm set ACM_NAME='벵디1967', ACM_LOC='구좌읍', ACM_ADDR='제주특별자치도 제주시 구좌읍 평대2길 39-11', LATITUDE=33.5349238, LONGTITUDE=126.8381624, ACM_CONTENT='취향을 전하는 사람들의 작은 집, 벵디1967
벵디1967은 에메랄드빛 소담한 해변을 끼고 있는 작고 예스러운 제주 마을 ''평대리''에 위치한 독채펜션입니다. 마을 안 작은 동산이 품고 있는 오래된 당근밭 위에 소담하게 하얀 집 두 채를 올려 ''벵디1967''을 만들었습니다. ''벵디1967''이라는 이름은 평대리의 옛 이름인 ''벵디''(=''돌과 잡풀이 우거진 넓은 들판''을 뜻하는 제주도 방언)와 평대리 ''1967''번지를 말합니다.
나무와 돌이주는 아늑한 온기, 태양과 바람이 건네는 자연의 속삭임, 사랑하는 사람과 얼굴을 마주한 긴 이야기. 취향을 전하는 사람들의 작은 집. 독채펜션 ‘벵디1967’ 입니다.', ACM_PHONE = '0504-121-1301', ACM_EMAIL='bengdi@nookda.com', ACM_PRICE=360000, ACM_CAPA=4, ACM_BEDTYPE='더블2', ACM_TYPE='독채', ACM_SIZE='98.3㎡', ACM_CHECKIN='14:00', ACM_CHECKOUT='11:00', MNO=2 where acmno=0;



UPDATE 테이블명
SET 
컬럼1 = 변경할 값,
컬럼2 = 변경할 값
.....
WHERE
조건;
