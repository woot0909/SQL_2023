select custid "����ȣ", round(avg(saleprice), -2) "��ձݾ�" from orders
group by custid;

select bookid, replace(bookname, '����', '����') bookname, publisher, price from book;
select * from book;

select bookname "������", length(bookname) ���ڼ�, lengthb(bookname) ����Ʈ�� from book
where publisher like '�س�';

select substr(name 1, 1) "����", count(*) "�ο���" from customer 
group by substr(name, 1, 1);

select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 �ֹ�Ȯ���� from orders order by orderid;

select orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, custid ����ȣ, bookid ������ȣ
from orders 
where orderdate = to_date('20230828', 'yyyymmdd');

select orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, name ����, bookname ������
from orders o, customer c, book b 
where c.custid = o.custid and b.bookid = o.bookid
and orderdate = to_date('20230828', 'yyyymmdd');

select sysdate ������ȯ�Ȱ�, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') �������ĳ�¥�׽ð� from dual;
