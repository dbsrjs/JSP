<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBConnect"%>
  
<%
	String sql = " select substr(s.sno, 1, 1) 학년, substr(s.sno, 2, 2) 반, substr(s.sno, 4, 2) 번호, s.sname, 이름 "
			+" e.ekor 국어, e.emath 수학, e.eeng 영어, e.ehist 역사, "
			+" (e.ekor+e.emath+e.eeng+e.ehist) 섬, "
			+" (e.ekor+e.emath+e.eeng+e.ehist/4) 평균, "
			+" rank() over(order by NVL(e.ekor+e.emath+e.eeng+e.ehist, 0) desc) "
		+" from student_tbl_03 s, exam_tbl_03 e "
		+" where s.sno = e.sno(+) ";

Connection conn = DBConnect.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<section id="section">
		<h2>학생성적</h2>
		<div>
		<table>
		<tr>
			<th>학번</th>
			<th>반</th>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>수학</th>
			<th>영어</th>
			<th>역사</th>
			<th>합계</th>
			<th>평균</th>
			<th>순위</th>
		</tr>
		<% while(rs.next()) { %>
		<tr>
			<td> <%= rs.getString(1) %></td>
			<td> <%= rs.getString(2) %></td>
			<td> <%= rs.getString(3) %></td>
			<td> <%= rs.getString(4) %></td>
			<td> <%= rs.getString(5) %></td>
			<td> <%= rs.getString(6) %></td>
			<td> <%= rs.getString(7) %></td>
			<td> <%= rs.getString(8) %></td>
			<td> <%= rs.getString(9) %></td>
			<td> <%= rs.getString(7) %></td>
			<td> <%= rs.getString(11) %></td>
		</tr>
		<%
			}
		%>
		</table>
		</div>
	</section>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>
