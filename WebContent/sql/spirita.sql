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

create table worker(                           --������
    id          varchar2(20)  primary key,
    pwd         varchar2(20),
    name        varchar2(40),
    phone       varchar2(20)
);

create table member(                           --ȸ��
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

create table product(                           --��ǰ
    pseq       number(5)     primary key,
    name       varchar2(100),
    kind       char(1),   
    price      number(7)     default '0',
    content    varchar2(1000),
    image      varchar2(50)  default 'default.jpg',
    indate     date          default sysdate  
);
create sequence product_seq start with 1;

create table cart (                              --��ٱ���
  cseq         number(10)    primary key,
  id           varchar2(16)   references member(id),
  pseq         number(5)     references product(pseq),
  quantity     number(5)     default 1,
  result       char(1)       default '1',      -- 1:��ó�� 2:ó��
  indate       date          default SYSDATE
);
create sequence cart_seq start with 1;

create table orders(                           -- �ֹ�����
  oseq        number(10)    primary key,
  id          varchar2(16)   references member(id),
  indate      date          default sysdate 
);
create sequence orders_seq start with 1;

create table order_detail(                     -- �ֹ�������
  odseq       number(10)   primary key,
  oseq        number(10)   references orders(oseq),
  pseq        number(5)    references product(pseq),
  quantity    number(5)    default 1,
  result      char(1)      default '1'                -- 1: ��ó�� 2: ó��
);
create sequence order_detail_seq start with 1;

create table qna (                              -- QNA�Խ���
  qseq        number(5)    primary key,
  subject     varchar2(300),
  content     varchar2(1000),
  reply       varchar2(1000),
  id          varchar2(16),
  rep         char(1)       default '1',        --1:�亯 ��  2:�亯 ��  
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


-- ���� ������

insert into worker values('admin', '1234', '������', '010-1234-5678');

insert into product(pseq, name, kind, price, content, image) values(
product_seq.nextval, '���ڷ��̼�1', '1', 10000, '���ڷ��̼�1 �Դϴ�.', 'decoration1.png');
insert into product(pseq, name, kind, price, content, image) values(
product_seq.nextval, '���ڷ��̼�2', '1', 20000, '���ڷ��̼�2 �Դϴ�.', 'decoration2.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '���ڷ��̼�3', '1', 30000, '���ڷ��̼�3 �Դϴ�.', 'decoration3.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '���̺����1', '2', 5000,  '���̺����1 �Դϴ�.', 'tableware1.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '���̺����2', '2', 10000, '���̺����2 �Դϴ�.', 'tableware2.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '���̺����3', '2', 15000, '���̺����3 �Դϴ�.', 'tableware3.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '��Ű��1', '3', 20000, '��Ű��1 �Դϴ�.', 'package1.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '��Ű��2', '3', 40000, '��Ű��2 �Դϴ�.', 'package2.jpg');
insert into product(pseq,  name, kind, price, content, image) values(
product_seq.nextval, '��Ű��3', '3', 60000, '��Ű��3 �Դϴ�.', 'package3.jpg');
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
