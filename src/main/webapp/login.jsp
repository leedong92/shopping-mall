<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
				로그인
			</h1>
		</div>
	</div>
	<div class="text-center">
		<input type="text" id="userId" name="userId" placeholder="아이디">
		<br><br>
		<input type="text" id="userPass" name="userPass" placeholder="비밀번호">
		<br><br>
		<input type="submit" class="btn btn-primary" value="로그인" >
		<input type="submit" class="btn btn-primary" value="회원가입" >
	</div>
	
	
	

</body>
</html>