<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

   Class.forName("oracle.jdbc.OracleDriver");

   Connection con = null;

   try{

       String url = "jdbc:oracle:thin:@localhost:1521:xe";

       con = DriverManager.getConnection(url, "system", "1234");

       System.out.println("DB 접속");

   } catch(Exception e){

       System.err.println("DB 접속 실패!!");

       e.printStackTrace();

   }

%>
</body>
</html>
