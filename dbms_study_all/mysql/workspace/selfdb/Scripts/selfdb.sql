create database selfdb;
use selfdb;

/*
create table tbl_customer(
	id bigint unsigned auto_increment primary key,
	customer_name varchar(255) not null,
	customer_phone varchar(255) not null,
	customer_address varchar(255) not null
);

create table tbl_product(
	id bigint unsigned auto_increment primary key,
	product_name varchar(255) not null,
	product_price int not null,
	product_stock int default 0
);

create table tbl_order(
	id bigint unsigned auto_increment primary key,
	customer_id bigint unsigned,
	product_id bigint unsigned,
	constraint fk_order_customer foreign key(customer_id)
	references tbl_customer(id),
	constraint fk_order_product foreign key(product_id)
	references tbl_product(id)
);

create table tbl_review(
	id bigint unsigned auto_increment primary key,
	review_title varchar(255) not null,
	review_content varchar(255) not null,
	order_id bigint unsigned,
	constraint fk_review_order foreign key(order_id)
	references tbl_order(id)
);

insert into tbl_customer(customer_name, customer_phone, customer_address)
values('정희준', '010-0000-0000', '서울');
insert into tbl_customer(customer_name, customer_phone, customer_address)
values('홍길동', '010-1111-1111', '경기');
insert into tbl_customer(customer_name, customer_phone, customer_address)
values('이순신', '010-2222-2222', '부산');
insert into tbl_customer(customer_name, customer_phone, customer_address)
values('둘리', '010-3333-3333', '서울');
insert into tbl_customer(customer_name, customer_phone, customer_address)
values('또치', '010-4444-4444', '경기');
select * from tbl_customer;

insert into tbl_product(product_name, product_price, product_stock)
values('사과', 500, 100);
insert into tbl_product(product_name, product_price, product_stock)
values('복숭아', 1000, 50);
insert into tbl_product(product_name, product_price, product_stock)
values('딸기', 300, 200);
insert into tbl_product(product_name, product_price, product_stock)
values('참외', 700, 70);
insert into tbl_product(product_name, product_price, product_stock)
values('수박', 5000, 10);
select * from tbl_product;

insert into tbl_order (customer_id, product_id)
values(1, 1);
insert into tbl_order (customer_id, product_id)
values(2, 2);
insert into tbl_order (customer_id, product_id)
values(3, 3);
insert into tbl_order (customer_id, product_id)
values(4, 4);
insert into tbl_order (customer_id, product_id)
values(1, 4);
select * from tbl_order;

insert into tbl_review (review_title, review_content, order_id)
values('좋다', '맛좋다', 1);
insert into tbl_review (review_title, review_content, order_id)
values('흠', '그저그렇다', 2);
insert into tbl_review (review_title, review_content, order_id)
values('별로', '맛없다', 3);
select * from tbl_review;

select product_name, product_price 
from tbl_product
where product_stock > 50;

update tbl_customer 
set customer_address = '서울'
where customer_address = '부산' and customer_name = '이순신';
select * from tbl_customer;

delete from tbl_product 
where product_stock < 20;
select * from tbl_product;

select *
from tbl_order o join tbl_customer c 
on o.customer_id = c.id;

select *
from tbl_order o join tbl_product p
on o.product_id = p.id;

select r.review_title, r.review_content 
from tbl_review r join tbl_order o 
on r.order_id = o.id;

-- 리뷰를 쓴 고객 이름과 상품 이름, 리뷰 제목 조회 --
select r.review_title, p.product_name, c.customer_name 
from tbl_review r 
join tbl_order o on r.order_id = o.id 
join tbl_customer c on o.customer_id = c.id 
join tbl_product p on o.product_id = p.id;

-- 정희준이 작성한 리뷰의 상품명을 모두 출력 --
select p.product_name
from tbl_review r
join tbl_order o on r.order_id = o.id
join tbl_customer c on o.customer_id = c.id
join tbl_product p on o.product_id = p.id
where c.customer_name = '정희준';

-- 리뷰가 달린 상품 목록 조회 --
select p.product_name 
from tbl_review r
join tbl_order o on r.order_id = o.id
join tbl_product p on o.product_id = p.id;

-- 모든 리뷰에 대해 작성자 이름, 리뷰 제목, 상품 이름을 함께 조회 --
select c.customer_name, r.review_title, p.product_name 
from tbl_review r
join tbl_order o on r.order_id = o.id
join tbl_product p on o.product_id = p.id
join tbl_customer c on o.customer_id = c.id;



create table tbl_user(
	id bigint unsigned auto_increment primary key,
	user_name varchar(255) not null,
	user_age int default 0
);

create table tbl_song(
	id bigint unsigned auto_increment primary key,
	song_title varchar(255) not null,
	song_artist varchar(255) not null,
	song_duration int not null
);

create table tbl_playlist(
	id bigint unsigned auto_increment primary key,
	playlist_name varchar(255),
	user_id bigint unsigned,
	constraint fk_playlist_user foreign key(user_id)
	references tbl_user(id)
);

create table tbl_playlist_song(
	id bigint unsigned auto_increment primary key,
	playlist_id bigint unsigned,
	song_id bigint unsigned,
	constraint fk_playlist_song_playlist foreign key(playlist_id)
	references tbl_playlist(id),
	constraint fk_playlist_song_song foreign key(song_id)
	references tbl_song(id)
);

create table tbl_like(
	id bigint unsigned auto_increment primary key,
	user_id bigint unsigned,
	song_id bigint unsigned,
	constraint fk_like_user foreign key(user_id)
	references tbl_user(id),
	constraint fk_like_song foreign key(song_id)
	references tbl_song(id)
);

insert into tbl_user (user_name, user_age)
values('사람1', 30);
insert into tbl_user (user_name, user_age)
values('사람2', 25);
insert into tbl_user (user_name, user_age)
values('사람3', 20);
select * from tbl_user;

insert into tbl_song (song_title, song_artist, song_duration)
values('노래1', '가수1', 180);
insert into tbl_song (song_title, song_artist, song_duration)
values('노래2', '가수2', 170);
insert into tbl_song (song_title, song_artist, song_duration)
values('노래3', '가수3', 160);
select * from tbl_song;

insert into tbl_playlist (playlist_name, user_id)
values('플리1', 1);
insert into tbl_playlist (playlist_name, user_id)
values('플리2', 2);
insert into tbl_playlist (playlist_name, user_id)
values('플리3', 3);
insert into tbl_playlist (playlist_name, user_id)
values('플리4', 1);
select * from tbl_playlist;

insert into tbl_playlist_song (playlist_id, song_id)
values(1, 1);
insert into tbl_playlist_song (playlist_id, song_id)
values(1, 2);
insert into tbl_playlist_song (playlist_id, song_id)
values(1, 3);
insert into tbl_playlist_song (playlist_id, song_id)
values(2, 2);
insert into tbl_playlist_song (playlist_id, song_id)
values(3, 1);
insert into tbl_playlist_song (playlist_id, song_id)
values(3, 2);
select * from tbl_playlist_song;

insert into tbl_like (user_id, song_id)
values(1, 1);
insert into tbl_like (user_id, song_id)
values(2, 2);
insert into tbl_like (user_id, song_id)
values(3, 1);
select * from tbl_like;


-- 각 플레이리스트에 담긴 노래 목록과 가수 보기 --
select s.song_title, s.song_artist, pl.playlist_name 
from tbl_playlist pl
join tbl_playlist_song ps on ps.playlist_id = pl.id 
join tbl_song s on ps.song_id = s.id;

-- '사람1' 유저가 만든 플레이리스트 목록 보기 --
select u.user_name, pl.playlist_name 
from tbl_user u
join tbl_playlist pl on pl.user_id = u.id 
where u.user_name = '사람1';

-- '사람3' 유저가 만든 플레이리스트에 담긴 노래 정보 보기 --
select s.song_title, u.user_name, pl.playlist_name 
from tbl_user u
join tbl_playlist pl on pl.user_id = u.id 
join tbl_playlist_song ps on ps.playlist_id = pl.id
join tbl_song s on ps.song_id = s.id 
where u.user_name ='사람3';

-- 좋아요를 받은 노래와 누른 사람 조회 --
select s.song_title, u.user_name 
from tbl_like l
join tbl_user u on l.user_id = u.id 
join tbl_song s on l.song_id = s.id;

-- 플레이리스트 ‘플리3’에 담긴 노래 제목과 만든 사람 이름 출력 --
select s.song_title, s.song_artist, u.user_name 
from tbl_playlist pl
join tbl_playlist_song ps on ps.playlist_id = pl.id
join tbl_song s on ps.song_id = s.id 
join tbl_user u on pl.user_id = u.id
where pl.playlist_name = '플리3';

-- '사람1'이 좋아요 누른 노래 제목과 아티스트 조회 --
select s.song_title, s.song_artist, u.user_name 
from tbl_user u
join tbl_like l on l.user_id = u.id 
join tbl_song s on l.song_id = s.id 
where u.user_name = '사람1'; 
*/

