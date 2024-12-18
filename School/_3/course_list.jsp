<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/dbconnect.jsp" %>    

<%
	String sql1 = "select count(*) from course_tbl_02";
	PreparedStatement pstmt = con.prepareStatement(sql1);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String count =rs.getString(1);
	
	String sql2 = " select c.sub_id, c.sub_name, c.credit, l.name, "
			   +" decode(c.week, '1','월요일', '2','화요일', '3','수요일', "
               +" '4','목요일', '5','금요일', '6','토요일'), "
	   +" substr(lpad(start_hour,4,'0'),1,2)||':'||substr(lpad(start_hour, 4,'0'),3,2), "
	   +" substr(lpad(end_hour,4,'0'),1,2)||':'||substr(lpad(end_hour, 4,'0'),3,2) "
	+" from COURSE_TBL_02 c JOIN LECTURER_TBL_02 l on c.lec_id = l.id";

	pstmt = con.prepareStatement(sql2);
	rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver=123">
</head>
<body>
	
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>

	<section id="section">
		<h2 id="title">교과목 현황</h2>
		<table>
			<caption>총 <%=count %>개의 교과목이 있습니다.</caption>
			
			<tr>
				<th>과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>담당강사</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
			</tr>
		
		<% while(rs.next()) {%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) %></td>
				<td>
					<input value="수정" onclick="location.href='course_update.jsp?sub_id=<%=rs.getString(1)%>'">
					/
					<input value="삭제" onclick="location.href='course_delete.jsp?sub_id=<%=rs.getString(1)%>'">
				</td>
			</tr>
		<%} %>
		</table>
	</section>
	
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>
