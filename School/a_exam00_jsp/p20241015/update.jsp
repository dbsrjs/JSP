<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql="select custno, custname, phone, address, "
			+ " to_char(joindate, 'yyyy-mm-dd') joindate, grade, city "
			+ " from member_tbl_02 "
			+ " where custno=" + request.getParameter("custno");
Statement pstmt = conn.createStatement();
ResultSet rs = pstmt.executeQuery(sql);

rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css?ver=1.1.1">
<script type="text/javascript">
function checkValue() {
	var cv = document.data;
	if(!cv.custname.value) {
		alert("회원성명을 입력하세요.");
		cv.custname.focus();
		return false;
	} else if(!cv.phone.value) {
		alert("전화번호를 입력하세요.")
		cv.phone.focus();
		return false;
	} else if(!cv.address.value) {
		alert("주소를 입력하세요.");
		cv.address.focus();
		return false;
	} else if(!cv.joindate.value) {
		alert("가입일자를 입력하세요.");
		cv.joindate.focus();
		return false;
	} else if(cv.grade.value=="") {
		alert("고객등급을 입력하세요.");
		cv.grade.focus();
		return false;
	} else if(!document.data.city.value) {
		alert("도시코드를 입력하세요.")
		document.data.city.focus();
		return false;
	}
}
	function checkDel(custno) {
		msg="삭제하시겠습니까?";
		if(confirm(msg)!=0) {
			alert("삭제");
			location.href="delete.jsp?custno="+custno;
		} else {
			alert("취소");
		}
	}
</script>
<title>쇼핑몰 회원 관리</title>
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>

<main id="section">
	<h3 class="title">쇼핑몰 회원 정보 수정</h3>
	<form name="data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="custno"
							value="<%= rs.getString("custno") %>" size="10" readonly></td>		
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname"
					       value="<%= rs.getString("custname") %>" size="10"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone"
					       value="<%= rs.getString("phone") %>" size="15"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address"
						   value="<%= rs.getString("address") %>" size="25"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="date" name="joindate"
						   value="<%= rs.getString("joindate") %>" size="10"></td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td>
					<input type="radio" name="grade" value="A"<%=("A".equals(rs.getString("grade"))) ? "checked" : ""  %>>A-VIP
					<input type="radio" name="grade" value="B"<%=("B".equals(rs.getString("grade"))) ? "checked" : ""  %>>B-일반
					<input type="radio" name="grade" value="C"<%=("C".equals(rs.getString("grade"))) ? "checked" : ""  %>>C-직원
				</td>
			</tr>
			
			<tr>
				<th>도시코드</th>
					<td>
						<select id="city" name="city">
							<option value="10">서울</option>
							<option value="20">대전</option>
							<option value="30">대구</option>
							<option value="40">광주</option>
							<option value="50">성남</option>
							<option value="60">수원</option>
							<option value="70">분당</option>
							<option value="80">용인</option>
							<option value="90">과천</option>
						</select>
				    </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="submit" value="수정">
					<input type="button" name="search" value="조회"
						  onclick="parent.location.href='member_list.jsp'">
					<input type="button" value="삭제"
						   onclick="checkDel(<%= rs.getString("custno")%>);">
				</td>
			</tr>
		</table>
		<script>
			document.getElementById("city").value="<%= rs.getString("city")%>";
		</script>
	</form>
</main>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>
