create table tbl_member(
	pk_member varchar(5) primary key,
	name varchar(20),
	grade varchar(255)
);

insert into tbl_member values('M0001', '홍길동', '의적');
insert into tbl_member values('M0002', '심청', '효녀');
insert into tbl_member values('M0003', '세종', '대왕');
insert into tbl_member values('M0004', '이순신', '장군');
insert into tbl_member values('M0005', '장영실', '과학자');

create table tbl_schedule (
    pk_schedule number(5) primary key,
    do_date date not null,
    fk_member varchar(5) not null,
    do_memo varchar(50) not null
);


insert into tbl_schedule values(1, '20250101', 'M0001', '탐관오리 찾기');
insert into tbl_schedule values(2, '20250201', 'M0002', '아버지 돌보기');
insert into tbl_schedule values(3, '20250301', 'M0003', '한글 창제');
insert into tbl_schedule values(4, '20250401', 'M0004', '거북선으로 국가 수호');
