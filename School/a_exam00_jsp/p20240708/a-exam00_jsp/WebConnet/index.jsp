<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
	<h2 class="title">쇼핑몰 회원관리 프로그램</h2>
	<p>
		쇼핑몰 회원정보와 매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
		프로그램 작성 순서<br>
		1. 회원정보 테이블을 생성한다.<br>
		2. 매출정보 테이블을 생성한다.<br>
		3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
		4. 회원정보 입력 화면프로그램을 작성한다.<br>
		5. 회원정보 조회 프로그램을 작성한다.<br>
		6. 회원매출정보 조회 프로그램을 작성한다.<br>
	</p>
	</main>
	<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>