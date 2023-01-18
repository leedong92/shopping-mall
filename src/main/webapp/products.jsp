<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumSeongSirCe.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link href="bootstrap.css" rel="stylesheet" type="text/css">
	
	<style>
		*{font-family: 'NanumSeongSirCe';}
		.d-flex{position:absolute; right:5px;}
		img{width:200px; height:200px;}
	</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="text-center">상품 목록</h1>
		</div>
	</div>
	
	
	
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
			
			<p><a href="./productInfo.jsp?id=<%=rs.getString("pId") %>" 
			class="btn btn-secondary" role="button">상세정보&raquo;</a>
		</div>
		<%
			}
		%>
		
		</div>
	
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>