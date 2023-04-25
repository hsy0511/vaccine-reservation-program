<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String sql = "select max(RESVNO) from TBL_VACCRESV_202108";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "style.css?abc">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkVal() {
	if(!document.data.rno.value){
		alert("예약번호를 입력하세요.");
		data.rno.focus();
		return false;
	}else if(!document.data.jno.value){
		alert("주민번호를 입력하세요.");
		data.jno.focus();
		return false;
	}else if(!document.data.vcode.value){
		alert("백신코드를 입력하세요.");
		return false;
	}else if(!document.data.hcode.value){
		alert("병원코드를 입력하세요.");
		return false;
	}else if(!document.data.rdate.value){
		alert("예약날짜를 입력하세요.");
		data.rdate.focus();
		return false;
	}else if(!document.data.rtime.value){
		alert("예약시간를 입력하세요.");
		data.rtime.focus();
		return false;
	}
	
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
<form name = "data" method="post" action="vr_p.jsp" onsubmit="return checkVal()">
<h1>백신 예약</h1>
<table class = "table">
<tr>
<td>예약번호</td>
<td><input type = "text" name = "rno" value="<%= num %>" readonly> 예)20210011</td>
</tr>
<tr>
<td>주민번호</td>
<td><input type = "text" name = "jno"> 예)790101-1111111</td>
</tr>
<tr>
<td>백신코드</td>
<td><select name = "vcode">
<option value = "">백신선택</option>
<option value = "V001">A백신</option>
<option value = "V002">B백신</option>
<option value = "V003">C백신</option>
</select> 예)V001, V002, V003</td>
</tr>
<tr>
<td>병원코드</td>
<td><input type ="radio" name = "hcode" value ="H001">가_병원
<input type ="radio" name = "hcode" value ="H002">나_병원
<input type ="radio" name = "hcode" value ="H003">다_병원
<input type ="radio" name = "hcode" value ="H004">라_병원
 예)H001, H002, H003, H004</td>
</tr>
<tr>
<td>예약날짜</td>
<td><input type = "text" name = "rdate"> 예)20210101</td>
</tr>
<tr>
<td>예약시간</td>
<td><input type = "text" name = "rtime"> 예)0903,1130</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type = "submit" value="등록">
<input type = "reset" value="취소">
</td>
</tr>
</table>
</form>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>