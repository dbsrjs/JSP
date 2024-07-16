<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css?ver=1.1.1">
<title>쇼핑몰 회원관리</title>
<script type="text/javascript">
    function checkValue() {
        var cv = document.date;

        if(!cv.custno.value){
            alert("회원번호을 입력하세요.");
            cv.custno.focus();
            return false;
        }
		
        for (var i = 0; i < cv.custno.value.length; i++) {
            var c = cv.custno.value.charCodeAt(i);
            if (c < 48 || c > 57) {
                alert("숫자를 입력하세요.");
                cv.custno.focus();
                return false;
            }
        }
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
	<main id="section">
        <h3 class="title">회원매출조회</h3>
        <div class="scroll">
            <form name="date" action="z_inguiry.jsp" method="post" onsubmit="return checkValue()">
                <table class="table_line">
                    <tr>
                        <th>회원번호</th>
                        <th><input type="text" name="custno" autofocus></th>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="조회">
                            <input type='reset' value="취소" onclick="location.href='z_input.jsp'">
                            <input type="button" value="회원목록조회/수정" onclick="location.href='member_list.jsp'">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
