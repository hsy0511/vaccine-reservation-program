<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String sql = "select h.HOSPADDR, case h.hospaddr when '10' then '서울' when '20' then '대전' when '30' then '대구' when '40' then '광주' end as hosparea,count(v.HOSPCODE) from TBL_HOSP_202108 h, TBL_VACCRESV_202108 v where h.HOSPCODE = v.HOSPCODE(+) group by HOSPADDR order by HOSPADDR";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int sum = 0;;


%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "style.css?abc">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>
<section class = "section">
<h1>백신예약현황</h1>
<table class = "table">
<tr>
<td>병원지역</td><td>병원지역명</td><td>접종예약건수</td>
</tr>
<% while(rs.next()){ %>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<%
sum += Integer.parseInt(rs.getString(3));
} %>
</tr>
<tr>
<td colspan="2" align="center">총합</td>
<td><%= sum %></td>
</table>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>