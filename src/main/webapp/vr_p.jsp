<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String sql = "insert into TBL_VACCRESV_202108 values(?,?,?,?,?,?)";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("rno"));
	pstmt.setString(2, request.getParameter("jno"));
	pstmt.setString(3, request.getParameter("hcode"));
	pstmt.setString(4, request.getParameter("rdate"));
	pstmt.setString(5, request.getParameter("rtime"));
	pstmt.setString(6, request.getParameter("vcode"));
	
	pstmt.executeUpdate();
	
%>   
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "style.css?abc">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>