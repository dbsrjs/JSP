<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql = "select teacher_code, teacher_name, class_name, class_price, "
				 +" (substr(teach_resist_date, 1, 4)||'년'|| " 
				 +" substr(teach_resist_date,6,2)||'월'|| "
				 +" substr(teach_resist_date,8,2)||'일') teach_resist_date "
				 +" from tbl_teacher_202201 "
				 +" order by teacher_code asc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
    <header><jsp:include page="layout/header.jsp"></jsp:include></header>
    <nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>

    <section id="section">
        <h2 class="title">강사조회</h2>
		<div class="scroll">
		<table class="table_line">
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>수강료</th>
				<th>강사자격취득일</th>
			</tr>
			<% DecimalFormat df = new DecimalFormat("\u00A4 #, ###, ###"); %>
			<% while(rs.next()){ %>
				<tr align="center">
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= df.format(rs.getInt(4)) %></td>
					<td><%= rs.getString(5) %></td>
				</tr>
				<%} %>
		</table>
		</div>           
	</section>
<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>