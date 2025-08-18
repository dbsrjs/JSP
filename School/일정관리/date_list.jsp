<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>

   <%
   		String sql=" select s.pk_schedule as 일정코드, "
   			    +" to_char(s.do_date, 'YYYY-MM-DD') as 일정일자, "
   			    +" s.do_memo as 일정메모, m.pk_member as 회원코드, "
   			    +" m.name as 회원명 "
	   			+" from tbl_schedule s join tbl_member m "
				+" on s.fk_member = m.pk_member "
				+" order by s.pk_schedule ";
		
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
		<h3 class='title'>일정현황</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th style="width: 80px;">일정코드</th>
					<th style="width: 120px;">일정일자</th>
					<th style="width: 150px;">일정메모</th>
					<th style="width: 120px;">회원코드</th>
					<th style="width: 80px;">회원명</th>
				</tr>
				<% while(rs.next()) { %>
				<tr>
					<td align="center"> <%= rs.getInt(1) %></td>
					<td align="center"> <%= rs.getString(2) %></td>
					<td align="left"> <%= rs.getString(3) %></td>
					<td align="center"> <%= rs.getString(4) %></td>
					<td align="center"> <%= rs.getString(5) %></td>
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
