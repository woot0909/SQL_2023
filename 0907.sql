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
                
-- ���� ��� ���� �̸�
select bookname, price from book
where price = (select max(price) from book);
-- ���� �� ���� �̸�
select bookname, price from book
where price = (select min(price) from book);
-- ������ ������ ���� �ִ� �� �̸�
select name from customer 
where custid in();
-- sub query:  �ֹ��� ���� �ִ� �� ��ȣ��
select distinct custid from orders;

-- ���������Ͽ콺���� ������ ������ ������ ���� �̸�
select name from customer;
select bookid, bookname from book
where publisher = '���������Ͽ콺';
-- ������ ������ ����� ����ȣ
select distinct custid from orders;

select name from customer 
where custid in(select distinct custid from orders 
                where bookid in(select bookid from book
                                where publisher ='���������Ͽ콺'));
                                
select name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '��ȣ�̵��';