<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤더2</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
   .navbar-inverse {
       /* background-color: #40b4e5; */			/* 모꼬지 배경색 */
       background-color: #03a9f4;
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
	<!-- 회원가입 2단계 진행 시, 1차에서 받아온 아이디값으로 인해 > OOO님 마이페이지 생성으로  안 보이게 하기 -->
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