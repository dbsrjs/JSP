<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>

   <%
   		String sql="select pk_member, name, grade"
  			+ " from tbl_member order by pk_member asc";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id='section'>
		<h3 class='title'>회원현황</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th style="width: 80px;">회원코드</th>
					<th style="width: 80px;">회원명</th>
					<th style="width: 80px;">등급</th>
				</tr>
				<% while(rs.next()) { %>
				<tr>
					<td align="left"> <%= rs.getString("pk_member") %></td>
					<td align="center"> <%= rs.getString("name") %></td>
					<td align="right"> <%= rs.getString("grade") %></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
