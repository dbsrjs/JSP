<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <header><jsp:include page="layout/header.jsp"></jsp:include></header>
    <nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>

        <section id="section">
            <h2 class="title">골프연습장 회원관리</h2>
            <p>
            골프연습장에 등록된 감사와 회원들의 수강신청을 관리하는 프로그램이다.<br>
            <strong>프로그램 작성 순서</strong> <br>
            
강사 및 회원정보 테이블 생성 후 일괄 등록한다(create, insert).<br>
수강 신청 테이블 생성 후 샘플 데이터를 일괄 등록한다(create, insert).<br>
등록된 강사 조회하는 프로그램을 작성한다.<br>

문제지의 제시된 추가 신청 데이터를 수강신청 입력한다.<br>-회원명 선택 시 회원번호는 자동으로 표시<br>-회원정보가 20000 이상인 회원은 수강료 50% 할인<br>-모든 항목에 유효성 검사를 실시한다(오류메세지, 포커스를 이동)<br>
-유효성 검사 통가 시 "수강신청이 정상적으로 완료되었습니다" 띄운 후 메인페이지 이동<br>
회원매출정보조회 프로그램을 작성한다.<br>
강사매출현황 조회하는 프로그램을 작성한다.<br>
다시쓰기 버튼은 "정보를 지우고 처음부터 다시 입력합니다" 띄우고 수강월로 포커스 이동<br>

   </p>
</section>

<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>
