<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<%
try {
	request.setCharacterEncoding("UTF-8");
	
	String sql = "delete from member_tbl_02 WHERE custno="+request.getParameter("custno");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Conntent-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:forward page="member_list.jsp"></jsp:forward>
</body>
</html>
