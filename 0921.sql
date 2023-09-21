select custid "고객번호", round(avg(saleprice), -2) "평균금액" from orders
group by custid;

select bookid, replace(bookname, '과학', '수학') bookname, publisher, price from book;
select * from book;

select bookname "도서명", length(bookname) 글자수, lengthb(bookname) 바이트수 from book
where publisher like '해냄';

select substr(name 1, 1) "성씨", count(*) "인원수" from customer 
group by substr(name, 1, 1);

select orderid 주문번호, orderdate 주문일, orderdate+10 주문확정일 from orders order by orderid;

select orderid 주문번호, to_char(orderdate, 'yyyy-mm-dd') 주문일, custid 고객번호, bookid 도서번호
from orders 
where orderdate = to_date('20230828', 'yyyymmdd');

select orderid 주문번호, to_char(orderdate, 'yyyy-mm-dd') 주문일, name 고객명, bookname 도서명
from orders o, customer c, book b 
where c.custid = o.custid and b.bookid = o.bookid
and orderdate = to_date('20230828', 'yyyymmdd');

select sysdate 원래반환된값, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') 지정형식날짜및시간 from dual;
