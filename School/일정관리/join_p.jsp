<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<%
try {
	request.setCharacterEncoding("UTF-8");
	
	String sql = "insert into tbl_schedule values(?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));
	pstmt.setString(2, request.getParameter("date"));
	pstmt.setString(3, request.getParameter("number"));
	pstmt.setString(4, request.getParameter("memo"));
	
	pstmt.executeUpdate();
	
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정관리 프로그램</title>
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>