create table tbl_book(
	id bigint unsigned auto_increment primary key,
	book_title varchar(255) not null,
	book_author varchar(255) not null,
	book_price int not null,
	book_stock int default 0
);

create table tbl_customer(
	id bigint unsigned auto_increment primary key,
	customer_name varchar(255) not null,
	customer_age int not null
);

create table tbl_cart(
	id bigint unsigned auto_increment primary key,
	cart_quantity int unsigned,
	customer_id bigint unsigned,
	book_id bigint unsigned,
	constraint fk_cart_customer foreign key(customer_id)
	references tbl_customer(id),
	constraint fk_cart_book foreign key(book_id)
	references tbl_book(id),
	constraint uq_customer_book unique(customer_id, book_id)
-- 한 명의 고객이 같은 책을 장바구니에 한 번만 담을 수 있다
-- 복합 unique
);

insert into tbl_book (book_title, book_author, book_price, book_stock)
values('책1', '저자1', 10000, 10);
insert into tbl_book (book_title, book_author, book_price, book_stock)
values('책2', '저자2', 20000, 20);
insert into tbl_book (book_title, book_author, book_price, book_stock)
values('책3', '저자3', 30000, 30);
select * from tbl_book;

insert into tbl_customer (customer_name, customer_age)
values('소비자1', 10);
insert into tbl_customer (customer_name, customer_age)
values('소비자2', 20);
insert into tbl_customer (customer_name, customer_age)
values('소비자3', 30);
select * from tbl_customer;

