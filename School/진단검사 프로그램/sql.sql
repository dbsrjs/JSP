CREATE TABLE tbl_result_202004 (
    p_no CHAR(4) NOT NULL,
    t_code CHAR(4),
    t_sdate DATE,
    t_status CHAR(1),
    t_ldate DATE,
    t_result CHAR(1),
    PRIMARY KEY (p_no, t_code)
);

insert into tbl_result_202004 values('1001', 't001', '2020-01-01', '1', '2020-01-02', 'X');

insert into tbl_result_202004 values('1002', 't002', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1003', 't003', '2020-01-01', '2', '2020-01-02', 'N');
insert into tbl_result_202004 values('1004', 't004', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1005', 't005', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1006', 't001', '2020-01-01', '2', '2020-01-02', 'N');
insert into tbl_result_202004 values('1007', 't002', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1005', 't003', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1006', 't004', '2020-01-01', '2', '2020-01-02', 'N');
insert into tbl_result_202004 values('1007', 't005', '2020-01-01', '2', '2020-01-02', 'N');

select p_no, p_name,
	(substr(p_birth, 1, 4)||'년'||substr(p_birth,5,2)||'월'||substr(p_birth,7,2)||'일'), p_gender,
	(p_tel1||'-'||p_tel2||'-'||p_tel3),
	case when p_city = '10' then '서울'
	when p_city = '20' then '경기'
	when p_city = '30' then '강원'
	else '대구' end p_city
from tbl_patient_202004;

select a.p_no, b.p_name, a.t_code, a.t_sdate, a.t_status, a.t_ldate, a.t_result
from tbl_result_202004 a, tbl_patient_202004 b tbl_lab_test_202004 c
where a.p_no = b.p_no and a.t_code = c.t_code;
