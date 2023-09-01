select * from book;
-- book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻�
select * from book
        where bookname like'%����%' and price >= 15000;
-- book ���̺��� ���ǻ簡 �½����� Ȥ�� ���ѹ̵���� ������ ���� �˻�
select * from book
        where publisher = '�½�����' or publisher = '���ѹ̵��';
        
select * from book
        where publisher in('�½�����' , '���ѹ̵��');
-- book ���̺��� ������, ������ȣ, ���ݼ� �˻�
select * from book order by bookname;
select * from book order by bookid;
select * from book order by price;
-- book ���̺��� ���ݼ����� �˻��ϰ� ���� �����̸� �̸������� �˻�
select * from book order by price, bookname;
-- book ���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ� ������������ �˻�
select * from book order by price desc, publisher asc;

--orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�
from orders
where custid =1;

--orders ���̺��� �Ǹž��� �հ�, ���, �ּڰ�, �ִ��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�,
        avg(saleprice) as �Ǹž����,
        min(saleprice) as ��������,
        max(saleprice) as �ִ밡��
    from orders;
--orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*) from orders;
--orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�.
select count(*) from orders where saleprice >= 13000;
--orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ����� �ֹ� ������ ���Ͻÿ�.
select count(*) from orders where custid in (1, 3);

-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
-- �׷�ȭ(�κ���) : group by
select custid, count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ�
from orders 
group by custid
order by custid;
-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- �� 2�� �̻� ������ ���� ����Ͻÿ�.
select custid, count(*) as �������� from orders 
where saleprice >= 8000
group by custid
having count(*) >= 2
order by custid;


-- ������ȣ�� 1�� ������ �̸�
select bookname from book
        where bookid = 1;
-- ������ 20000�� �̻��� ������ �̸�
select bookname from book
        where price >= 20000;
-- �������� �� ���ž�
select sum(saleprice) from orders where custid = 1;
-- �������� ������ ������ ��
select count(*) from orders where custid = 1;

-- ���缭�� ������ �� ����
select count(*) from book;
-- ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) from book;
-- ��� ���� �̸�, �ּ�
select name, address from customer;
-- 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select orderid from orders where orderdate between '14/07/04' and'14/07/07';
-- 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select orderid from orders where orderdate not between '14/07/04' and '14/07/07';
-- ���� �达�� ���� �̸��� �ּ�
select name, address from customer where name like '��%';
-- ���� �达�̰� �̸��� �Ʒ� ������ ���� �̸��� �ּ�
select name, address from customer where name like '��%' and name like '%��';