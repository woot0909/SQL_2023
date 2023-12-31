--DDL (Data Defination Language): 데이터 정의어

--고객정보 (newcustomer 테이블)
--custid, name, address, phone
create table newcustomer (
    custid number primary key, 
    name varchar2(40),
    phone varchar2(30)
);

--주문정보(neworders 테이블)
--orderid(기본키), 
--custid(not null, newcustomer custid 참조해서 외래키, 연쇄삭제)
--bookid(not null, newbook1 bookid 참조해서 외래키, 연쇄삭제)
--saleprice
--orderdate (date형)
create table neworders(
    orderid number primary key,
    custid number not null, 
    bookid number not null,
    saleprice number,
    orderdate date,
    foreign key(custid) references newcustomer(custid)on delete cascade,
    foreign key(bookid) references newbook3(bookid)on delete cascade
);

--Alter문
--이미 생성된 테이블의 구조를 변경할 때 사용
--add(추가), drop(삭제), modify(수정)

--기존의 newbook1 테이블을 삭제하고 새 테이블 작성
create table newbook1(
bookname number,
bookname varchar2(20),
publisher varchar2(20),
price number
);
-- isbn컬럼추가
alter table newbook1
add isbn varchar2(13);
-- isbn컬럼의 자료형 변경
alter table newbook1
modify isbn number;

--isbn 컬럼 삭제
alter table newbook1 drop column isbn;

--bookname 컬럼의 varchar2(30) not null 제약조건 변경
alter table newbook1
modify bookname varchar2(30) not null;
--bookid 컬럼의 기본키 추가
alter table newbook1
add primary key(bookid);

--테이블 삭제
drop table newbook1;

--DML(select, insert(데이터삽입), update(데이터수정), delete(데이터삭제))
--insert 1번: 속성리스트 생략
insert into book
values(11, '개미', '해냄', 12000);

--insert 2번:속성(컬럼)리스트 명시
insert into book(bookid, bookname, publisher, price)
values(12, '라임오렌지나무', '좋은책', 8000);

--insert 3번: 컬럼 순서 변경
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '부자나라', '부의 습관');

--insert 4번: 특정 컬럼의 값을 생략
insert into book(bookid, price, bookname)
values(14, 10000, '아침 명상');

--테이블구조가 같은 다른 테이블의 데이터행 삽입하는 방법
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

--update: 데이터 변경
--고객번호가 5번인 고객의 주소를 대한민국 부산으로 변경
select * from customer;
update customer
set address = '대한민국 부산'
where custid = 5

-- 박세리 고객의 주소를 김연아 고객의 주소와 동일하게 변경하시오.
update customer 
set addess = (select address from customer where name='김연아')
where name = '박세리';

--박세리 고객의 전화번호를 김연아 고객의 전화번호와 동일하게 변경하시오.


rollback;
commit;
