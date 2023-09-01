select * from book;
-- book 테이블에서 과학이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색
select * from book
        where bookname like'%과학%' and price >= 15000;
-- book 테이블에서 출판사가 굿스포츠 혹은 대한미디어인 데이터 행을 검색
select * from book
        where publisher = '굿스포츠' or publisher = '대한미디어';
        
select * from book
        where publisher in('굿스포츠' , '대한미디어');
-- book 테이블에서 도서명, 도서번호, 가격순 검색
select * from book order by bookname;
select * from book order by bookid;
select * from book order by price;
-- book 테이블에서 가격순으로 검색하고 같은 가격이면 이름순으로 검색
select * from book order by price, bookname;
-- book 테이블에서 가격을 내림차순으로 검색하고 같은 가격이면 출판사 오름차순으로 검색
select * from book order by price desc, publisher asc;

--orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice) as 총판매금액
from orders
where custid =1;

--orders 테이블에서 판매액의 합계, 평균, 최솟값, 최댓값을 구하시오.
select sum(saleprice) as 총판매금액,
        avg(saleprice) as 판매액평균,
        min(saleprice) as 최저가격,
        max(saleprice) as 최대가격
    from orders;
--orders 테이블에서 판매한 도서의 개수를 구하시오.
select count(*) from orders;
--orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오.
select count(*) from orders where saleprice >= 13000;
--orders 테이블에서 고객번호가 1 또는 3인 사람의 주문 개수를 구하시오.
select count(*) from orders where custid in (1, 3);

-- orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오.
-- 그룹화(부분합) : group by
select custid, count(*) 주문수량, sum(saleprice) 주문총액
from orders 
group by custid
order by custid;
-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량을 구하시오.
-- 단 2권 이상 구매한 고객만 출력하시오.
select custid, count(*) as 도서수량 from orders 
where saleprice >= 8000
group by custid
having count(*) >= 2
order by custid;


-- 도서번호가 1인 도서의 이름
select bookname from book
        where bookid = 1;
-- 가격이 20000원 이상인 도서의 이름
select bookname from book
        where price >= 20000;
-- 박지성의 총 구매액
select sum(saleprice) from orders where custid = 1;
-- 박지성이 구매한 도서의 수
select count(*) from orders where custid = 1;

-- 마당서점 도서의 총 개수
select count(*) from book;
-- 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) from book;
-- 모든 고객의 이름, 주소
select name, address from customer;
-- 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
select orderid from orders where orderdate between '14/07/04' and'14/07/07';
-- 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
select orderid from orders where orderdate not between '14/07/04' and '14/07/07';
-- 성이 김씨인 고객의 이름과 주소
select name, address from customer where name like '김%';
-- 성이 김씨이고 이름이 아로 끝나는 고객의 이름과 주소
select name, address from customer where name like '김%' and name like '%아';