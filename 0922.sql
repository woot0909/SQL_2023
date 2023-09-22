select abs(-15) from dual;
select ceil(15.7) from dual;
select cos(3.14159) from dual;
select floor(15.7) from dual;
select log(10,100) from dual;
select mod(11,4) from dual;
select power(3,2) from dual;
select round(15.7) from dual;
select sign(-15) from dual;
select trunc(15.7) from dual;
select chr(67) from dual;
select concat('HAPPY','BIRTHDAY') from dual;
select lower('Birthday') from dual;
select lpad('page 1',15, '*.') from dual;
select ltrim('page 1','ae') from dual;
select replace('jack', 'j', 'bl') from dual;
select rpad('page 1',15,'*') from dual;
select rtrim('page 1', 'ae') from dual;
select substr('abcdefg', 3, 4) from dual;
select trim(leading 0 from '00AA00') from dual;

--원본 문자열의 길이를 총 15개로 맞추는데 마지막 인수에 있는 문자열로 왼쪽부터 채운다.
select lpad('page 1',15, '*.') from dual;

--고객의 이름과 전화번호를 출력하시오.(단, 전화번호가 없는 고객은 '연락처없음'으로 출력)
select name 이름, phone 전화번호 from customer;
select name 이름, nvl(phone, '연락처없음') 전화번호 from customer;

-- 고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두 명만 출력하시오.
select rownum 순번, custid, name, phone from customer;
select rownum 순번, custid, name, phone from customer
where rownum<=2;

-- mybook 테이블 생성
create table mybook(
    bookid number not null primary key,
    price number
);

-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;
select bookid, nvl(price,0) from mybook;
select * from mybook where price is null;
select * from mybook where price='';
select bookid, price+100 from mybook;
select sum(price), avg(price), count(*) from mybook where bookid>=4;
select count(*), count(price) from mybook;
select sum(price), avg(price) from mybook;

select * from book;
select * from book where rownum <=5;
select * from book where rownum <=5 order by price;
select * from (select * from book order by price) b  where rownum <=5;
select * from (select * from book where rownum<=5)b order by price;

select orderid 주문번호, saleprice 판매금액 from orders;
select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

select (select name from customer c
        where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 from orders o
group by o.custid;

alter table orders add bookname varchar2(40);
update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

select custid 고객번호, name 이름 from customer
where custid<=2;

select name 고객이름, sum(saleprice) 판매총액
from (select custid, name from customer
        where custid<=2) c, orders o
where c.custid = o.custid
group by name;

select custid, (select address from customer cs where cs.custid = od.custid)"address", sum(saleprice)"total"
from orders od group by od.custid;

select cs.name, s from (select custid, avg(saleprice)s from orders group by custid) od, customer cs 
where cs.custid = od.custid;

select sum(saleprice)"total" from orders od where exists (select * from customer cs where custid <= 3 and cs.custid = od.custid);