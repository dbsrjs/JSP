<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql = "select (substr(a.resist_month,1,4)||'년'|| " 
			+"            substr(a.resist_month,5, 2)||'월') resist_month, "
			+" a.c_no, b.c_name, c.class_name, a.class_area, a.tuition, b.grade "
			+" from tbl_class_202201 a,tbl_member_202201 b, tbl_teacher_202201 c "
			+" where a.c_no = b.c_no and a.teacher_code = c.teacher_code "
			+" order by a.resist_month asc, a.c_no asc";
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
        <h2 class="title">회원정보조회</h2>
        <div class="scroll">
        <table class="table_line">
        	<tr>
        		<th>수강월</th>
        		<th>회원번호</th>
        		<th>회원명</th>
        		<th>강의명</th>
        		<th>강의장소</th>
        		<th>수강료</th>
        		<th>등급</th>
        	</tr>
        	<% DecimalFormat df = new DecimalFormat("\u00A4 #, ###, ###"); %>
        	<% while(rs.next()){ %>
        		<tr align="center">
        			<td><%= rs.getString(1) %></td>
        			<td><%= rs.getString(2) %></td>
        			<td><%= rs.getString(3) %></td>
        			<td><%= rs.getString(4) %></td>
        			<td><%= rs.getString(5) %></td>
        			<td><%= rs.getString(6) %></td>
        			<td><%= rs.getString(7) %></td>
        		</tr>
       		<% } %>
        </table>
        </div>
	</section>

<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>