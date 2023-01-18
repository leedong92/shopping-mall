<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="dto.Product" %>
    <%@ page import="dao.ProductRepository" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
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
	<%
	//상품id값 받아오기
	String id = request.getParameter("id");
	
	if(id==null||id.trim().equals("")){
		response.sendRedirect("productInfo.jsp");
		return;
	}
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("");
	}
	
	ArrayList<Product> goodList = dao.getAllProducts();
	Product goods = new Product();
	for(int i = 0; i<goodList.size(); i++){
		goods = goodList.get(i);
		if(goods.getProductId().equals(id)){
			break;
		}
	}
	
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cardList");
	if(list == null){
		list = new ArrayList<>();
		session.setAttribute("cardList", list);
	}
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i = 0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity()+1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	if(cnt==0){
		goods.setQuantity(1);
		list.add(goods);
	}
	response.sendRedirect("productInfo.jsp?id="+id);
	%>
</body>
</html>