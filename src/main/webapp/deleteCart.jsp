<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 비우기</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/NanumSeongSirCe.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	String id = request.getParameter("cardId");
	
	session.invalidate();
	response.sendRedirect("cart.jsp");
	%>
</body>
</html>