insert into tbl_cart (cart_quantity, customer_id, book_id)
values(1, 1, 1);
insert into tbl_cart (cart_quantity, customer_id, book_id)
values(1, 1, 2);
insert into tbl_cart (cart_quantity, customer_id, book_id)
values(1, 1, 3);
insert into tbl_cart (cart_quantity, customer_id, book_id)
values(2, 2, 2);
insert into tbl_cart (cart_quantity, customer_id, book_id)
values(2, 2, 3);
insert into tbl_cart (cart_quantity, customer_id, book_id)
values(3, 3, 3);
select * from tbl_cart;

update tbl_cart 
set cart_quantity = 3
where customer_id = 1 and book_id = 1;
select * from tbl_cart;

update tbl_book
set book_price = book_price + 2000
where book_price <= 20000;

update tbl_book 
set book_stock = book_stock + 10
where book_stock <= 10;
select * from tbl_book;

insert into tbl_book (book_title, book_author, book_price, book_stock)
values('첵4', '저자4', 40000, 40);

delete from tbl_book 
where book_title = '첵4' and book_author = '저자4';
select * from tbl_book;



-- 소비자1이 장바구니에 담은 책 제목과 가격을 모두 조회하시오. --
select bk.book_title, bk.book_price, cu.customer_name 
from tbl_customer cu
join tbl_cart ca on ca.customer_id = cu.id 
join tbl_book bk on ca.book_id = bk.id
where cu.customer_name = '소비자1';

-- 책 ‘책3’을 장바구니에 담은 고객의 이름을 모두 조회하시오. --
select bk.book_title, cu.customer_name 
from tbl_book bk
join tbl_cart ca on ca.book_id = bk.id 
join tbl_customer cu on ca.customer_id = cu.id
where bk.book_title = '책3';

-- 각 고객이 장바구니에 담은 책의 제목을 모두 조회하되, 고객 이름과 함께 표시하시오. --
select bk.book_title, ca.book_id, cu.customer_name 
from tbl_customer cu
join tbl_cart ca on ca.customer_id = cu.id 
join tbl_book bk on ca.book_id = bk.id;

-- 장바구니에 책을 담은 고객만 조회하시오. --
select cu.customer_name
from tbl_cart ca 
join tbl_book bk on ca.book_id = bk.id
join tbl_customer cu on ca.customer_id = cu.id;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

create table tbl_member(
	id bigint unsigned auto_increment primary key,
	member_name varchar(255) not null
);

create table tbl_kindergarten(
	id bigint unsigned auto_increment primary key,
	kindergarten_name varchar(255) not null,
	kindergarten_address varchar(255) not null,
	member_id bigint unsigned,
	constraint fk_kindergarten_member foreign key(member_id)
	references tbl_member(id)
);

create table tbl_parent(
	id bigint unsigned auto_increment primary key,
	parent_name varchar(255) not null,
	parent_address varchar(255) not null
);

create table tbl_child(
	id bigint unsigned auto_increment primary key,
	child_name varchar(255) not null,
	child_age int not null,
	parent_id bigint unsigned,
	constraint fk_child_parent foreign key(parent_id)
	references tbl_parent(id)
);

create table tbl_field_trip(
	id bigint unsigned auto_increment primary key,
	field_trip_title varchar(255) not null,
	field_trip_content varchar(255) not null,
	created_date datetime default current_timestamp(),
   	updated_date datetime default current_timestamp(),
	kindergarten_id bigint unsigned,
	constraint fk_field_trip_kindergarten foreign key(kindergarten_id)
	references tbl_kindergarten(id)
);

