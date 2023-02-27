-- 그냥 테이블 접근
SELECT *
	FROM membertbl;
    
-- 뷰 생성
create view uv_membertbl
	AS
	 SELECT memberName, memberAddress
		from membertbl;

-- 뷰로 조회
SELECT *
	FROM uv_membertbl;