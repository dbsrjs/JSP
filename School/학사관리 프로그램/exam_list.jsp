<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBConnect"%>
  
<%
	String sql = " select substr(s.sno, 1, 1) 학년, substr(s.sno, 2, 2) 반, substr(s.sno, 4, 2) 번호, s.sname 이름, "
						+" e.ekor 국어, e.emath 수학, e.eeng 영어, e.ehist 역사, "
						+" (e.ekor+e.emath+e.eeng+e.ehist) 섬, "
						+" (e.ekor+e.emath+e.eeng+e.ehist/4) 평균, "
						+" rank() over(order by NVL(e.ekor+e.emath+e.eeng+e.ehist, 0) desc) "
				+" from student_tbl_03 s, exam_tbl_03 e "
				+" where s.sno = e.sno(+) ";

	String sql2 = " select sum(ekor) 국합, sum(emath) 수합, "
					+" sum(eeng) 영합,  sum(ehist) 역합, "
					+" (sum(ekor)+sum(emath)+sum(eeng)+sum(ehist)) 총합계, "
					+" ((sum(ekor)+sum(emath)+sum(eeng)+sum(ehist)/4)) 총평균 "
					+" from exam_tbl_03 ";
	
	String sql3 = "select avg(ekor) 국합, avg(emath) 수합, "
				  	+" avg(eeng) 영합,  avg(ehist) 역합, "
					+" (avg(ekor)+avg(emath)+avg(eeng)+avg(ehist)) 총합계, "
					+" ((avg(ekor)+avg(emath)+avg(eeng)+avg(ehist)/4)) 총평균 "
				  +" from exam_tbl_03 ";
	
Connection conn = DBConnect.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<section id="section">
		<h2>학생성적</h2>
		<table>
		<tr>
			<th>학번</th><th>반</th><th>번호</th>
			<th>이름</th><th>국어</th><th>수학</th>
			<th>영어</th><th>역사</th><th>합계</th>
			<th>평균</th><th>순위</th>
		</tr>
		<%
			while(rs.next()) {
				if(rs.getString(9) == null) continue;
		%>
		<tr>
			<td> <%= rs.getString(1) %></td>
			<td> <%= rs.getString(2) %></td>
			<td> <%= rs.getString(3) %></td>
			<td> <%= rs.getString(4) %></td>
			<%if(rs.getString(9) == null) {%>
				<td></td><td></td><td></td><td>
				</td><td></td><td></td><td></td>
		</tr>
			<%
				continue;
				} else { 
			%>
		<tr>
			<td> <%= rs.getString(5) %></td>
			<td> <%= rs.getString(6) %></td>
			<td> <%= rs.getString(7) %></td>
			<td> <%= rs.getString(8) %></td>
			<td> <%= rs.getString(9) %></td>
			<td> <%= rs.getString(10) %></td>
			<td> <%= rs.getString(11) %></td>
		</tr>
		<%}%>
		<%
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			rs.next();
		%>
			<tr>
				<th colspan="4">총 합</th>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(3) %></td>
				<td> <%= rs.getString(4) %></td>
				<td> <%= rs.getString(5) %></td>
				<td> <%= rs.getString(6) %></td>
				<td></td>
			</tr>
			<%rs.next(); %>
			<tr>
				<th colspan="4">총평균</th>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(3) %></td>
				<td> <%= rs.getString(4) %></td>
				<td> <%= rs.getString(5) %></td>
				<td> <%= rs.getString(6) %></td>
				<td></td>
			</tr>
		<%} %>
		</table>
	</section>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>
