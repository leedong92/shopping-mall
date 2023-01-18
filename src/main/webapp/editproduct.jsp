<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumSeongSirCe.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link href="bootstrap.css" rel="stylesheet" type="text/css">
	
	<style>
		*{font-family: 'NanumSeongSirCe';}
		.d-flex{position:absolute; right:5px;}
		
	</style>
</head>
<body>
<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="text-center">
				상품 수정
			</h1>
		</div>
	</div>
	<%
		
	%>
	<div class="container">
		<div class="row" align="center">
		<%
		Product product = new Product();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){	
		%>
		<div class="col-md-4">
		
			<img src="<%=rs.getString("pImage") %>" width="200px" height="200px">
			<h3><%=rs.getString("pName") %></h3>
			<p><%=rs.getString("pInfo") %>
			<p><%=rs.getInt("pPrice") %>원
			
			<p><a href="./dbEdit.jsp?id=<%=rs.getString("pId")%>"
			class="btn btn-secondary" role="button">수정하기&raquo;</a>
			<p><a href="./dbDelete.jsp?id=<%=rs.getString("pId")%>" class="btn btn-danger" role="button">삭제&raquo;</a>
		</div>
		<%
			}
		%>
		
		</div>
	
	</div>	
	<%@ include file="footer.jsp"%>
	
</body>
</html>