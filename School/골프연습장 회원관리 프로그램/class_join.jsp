<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<script type="text/javascript">
	function checkValue() {
		var cv = document.data;
		
		if(cv.resist_month.value=="") {
			alert("수강 년월을 입력하세요.");
			return false;
		} else if(!cv.class_area.value) {
			alert("강의 장소를 입력하세요.");
			cv.class_area.focus();
			return false;
		}
		alert("수강신청이 정상적으로 완료되었습니다.");
	}
	function btn() {
		alert("입력된 내용을 취소합니다.");
		document.location.href="class_join.jsp"
	}
</script>
<title>수강신청</title>
</head>
<body>
    <header><jsp:include page="layout/header.jsp"></jsp:include></header>
    <nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>

   <section id="section">
       <h2 class="title">수강신청</h2>
       <form name="data" action="class_join_p.jsp" method="post" onsubmit="return checkValue()">
       <table class="table_line">
       	<tr>
       		<th>수강월</th>
       		<td><input type="text" name="resist_month" size="20">2022년03월</td>
       	</tr>
       	<tr>
       		<th>회원명</th>
       		<td>
       			<select id="id_c_no" name="c_no" onchange="selectCity()">
       			<%
       				String sql="select c_no, c_name from tbl_member_202201";
	       			PreparedStatement pstmt = conn.prepareStatement(sql);
	       			ResultSet rs = pstmt.executeQuery();
       			%>
       			<option value="">회원명</option>
       			<% while(rs.next()){ %>
       			<option value=<%= rs.getString("c_no") %>><%= rs.getString("c_name") %></option>
       			<%} %>
       			</select>
       		</td>
       	</tr>
       	<tr>
       		<th>회원번호</th>
       		<td><input type="text" id="select_c_no" name="select_c_no" size="20" readonly></td>
       	</tr>
       	<tr>
       		<th>강의장소</th>
       		<td><input type="text" name="class_area" size="20"></td>
       	</tr>
       	<tr>
       		<th>강의명</th>
       		<td>
       			<select id="id_teacher_name" name="teacher_name" onchange="selectTeacherName()">
       				<%
       					sql="select teacher_code, class_name, class_price from tbl_teacher_202201";
       					pstmt = conn.prepareStatement(sql);
       					rs = pstmt.executeQuery();
       				%>
       				<option value="">강의신청</option>
       				<%while(rs.next()){ %>
       				<option value=<%= rs.getString("class_price") %> data-sub=<%=rs.getString("teacher_code") %>><%=rs.getString("class_name") %></option>
       				<%} %>
       			</select>
       			<%
       				pstmt.close();
       				rs.close();
       			%>
       		</td>
       	</tr>
       	<tr>
       		<th>수강료</th>
       		<td><input type="text" id="select_class_price" name="tuition" size="20" readonly>원</td>
       	</tr>
       	<tr>
       		<td colspan="2" align="center">
       			<input type="submit" value="수강신청">
       			<input type="button" value="다시쓰기" onclick="javascript:btn()">
       			<input type="button" value="강사조회" onclick="location.href='teacher_list.jsp'">
       		</td>
       	</tr>
       </table>
       <input type="hidden" id="teacher_code" name="teacher_code">
       <input type="hidden" id="result_tuition" name="result_tuition">
       <script>
       		document.getElementById("joindate").value = new Date().toISOString().substring(0, 10);
       		function selectCity() {
				var citySelect = document.getElementById("id_c_no");
				
				var selectValue = citySelect.options[citySelect.selectedIndex].value;
				var selectText = citySelect.options[citySelect.selectedIndex].text;
				
				document.getElementById("select_c_no").value = selectValue;
				
				//회원번호 20000 이상인 회원은 수강료 50% 할인 적용
				var rate = 1;
				if(document.data.select_c_no.value >="20000") {
					rate = 0.5;
				}
				var r_tuition = parseInt(document.data.tuition.value) * rate;
				document.getElementById("result_tuition").value = r_tuition;
			}
       		
       		function selectTeacherName() {
       			var classSelect = document.getElementByld("id_teacher _name");
       			
       			var selectValue = classSelect.options[classSelect.selectedIndex].value;
       			var selectText = classSelect.options[classSelect.selectedIndex].text;
       			
       			document.getElementByld("select_class_price").value = selectValue;
       			
       			//input type hidden 값 설정
       			var subValue = classSelect.options[classSelect.selectedIndex].dataset.sub;
       			document.getElementByld("teacher_code").value = subValue;
       			//회원번호 20000 이상인 회원은 수강료 50% 할인 적용
       			var rate = 1;
       			if (document.data.select_c_no.value >= "20000") {
       				rate = 0.5;
       			}
       			var r_tiition = parseInt(selectValue) * rate;
       			document.getElementById("result_tuition").value = r_tuition;
			}
       </script>
       </form>
	</section>

<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>