create table tbl_apply(
	id bigint unsigned auto_increment primary key,
	child_id bigint unsigned,
	field_trip_id bigint unsigned,
	constraint fk_apply_child foreign key(child_id)
	references tbl_child(id),
	constraint fk_apply_field_trip foreign key(field_trip_id)
	references tbl_field_trip(id)
);

insert into tbl_parent (parent_name, parent_address)
values
('정희준', '서울'),
('홍길동', '경기'),
('이순신', '광주'),
('지상렬', '인천'),
('이대호', '부산');  
select * from tbl_parent;

insert into tbl_child (child_name, child_age, parent_id)
values
('또치', 5, 2),
('둘리', 7, 2),
('도너', 4, 1),
('마이콜', 4, 3),
('짱구', 5, 4),
('짱아', 5, 4),
('신형만', 12, 2);
select * from tbl_child;

insert into tbl_member (member_name)
values('원장');
select * from tbl_member;

insert into tbl_kindergarten (kindergarten_name, kindergarten_address, member_id)
values
('병설유치원', '경기도 고양시', 1),
('파랑새유치원', '서울시 강남구', 1),
('불교유치원', '경기도 고양시', 1),
('세화유치원', '경기도 고양시', 1),
('대명유치원', '경기도 고양시', 1);
select * from tbl_kindergarten;

insert into tbl_field_trip (field_trip_title, field_trip_content, kindergarten_id)
values
('어서와 매미농장', '매미 잡자 어서와', 1),
('아이스크림 빨리 먹기 대회', '아이스크림 누가 더 잘먹나', 3),
('고구마 심기', '고구마가 왕 커요', 2),
('숭어 얼음 낚시', '숭어 잡자 추워도 참아', 4),
('커피 체험 공장', '커비 빈 객체화', 4),
('치즈 제작하기', '여기 치즈 저기 치즈 전부 다 치즈', 4),
('동물 타보기', '이리야!', 2);
select * from tbl_field_trip;

insert into tbl_apply (field_trip_id, child_id)
values
(1, 1), 
(2, 2), 
(3, 6), 
(4, 7), 
(1, 5),
(2, 3),
(5, 7),
(6, 6),
(4, 1),
(4, 5),
(7, 3);
select * from tbl_apply;

-- 모든 유치원 이름과 주소 조회 --
select kindergarten_name, kindergarten_address 
from tbl_kindergarten;

-- '홍길동' 부모와 자녀 정보 같이 조회 --
select p.parent_name, c.child_name
from tbl_parent p
join tbl_child c on c.parent_id = p.id; 

-- 각 체험학습 신청한 아이 이름과 체험학습 제목 출력 --
select c.child_name, ft.field_trip_title 
from tbl_child c
join tbl_apply a on a.child_id = c.id 
join tbl_field_trip ft on a.field_trip_id = ft.id;

-- 모든 아이와 체험학습 신청 내역 출력 --
select c.child_name, ft.field_trip_title 
from tbl_child c
left outer join tbl_apply a on a.child_id = c.id 
left outer join tbl_field_trip ft on a.field_trip_id = ft.id;

-- 모든 체험학습과 신청한 아이 목록(신청 없는 체험학습도 표시) --
select c.child_name, ft.field_trip_title
from tbl_child c
right outer join tbl_apply a on a.child_id = c.id
right outer join tbl_field_trip ft on a.field_trip_id = ft.id; 

-- 각 유치원명과 해당 유치원에서 진행하는 체험학습 제목 (체험학습 없는 유치원도 표시) --
select k.kindergarten_name, ft.field_trip_title
from tbl_kindergarten k
left outer join tbl_field_trip ft on ft.kindergarten_id = k.id;

-- 각 유치원별 체험학습 진행 수 --
select k.kindergarten_name, count(ft.field_trip_title)
from tbl_kindergarten k
join tbl_field_trip ft on ft.kindergarten_id = k.id
group by k.kindergarten_name;

-- 각 유치원들의 체험학습 지원 건수 --
select count(a.child_id), k.kindergarten_name
from tbl_field_trip ft
join tbl_apply a on a.field_trip_id = ft.id
right outer join tbl_kindergarten k on ft.kindergarten_id = k.id
group by k.kindergarten_name;

-- 가장 많이 체험학습을 신청한 아이 이름과 신청 횟수 --
select c.child_name, count(a.child_id)
from tbl_child c
join tbl_apply a on a.child_id = c.id
group by c.child_name
order by a.child_id;

























