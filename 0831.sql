select * from book
    where price >= 10000 and price <= 16000;
    
select * from book 
    where publisher in('�½�����');
    
select * from book
    where publisher not in('�½�����');
    
select * from book
    where publisher<>'�½�����' and publisher<>'���ѹ̵��' and publisher <>'�̻�̵��';
    
select * from book
    where bookname = '�౸�� ����';
    
select * from book
    where bookname like '�౸�� ����';
    
select * from book
    where bookname like '%�౸%';
    
select * from book
    where bookname like '�౸%';
    
select * from book
    where bookname like '__��%';