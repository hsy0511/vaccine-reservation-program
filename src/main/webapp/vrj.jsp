<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "style.css?abc">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkVal2() {
	if(!document.data2.rno.value){
		alert("예약번호를 입력하세요.");
		data2.rno.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>
<section class = "section">
<form name= "data2" method="post" action="vrj_p.jsp" onsubmit="return checkVal2()">
<h1>백신 예약 조회</h1>
<table class = "table">
<tr>
<td>예약번호</td>
<td><input type="text" name = "rno"></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="조회하기">
<input type="button" value="홈으로"  onclick="location.href='index.jsp'">
</table>
</form>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>