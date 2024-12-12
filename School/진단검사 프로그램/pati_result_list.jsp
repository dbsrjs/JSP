<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
   <%@ include file="layout/db_connect.jsp" %>
    
 <%
 	String sql="select p_no, p_name, "
 				+" to_char(to_date(p_birth), 'yyyy\"년\"mm\"월\"dd\"일\"') p_birth,"
 				+" case when p_gender = 'M' then '남' "
 				+" when p_gender = 'F' then '여' end p_gender, "
 				+" (p_tel1||'-'||p_tel2||'-'||p_tel3) p_tel, "
 				+" case when p_city = '10' then '서울' "
 				+" when p_city = '20' then '경기' "
 				+" when p_city = '30' then '강원' "
 				+" else '대구' end city "
 				+" from tbl_patient_202004 ";
 				
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진단검사 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css?1.1">
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<main id="section">
	<h3 class="title">환자조회</h3>
	<div class="scroll">
	<table class="table_line">
	<tr>
		<th style="background-color: yellow;">환자번호</th>
		<th style="background-color: yellow;">이환자</th>
		<th style="background-color: yellow;">생년월일</th>
		<th style="background-color: yellow;">성별</th>
		<th style="background-color: yellow;">전화번호</th>
		<th style="background-color: yellow;">지역</th>
	</tr>
	<% while(rs.next()) { %>
	<tr align="center">
		<td> <%= rs.getString("p_no") %></td>
		<td> <%= rs.getString("p_name") %></td>
		<td> <%= rs.getString("p_birth") %></td>
		<td> <%= rs.getString("p_gender") %></td>
		<td> <%= rs.getString("p_tel") %></td>
		<td> <%= rs.getString("city") %></td>
	</tr>
	<%
		}
	%>
	</table>
	</div>
	</main>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>