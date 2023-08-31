select * from book
    where price >= 10000 and price <= 16000;
    
select * from book 
    where publisher in('굿스포츠');
    
select * from book
    where publisher not in('굿스포츠');
    
select * from book
    where publisher<>'굿스포츠' and publisher<>'대한미디어' and publisher <>'이상미디어';
    
select * from book
    where bookname = '축구의 역사';
    
select * from book
    where bookname like '축구의 역사';
    
select * from book
    where bookname like '%축구%';
    
select * from book
    where bookname like '축구%';
    
select * from book
    where bookname like '__의%';