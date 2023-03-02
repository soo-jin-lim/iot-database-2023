-- Active: 1677474327897@@127.0.0.1@3306@employees
use homeplus;

-- 한문장끝은 ;로 마침
SElect * from indextbl;
select * from homeplus.indextbl; -- 동일한 의미

select * from employees.titles; -- 다른 DB의 테이블에서 가져오려면
-- 필요한 칼럼만 가져오겠다.
select first_name, last_name from indextbl;
 -- sqldb를 사용
use sqldb;


-- 조건절 검색
select userID
      , name
      , BirthYear
      , height
      from usertbl 
      where name = '김경호'; 
      
      -- 관계연산자
      select *
      from usertbl
      where birthYear >= 1970
      AND height >= 182;
      
      --  사이값을 조회
      SELECT * 
		FROM USERTBL
      WHERE height BETWEEN 180 AND 183;
      
      -- IN 연산자
SELECT *
	from usertbl
    where addr IN('경남' , '경북', '전남');
    
    -- 문자열 검색- 뉴스 본문안에서 일정단어를 검색
    select *
    from usertbl
    where name like '김__';
    
   -- Subquery (서브쿼리) 사용위치
  -- 1. 컬럼위치
  -- 2. 테이블위치
  -- 3. 조건절위치
  -- WHERE절에 서브쿼리가 컬럼이 한개이상이거나 결과가 한개이샹이면
  -- 조건연산자로 조회할 수 없습
  SELECT name
          , height
   FROM usertbl
 WHERE height IN (SELECT height FROM usertbl WHERE name LIKE '김경호%');
 
 -- 가상 테이블
 -- AS 별명
 
 SELECT u.userID
         , u.name
            , (2023 - u.birthYear) AS 'age'
    FROM (
            SELECT userID, name, birthYear, addr
               FROM usertbl
            ) AS u 
  WHERE u.birthYear > 1969;
  
  -- 컬럼에 쓰는 서브쿼리
  SELECT b.userID AS '아이디'
         ,(SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
         , b.prodName
            , b.price * b.amount AS  '판매액'
     FROM buytbl AS b;


-- 정렬 Order BY

select  NAME
      , birthYear
      , height
   from usertbl
where birthYear > 1069
ORDER BY birthYear ASC, height DESC;

-- 중복제거/ 중복제거할 컬럼만 
select distinct addr
	from usertbl;
    
    -- limit 갯수제한alter
    USE homeplus;
    
    select * from indexTbl
    limit 5;
    
-- 조회하면서 새로운 테이블 생성
create table elec_buytbl_new
select num
	, prodname
	,pricebirthYearbirthYearbirthYearbirthYearbirthYearbirthYear
 from buytbl
where groupName = '전자';
    