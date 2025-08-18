<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<section>
		<h3 class='title'>일정 관리 프로그램</h3>
		<p>
			회원 일정 관리를 위한 데이터베이스를 구축하고 회원 일저 관리 프로그램을 작성하는 프로그램이다.<br>
			프로그램 작성 순서<br>
			1. 회원 테이블을 작성한다.<br>
			2. 일정 테이블을 작성한다.<br>
			3. 회원 및 일정 테이블에서 제시된 문제지의 참조데이터를 추가 생성한다.<br>
			4. 홈페이지 프로그램을 작성한다.<br>
			5. 일정등록 프로그램을 조건에 맞게 작성한다.<br>
			6. 회원현황, 일정현황 프로그램을 작성한다.<br>
		</p>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
