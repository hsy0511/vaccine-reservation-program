<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
 	int reno = Integer.parseInt(request.getParameter("rno"));
	
	StringBuffer sb = new StringBuffer();
	
	sb.append(" select v.RESVNO                                                                 ")
    .append(" ,j.NAME                                                                       ")
    .append(" ,case substr(v.jumin, 8, 1)                                                   ")
    .append(" 	when '1' then '남'                                                          ")
    .append(" 	when '2' then '여'                                                          ")
    .append(" end as gender                                                                 ")
    .append(" ,case v.HOSPCODE                                                              ")
    .append(" 	when 'H001' then '가_병원'                                                    ")
    .append(" 	when 'H002' then '나_병원'                                                    ")
    .append(" 	when 'H003' then '다_병원'                                                    ")
    .append(" 	when 'H004' then '라_병원'                                                    ")
    .append(" end as hospcode                                                               ")
    .append(" ,to_char(v.RESVDATE,'yyyy\"년\"mm\"월\"dd\"일\"') as  RESVDATE                  ")
    .append(" ,substr(to_char(v.RESVTIME, 'FM0000'),1,2)                                      ")
    .append(" 	|| ':' || substr(to_char(v.RESVTIME, 'FM0000'),3,2) as RESVTIME               ")
    .append(" ,case VCODE                                                                     ")
    .append(" 	when 'V001' then 'A백신'                                                      ")
    .append(" 	when 'V002' then 'B백신'                                                      ")
    .append(" 	when 'V003' then 'C백신'                                                      ")
    .append(" end as vcode                                                                    ")
    .append(" ,case h.HOSPADDR                                                                ")
    .append(" 	when '10' then '서울'                                                         ")
    .append(" 	when '20' then '대전'                                                         ")
    .append(" 	when '30' then '대구'                                                         ")
    .append(" 	when '40' then '광주'                                                         ")
    .append(" end as HOSPADDR                                                                 ")
    .append(" from TBL_VACCRESV_202108 v, TBL_JUMIN_202108 j, TBL_HOSP_202108 h               ")
    .append(" where v.JUMIN = j.JUMIN and v.hospcode = h.hospcode                             ")
    .append(" and v.RESVNO =").append(reno);
	
	String sql = sb.toString();

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
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
<% if(rs.next()){ %>
<h1>예약번호 <%= reno %>님의 예약 조회</h1>
<table class = "table">
<tr>
<td>예약번호</td><td>성명</td><td>성별</td><td>병원이름</td><td>예약날짜</td><td>예약시간</td><td>백신코드</td><td>병원지역</td>
</tr>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(8) %></td>
</tr>
</table>
<p align="center"><input type="button" value="돌아가기" onclick="location.href='vrj.jsp'"></p>
<%}else{ %>
<p align="center">예약번호 <%= reno %>번의 정보가 없습니다.</p>
<p align="center"><input type="button" value="홈으로"  onclick="location.href='index.jsp'"></p>
<%} %>

</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>