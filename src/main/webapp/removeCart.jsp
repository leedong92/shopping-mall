<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 상품 삭제</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/NanumSeongSirCe.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String id = request.getParameter("id");
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
		if(product == null){
			response.sendRedirect("exceptionnNoProductId.jsp");
		}
		ArrayList<Product> cardList = (ArrayList<Product>)session.getAttribute("cardList");
			Product good = new Product();
			for(int i = 0; i<cardList.size(); i++){
				good = cardList.get(i);
				if(good.getProductId().equals(id)){
					cardList.remove(good);
				}
			}
			response.sendRedirect("cart.jsp");
		
		
	%>
</body>
</html>