-- 쇼핑몰에 가입하고 물건을 한번도 구매하지 않은 회원까지 모두 출력
select u.*
	, b.userID
	, b.prodName
    , b.groupName
    , b.price
    , b.amount
	from usertbl as u
    left outer join buytbl as b
		on u.userID = b.userID
	where b.userID is null;
    
-- 학생중에 동아리에 가입 안한 학생
select s.stdName, S.addr
	, j.num,j.clubname
	from stdtbl as s
    left outer join stdclubtbl as j
		on s.stdName = j.stdname
right outer join clubtbl as c
 on c.clubName = j.clubname;
        
    
    
 