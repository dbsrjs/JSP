<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, "system", "1234");
	
	System.out.println("DB 접속");
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>
