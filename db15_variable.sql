-- 변수 사용
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar1;
SET @myVar2 = '가수이름 ==> ';

SELECT @myVar2, name
   FROM    usertbl
    WHERE height > 170;
    
SELECT name, height + @myVar1
   FROM usertbl;
    
-- 형변환
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR) AS SIGNED INTEGER) FROM usertbl;

SELECT CAST(addr AS decimal) FROM usertbl;
SELECT CONVERT(addr, decimal) FROM usertbl;

SELECT CAST('1000' AS decimal);

-- 암시적 형변환
SELECT 200 + 300;

SELECT CONCAT('Hello ' , 'world'); -- 문자열 합치기

SELECT '200' + '300'; -- MYSQL 이외에서는 '200300'
SELECT CONCAT(200, '300');

/* 내장함수 리스트 */
-- 흐름함수
-- 100>200 ? '참' : '거짓'
SELECT IF(100>200, '참', '거짓');

-- NULL은 계산이 오류(결과도 NULL)
SELECT IFNULL(NULL, 0) + 100; 

-- NULLIF는 많이 사용안됨
SELECT NULLIF(100, 100);

-- 쿼리작성할 때 많이 사용
SELECT name
         , birthYear
            , addr
            , CASE addr
           WHEN '서울' THEN '수도권'
              WHEN '경기' THEN '수도권'
              WHEN '부산' THEN '광역권'
              ELSE '지역권' END AS '권역'
   FROM usertbl;
    


-- 문자열함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
SELECT ASCII('안'), CHAR(236); -- 한글은 사용하면 안됨

-- CHAR_LENGTH(글자길이), LENGTH(byte)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- UTF-8
SELECT CHAR_LENGTH('가자다'), LENGTH('가나다'); -- 한글 한글자당3bytesf

SELECT REPLACE('Hello World', 'Hello', 'Byebye');
-- DB는 인덱스를 1부터 시작
SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'ltrim'
         , RTRIM('          Hello World!          ') AS 'rtrim'
         , TRIM('          Hello World!          ') AS 'trim';
            
-- 'Hello' * 3


SELECT REPEAT('Hello', 3);

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2);

-- 수학함수
SELECT ABS(-10);
-- 올림, 내림 , 반올림
select seiling(4.3), floor(4.9),round(4.4);

select mod (157, 10);

-- random
select rand(), floor(1+ (rand() * 6)); -- 주사위 놀이

-- 날짜 밑 시간함수
select now();
select adddate('2023-03-02', interval 10 Day);


select YEAR (now());
select hour(now());
select date(now());
select time(now());
select dayofweek(now()); # 1(일) ~ 7(토)
select Last_day ('2023- 01-01');

-- 시스템 함수
select user();
select database();


-- row_count()
use sqldb;
update buytbl set price = price * 2;
select row_count();

select version();




