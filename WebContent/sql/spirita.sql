--drop

drop table worker;

alter table member drop primary key cascade;
drop table member;

alter table product drop primary key cascade;
drop table product;
drop sequence product_seq;

alter table cart drop primary key cascade;
drop table cart;
drop sequence cart_seq;

alter table orders drop primary key cascade;
drop table orders;
drop sequence orders_seq;

alter table order_detail drop primary key cascade;
drop table order_detail;
drop sequence order_detail_seq;

alter table qna drop primary key cascade;
drop table qna;
drop sequence qna_seq;

drop table notice;
drop sequence notice_seq;

drop view cart_view;
drop view order_view;

--create

create table worker(                           --관리자
    id          varchar2(20)  primary key,
    pwd         varchar2(20),
    name        varchar2(40),
    phone       varchar2(20)
);

create table member(                           --회원
	id VARCHAR2(16) primary key,
	pwd VARCHAR2(15) not null,
	name VARCHAR2(10) not null,
	email VARCHAR2(30),
	zipcode VARCHAR2(10),
	address VARCHAR2(100) not null,
	phone VARCHAR2(13) not null unique,
	useyn char(1) default 'y',
    indate DATE default SYSDATE
);

create table product(                           --상품
    pseq       number(5)     primary key,
    name       varchar2(100),
    kind       char(1),   
    price      number(7)     default '0',
    content    varchar2(1000),
    image      varchar2(50)  default 'default.jpg',
    indate     date          default sysdate  
);
create sequence product_seq start with 1;

create table cart (                              --장바구니
  cseq         number(10)    primary key,
  id           varchar2(16)   references member(id),
  pseq         number(5)     references product(pseq),
  quantity     number(5)     default 1,
  result       char(1)       default '1',      -- 1:미처리 2:처리
  indate       date          default SYSDATE
);
create sequence cart_seq start with 1;

create table orders(                           -- 주문정보
  oseq        number(10)    primary key,
  id          varchar2(16)   references member(id),
  indate      date          default sysdate 
);
create sequence orders_seq start with 1;

create table order_detail(                     -- 주문상세정보
  odseq       number(10)   primary key,
  oseq        number(10)   references orders(oseq),
  pseq        number(5)    references product(pseq),
  quantity    number(5)    default 1,
  result      char(1)      default '1'                -- 1: 미처리 2: 처리
);
create sequence order_detail_seq start with 1;

create table qna (                              -- QNA게시판
  qseq        number(5)    primary key,
  subject     varchar2(300),
  content     varchar2(1000),
  reply       varchar2(1000),
  id          varchar2(16),
  rep         char(1)       default '1',        --1:답변 무  2:답변 유  
  indate      date default  sysdate
);
create sequence qna_seq start with 1;

create table notice(
	nseq		number(5)			primary key,
	subject		varchar2(300),
	content		varchar2(1000),
	id			varchar2(16),
	count		number(6) default 0,
	indate		date default		sysdate
);

create sequence notice_Seq start with 1 increment by 1;


-- 샘플 데이터

insert into worker values('admin', '1234', '관리자', '010-1234-5678');

insert into product(pseq, name, kind, price, content, image) values(
product_seq.nextval, '데코레이션1', '1', 10000, '데코레이션1 입니다.', 'decoration1.png');
insert into product(pseq, name, kind, price, content, image) values(
product_seq.nextval, '데코레이션2', '1', 20000, '데코레이션2 입니다.', 'decoration2.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '데코레이션3', '1', 30000, '데코레이션3 입니다.', 'decoration3.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '테이블웨어1', '2', 5000,  '테이블웨어1 입니다.', 'tableware1.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '테이블웨어2', '2', 10000, '테이블웨어2 입니다.', 'tableware2.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '테이블웨어3', '2', 15000, '테이블웨어3 입니다.', 'tableware3.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '패키지1', '3', 20000, '패키지1 입니다.', 'package1.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '패키지2', '3', 40000, '패키지2 입니다.', 'package2.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '패키지3', '3', 60000, '패키지3 입니다.', 'package3.jpg');
commit


--view

create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.name mname, p.name pname,
o.quantity, o.indate, p.price, o.result
from cart o, member m, product p
where o.id = m.id and o.pseq = p.pseq
and result='1';

create or replace view order_view
as
select d.odseq, o.oseq, o.id, o.indate, d.pseq, d.quantity, m.name mname,
m.zipcode, m.address, m.phone, p.name pname, p.price, d.result   
from orders o, order_detail d, member m, product p
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;
