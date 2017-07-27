<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>헤더</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
   .navbar-inverse {
       /* background-color: #2bb7d5; */
       background-color: #40b4e5;
       border-color: #00a3cc;
   }
   .navbar {
       margin: 0;
       border: none;
       border-bottom: 2px solid #95daea;
       border-radius: 0;
   }
   .navbar .navbar-brand{
       color: #fff;
       font-size: 30px;
       font-weight: bold;
   }   
   .navbar-inverse .navbar-nav > li > a {
      color: white;
      font-size: 16px;
      margin-right: 5px;
   }    
</style>

</head>
<body>

	<!-- [Header] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
	<nav class="navbar navbar-inverse navbar-static-top"> <!-- [헤더 영역] 컨테이너 생성 -->
	<!-- [컨테이너1] -->
	<div class="container">
		<!-- clearfix: 어긋난 칼럼들 보정 -->
		<div class="clearfix">
			<!-- 1-1. 로고 -->
			<div class="navbar-header">
				<a href="/" class="navbar-brand navbar-brand-center">DAMOYO</a>
			</div>
		</div>
	</div>
	</nav>
	
</body>
</html>