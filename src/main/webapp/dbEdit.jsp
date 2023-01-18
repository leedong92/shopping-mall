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
<title>상품 상세수정</title>
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
				상품 상세정보 수정
			</h1>
		</div>
	</div>
	
	<%
	String id = request.getParameter("id");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from product where pId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	System.out.println(id);
	rs = pstmt.executeQuery();
	while(rs.next()){
	%>
	<div class="container">
		<form name="newProduct" action="update.jsp" class="form-horizontal" method="post"
		enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 번호</label>
				<div class="com-sm-3">
					<input type="text" value="<%=rs.getString("pId") %>" name="productId" placeholder="상품번호" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" value=<%=rs.getString("pName") %> name="name" placeholder="상품이름" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="com-sm-3">
					<input type="text" value=<%=rs.getInt("pPrice")%> name="unitPrice" placeholder="상품가격" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 내용</label>
				<div class="com-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("pInfo")%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 재고</label>
				<div class="com-sm-3">
					<input type="text" value=<%=rs.getInt("pStock")%> name="unitInStock" placeholder="상품재고" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div class="com-sm-3">
					<input type="file" value=<%=rs.getString("pImage")%> name="productImage" placeholder="상품 이미지" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정" >
				
					<input type="button" class="btn btn-primary" value="취소" onclick="location.href='welcome.jsp'">
				</div>
			</div>
		</form>
	</div>
	<%
	}
	%>
	
</body>
</html>