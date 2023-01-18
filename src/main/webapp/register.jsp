<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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
			<h1 class="display-3">
				상품 등록
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="processAddProduct.jsp" class="form-horizontal" method="post"
		enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 목록</label>
				<div class="com-sm-3">
					<input type="text" id="productId" name="productId" placeholder="상품번호" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" id="name" name="name" placeholder="상품이름" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="com-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" placeholder="상품가격" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 내용</label>
				<div class="com-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 재고</label>
				<div class="com-sm-3">
					<input type="text" id="unitInStock" name="unitInStock" placeholder="상품재고" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div class="com-sm-3">
					<input type="file" id="productImage" name="productImage" placeholder="상품 이미지" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" >
				
					<input type="button" class="btn btn-primary" value="취소" onclick="location.href='welcome.jsp'">
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>