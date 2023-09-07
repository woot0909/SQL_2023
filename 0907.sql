select * from customer, orders where customer.custid = orders.custid;

select * from customer, orders where customer.custid = orders.custid 
order by customer.custid desc;

select name, saleprice from customer c, orders o
where c.custid = o.custid;

select name, sum(saleprice) from customer, orders
where customer.custid = orders.custid
group by name 
order by name;

select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

select name, saleprice 
from customer c left outer join orders o
                on c.custid = o.custid;
                
-- 가장 비싼 도서 이름
select bookname, price from book
where price = (select max(price) from book);
-- 가장 싼 도서 이름
select bookname, price from book
where price = (select min(price) from book);
-- 도서를 구매한 적이 있는 고객 이름
select name from customer 
where custid in();
-- sub query:  주문한 적이 있는 고객 번호들
select distinct custid from orders;

-- 웅진지식하우스에서 출판한 도서를 구매한 고객의 이름
select name from customer;
select bookid, bookname from book
where publisher = '웅진지식하우스';
-- 도서를 구매한 사람의 고객번호
select distinct custid from orders;

select name from customer 
where custid in(select distinct custid from orders 
                where bookid in(select bookid from book
                                where publisher ='웅진지식하우스'));
                                
select name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '삼호미디어';