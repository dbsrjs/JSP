<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select sname from student_tbl_03";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<section>
		<h2>성적 입력</h2>
		<form action="exam_input_p.jsp" name="data" method="post" onsubmit="return chkValue()">
			<table>
				<tr>
					<th>이름</th>
					<td>
						<select name="sname" style="width: 30px;">
						<option value="" hidden=""></option>
						<%while(rs.next()){ %>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
						<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td><input type="number" name="ekor"></td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td><input type="number" name="emath"></td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td><input type="number" name="eeng"></td>
				</tr>
				<tr>
					<th>역사점수</th>
					<td><input type="number" name="ehist"></td>
				</tr>
				<tr>
					
				</tr>
			</table>
		</form>
	</section>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>
