<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/NanumSeongSirCe.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>

<style>
img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="text-center">상품 정보</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id");
	System.out.println(id);
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	Product test = dao.getProductOne(id);
	
	%>
	
	<div class="text-center">
		<div class="row">
			<div class="text-center">
				<img src="<%=test.getImageName()%>" style="width: 200px; height: 200px;">
				<h3><%=test.getPname()%></h3>
				<p><%=test.getDescription()%>
				<p>
					<b>상품 코드:<b><span class="badge badge-danger"> <%=test.getProductId()%></span>
							<p>
								<b>제조사</b> :
								<%=test.getManufacturer()%>
							<p>
								<b>분류</b> :
								<%=test.getCategory()%>
							<p>
								<b>재고 수</b> :
								<%=test.getQuantity() %>
							<h4><%=test.getUnitPrice()%>원
							</h4>
							<form name="addForm"
								action="./addCart.jsp?id=<%=test.getProductId()%>" method="post">
								<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문
									&raquo;</a> <a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
								<a href="./products.jsp" class="btn btn-secondary">상품
									목록&raquo;</a>
							</form>
			</div>
		</div>
	</div>
	

	<%@ include file="footer.jsp"%>


</body>
</html>