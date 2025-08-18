<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql="select max(pk_schedule) from tbl_schedule";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int num = rs.getInt(1)+1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		var cv = document.data;
		if(!cv.date.value) {
			alert("일정일자를 입력하지 않았습니다.");
			cv.date.focus();
			return false;
		} else if(!cv.number.value) {
			alert("회원번호를 입력하지 않았습니다.");
			cv.number.focus();
			return false;
		} else if(!cv.memo.value) {
			alert("일정메모를 입력하지 않았습니다.");
			cv.memo.focus();
			return false;
		}
		
		alert("일정등록이 정상적으로 되었습니다.");
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id='section'>
		<h3 class='title'>일정 등록</h3>
		<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
			<tr>
				<th>일정번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%= num %>" size="10" readonly></td>		
			</tr>
			<tr>
				<th>일정일자</th>
				<td><input type="text" name="date" size="10" autofocus>(ex: 25년 1월 1일>20250101)</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="number" size="15">(ex: M0001)</td>
			</tr>
			<tr>
				<th>일정메모</th>
				<td><input type="text" name="memo" size="25"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick="location.href='date_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
