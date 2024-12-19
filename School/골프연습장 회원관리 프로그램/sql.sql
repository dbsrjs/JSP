create table student_tbl_03(
    sno varchar2(6) not null primary key,
    sname varchar2(10),
    sphone varchar2(15),
    sgender varchar2(4),
    saddress varchar2(50)
)
create table exam_tbl_03(
    sno varchar2(6) not null primary key,
    ekor number(4),
    emath number(4),
    eeng number(4),
    ehist number(4)
)

insert into student_tbl_03 values
('10101', '김행복', '010-1111-2222', 'M', '서울 동대문구 휘경1동');
insert into student_tbl_03 values
('10102', '이축복', '010-1111-3333', 'F', '서울 동대문구 휘경2동');
insert into student_tbl_03 values
('10103', '장믿음', '010-1111-4444', 'M', '울릉군 울릉읍 독도1리');
insert into student_tbl_03 values
('10104', '최사랑', '010-1111-5555', 'F', '울릉군 울릉읍 독도2리');
insert into student_tbl_03 values
('10105', '진평화', '010-1111-6666', 'M', '제주도 제주시 외나무골');
insert into student_tbl_03 values
('10106', '차공단', '010-1111-7777', 'M', '제주도 제주시 감나무골');

insert into exam_tbl_03 values('10101', 98, 91, 95, 90);
insert into exam_tbl_03 values('10102', 87, 89, 92, 82);

 select sno, sname, substr(sno, 1, 1), 
		  	  substr(sno, 2, 2), substr(sno, 4, 2), 
   			  case sgender when 'M' then '남' 
     		  when 'F' then '여' end sgender, 
   		  sphone, saddress 
		  from student_tbl_03;
		  
select substr(s.sno, 1, 1) 학년, substr(s.sno, 2, 2) 반, substr(s.sno, 4, 2) 번호, s.sname,
	e.ekor 국어, e.emath 수학, e.eeng 영어, e.ehist 역사,
	(e.ekor+e.emath+e.eeng+e.ehist) 섬, 
	(e.ekor+e.emath+e.eeng+e.ehist/4) 평균,
	rank() over(order by NVL(e.ekor+e.emath+e.eeng+e.ehist, 0) desc)
from student_tbl_03 s, exam_tbl_03 e
where s.sno = e.sno(+);
		
		


select sum(ekor) 국합, sum(emath) 수합,
	sum(eeng) 영합,  sum(ehist) 역합,
	(sum(ekor)+sum(emath)+sum(eeng)+sum(ehist)) 총합계,
	((sum(ekor)+sum(emath)+sum(eeng)+sum(ehist)/4)) 총평균
from exam_tbl_03;

select avg(ekor) 국합, avg(emath) 수합,
	avg(eeng) 영합,  avg(ehist) 역합,
	(avg(ekor)+avg(emath)+avg(eeng)+avg(ehist)) 총합계,
	((avg(ekor)+avg(emath)+avg(eeng)+avg(ehist)/4)) 총평균
from exam_tbl_03;



		
