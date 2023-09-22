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

--���� ���ڿ��� ���̸� �� 15���� ���ߴµ� ������ �μ��� �ִ� ���ڿ��� ���ʺ��� ä���.
select lpad('page 1',15, '*.') from dual;

--���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ���)
select name �̸�, phone ��ȭ��ȣ from customer;
select name �̸�, nvl(phone, '����ó����') ��ȭ��ȣ from customer;

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ����Ͻÿ�.
select rownum ����, custid, name, phone from customer;
select rownum ����, custid, name, phone from customer
where rownum<=2;

-- mybook ���̺� ����
create table mybook(
    bookid number not null primary key,
    price number
);

-- ������ �� ����
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

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

select (select name from customer c
        where c.custid = o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o
group by o.custid;

alter table orders add bookname varchar2(40);
update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

select custid ����ȣ, name �̸� from customer
where custid<=2;

select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from (select custid, name from customer
        where custid<=2) c, orders o
where c.custid = o.custid
group by name;

select custid, (select address from customer cs where cs.custid = od.custid)"address", sum(saleprice)"total"
from orders od group by od.custid;

select cs.name, s from (select custid, avg(saleprice)s from orders group by custid) od, customer cs 
where cs.custid = od.custid;

select sum(saleprice)"total" from orders od where exists (select * from customer cs where custid <= 3 and cs.custid = od.custid);