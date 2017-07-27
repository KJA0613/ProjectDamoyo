<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>광고주 메인페이지</title>

<!-- 소개글 CSS -->
<style>
	.intro_wrap {	    
	    padding-top: 147px;
	    padding-bottom: 59px;
	    
	    padding: 90px 22px 45px;
    	z-index: 2;
    	font-size: 14px;
    	
    	/* background: yellow; */	/* test */
    	
    	height: auto;
    	color: #000;
    	text-align: center;
	}
	
	.intro_wrap h2 {
    	padding-top: 35px;
    	font-size: 56px;
        line-height: 60px;
	}
	
	em {
    	vertical-align: top;
	}
	
	.intro_wrap .desc {
    	padding-top: 18px;
    	font-size: 20px;
    	line-height: 30px;
    	color: #656565;
	}
</style>

<!-- [Header] 공통 헤더 -->
<%@include file="header.jsp"%>
</head>

<body>
	<!-- 소개글 -->
	<div class="intro_wrap">
		<h2>
			지금 <em>바로</em> 공간을 공유해보세요! 
		</h2>
		
		<p class="desc">
			스터디룸, 세미나룸, 컨퍼런스룸 등 다양한 모임 공간을 다모여를 통해 공유해보세요!
		</p>
		
		<div class="btn_area">
			<div class="btn_wrap">
				<a href="#">공간 등록하기</a>
			</div>
			<div class="btn_wrap">
				
			</div>
		</div>
	</div>
</body>
</html>