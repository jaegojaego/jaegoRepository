create table Buyer(
	buyerId varchar2(20) primary key,
	buyerPw varchar2(20) not null,
	buyerName varchar2(20) not null,
	buyerPhone varchar2(20) not null,
	buyerEmail varchar2(100) not null,
	buyerStatus varchar2(20) not null,
	buyerDateOfJoin date default sysdate not null,
	buyerDateOfUpdate date,
	buyerDateOfDelete date
);

create table Seller(
	sellerCRN varchar2(30) primary key,
	sellerId varchar2(20) not null unique,
	sellerPw varchar2(20) not null,
	sellerName varchar2(20) not null,
	sellerShopName varchar2(100) not null,
	sellerPhone varchar2(30) not null,
	sellerEmail varchar2(100) not null,
	sellerBEA varchar2(200) not null,
	sellerTOB varchar2(20) not null,
	sellerShopOimg varchar2(200),
	sellerShopSimg varchar2(200),
	sellerLat varchar2(20) not null,
	sellerLong varchar2(20) not null
);

create table Favorite(
	buyerId varchar2(20) constraint fk_buyerId_favorite references Buyer(buyerId) not null,
	sellerCRN varchar2(30) constraint fk_sellerCRN_favorite references Seller(sellerCRN) not null
);

create table Grade(
	stars number not null,
	ment varchar2(200) not null,
	buyerId varchar2(20) constraint fk_buyerId_grade references Buyer(buyerId) not null,
	sellerCRN varchar2(30) constraint fk_sellerCRN_grade references Seller(sellerCRN) not null,
	inputDate date default sysdate not null
);

create table Sales(
	sellerCRN varchar2(30) constraint fk_sellerCRN_sales references Seller(sellerCRN) not null,
	salesName varchar2(50) not null,
	salesCode varchar2(30) not null,
	salesPrice number not null,
	salesTime date default sysdate,
	salesQuantity number not null
);

create table Goods(
	sellerCRN varchar2(30) constraint fk_sellerCRN_goods references Seller(sellerCRN) not null,
	goodsName varchar2(50) not null,
	goodsPrice number not null,
	goodsQuantity number not null,
	goodsOimage varchar2(50) not null,
	goodsSimage varchar2(50) not null,
	goodsCode varchar2(30) primary key,
	goodsDateOfUpload date default sysdate not null,
	goodsDateOfUpdate date,
	goodsStatus varchar2(200) default 'off',
	goodsInfo varchar2(4000) not null,
	expiredDate date not null
);

create table CSBoard(
	boardnum number primary key,
	id varchar2(20) not null,
	title varchar2(100) not null,
	content varchar2(2000),
	inputdate date default sysdate not null,
	hits number default 0,
	originalfile varchar2(200),
	savedfile varchar2(200),
	type varchar2(20)
);

create table CSReply(
	replynum number primary key,
	boardnum number constraint fk_boardnum references CSBoard(boardnum) not null
	references CSboard(boardnum) on delete cascade,
	id varchar2(20) not null,
	text varchar2(200) not null,
	inputdate date default sysdate not null
);

create sequence CSBoard_seq start with 1 increment BY 1;
create sequence CSReply_seq start with 1 increment BY 1;

delete from SELLER where sellercrn='111111';
delete from buyer where buyerid='paki';
delete from FAVORITE where buyerid='paki';
select * from buyer;


<salesdb>
 insert into sales values('1111115','쿠키','pYAU1EO7','900','2017/04/05','10');
 insert into sales values('1111115','바게트','2Z6d2HqZ','1500','2017/04/05','10');
 insert into sales values('1111115','호밀빵','HagBTHtY','2000','2017/04/05','10');

 insert into sales values('1111115','호밀빵','HagBTHtY','2000','2017/04/30','10');
 insert into sales values('1111115','바게트','2Z6d2HqZ','1500','2017/04/30','10');
 insert into sales values('1111115','쿠키','pYAU1EO7','900','2017/04/30','3');
 insert into sales values('1111115','마카롱','qOGfFjE2','800','2017/04/30','2');
 insert into sales values('1111115','달팽이빵','5rktcfPA','1900','2017/04/30','16');
 insert into sales values('1111115','베이글','Gpe7KCUh','2100','2017/04/30','16');
 insert into sales values('1111115','치즈케이크','uu1BsgiL','11000','2017/04/30','2');

 insert into sales values('1111115','호밀빵','HagBTHtY','2000','2017/05/01','10');
 insert into sales values('1111115','바게트','Qwz3xSmE','1500','2017/05/01','10');
 insert into sales values('1111115','쿠키','pYAU1EO7','900','2017/05/01','20');
 insert into sales values('1111115','마카롱','qOGfFjE2','800','2017/05/01','30');
 insert into sales values('1111115','달팽이빵','5rktcfPA','1900','2017/05/01','20');
 insert into sales values('1111115','베이글','Gpe7KCUh','2100','2017/05/01','10');
 insert into sales values('1111115','치즈케이크','uu1BsgiL','11000','2017/05/01','3');


