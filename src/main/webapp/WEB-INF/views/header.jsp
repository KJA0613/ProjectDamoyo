<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<!-- Bootstrap core CSS -->
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- <link href="/resources/examples/offcanvas/offcanvas.css" rel="stylesheet"> -->
<script src="/resources/assets/js/ie-emulation-modes-warning.js"></script>

<title>공통 헤더</title>

<!-- 헤더 전체 CSS -->
<style type="text/css">
   .navbar-inverse {
   	   background-color: #03a9f4;	
       /* background-color: #40b4e5; */			/* 모꼬지 배경색 */
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
   .navbar-inverse .navbar-nav > li {
      font-size: 17px;
      margin-right: 3px;
      font-weight: bold;
   }   
   a.btn_link_host {
   	  font-weight: bold;
   }
</style>

<!-- 헤더 오른쪽 효과  CSS -->
<style type="text/css">
    .actionBtn7 {
		 position:relative;
		 display:inline-block;
		 height:40px;
		 margin:auto;
		 padding:0 18px;
		 line-height:30px;
		 color:#4c4c4d;
		 font-family:oswald;
		 text-transform:uppercase;
		 text-align:center;
		 text-decoration:none;
	  }
	  
	.actionBtn7:after {
		 position:absolute;
		 bottom:0;
		 left:0;
		 display:block;
		 content:"";
		 width:100%;
		 height:2.5px;
		 background-color:#FFFFFF;
		 transform:scale3d(0,1,1);
		 transform-origin:center center;
		 transition:transform .2s;
	}
	
	.actionBtn7:hover:after {
		 transform:scale3d(1,1,1);
		 font-size: 19px;
	} 
</style>


<!-- 장소링크 CSS -->
<style type="text/css">
	#f_color {
		color: white;
	}
	
	#s_color {
		color: #ffff00;
	}
	
	.btn_link_host {
		margin-top: 8px;
 		padding: 1px 2px 4px 2px;
 		   
		display: block;
		position: absolute;

		height: 35px; 
		border: 3px solid #ffff00;
	    text-align:center;
    }
</style>

</head>
<body>

	<!-- 01.[Header] Navigation Bar로 구현 -->
	<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container">
		<div class="clearfix">		
			<!-- 01-01. 로고 -->
			<div class="navbar-header">
				<a href="/" class="navbar-brand navbar-brand-center">DAMOYO</a>
			</div>
			
			<!-- 01-02. 헤더 오른쪽 -->
			<ul class="nav navbar-nav navbar-right">	<!-- ul: 순서가 필요없는 목록 만들 때 사용(ol과 반대개념) -->				
				<!-- 세션에 데이터 저장 여부에 따라 보여지는 화면 다름  --> 
				<!-- 1) [비회원] 로그인 안 된 상태 (session에 저장된 id가 없을 때) -->
				<!-- 2) [회원 - 개인(A)/광고주(B)]로그인이 된 상태 (session에 저장된 id가 있을 때) -->
				
				<%-- <c:choose>
				
					<c:when test = "${empty pdto.guserId}">
						<li><a href="/member/LoginForm" class="code_view actionBtn7" id="f_color">로그인</a></li>
						<li><a href="/join/JoinChoiceForm" class="code_view actionBtn7" id="f_color">회원가입</a></li>
					</c:when>				
					
					<c:when test = "${empty cdto.comId}">
						<li><a href="/member/LoginForm" class="code_view actionBtn7" id="f_color">로그인</a></li>
						<li><a href="/join/JoinChoiceForm" class="code_view actionBtn7" id="f_color">회원가입</a></li>
					</c:when>
					
					<c:otherwise>
						<c:choose>
						
							<c:when test = "${pdto.guserCode eq 'A'}">	
								<li><a href="/mypage/MyPageManagement" class="code_view actionBtn7" id="f_color">${pdto.guserId}님 마이페이지</a></li>
								<li><a href="/member/Logout" class="code_view actionBtn7" id="f_color">로그아웃</a></li>
							</c:when>	
											
							<c:when test = "${cdto.comCode eq 'B'}">
								<li style="padding-right: 4px;"><a href="/place/PlaceRegistForm" class="btn_link_host" style="padding: 7px 7px 10px 7px;" id="s_color">공간 등록하기</a></li>&nbsp;
								<li><a href="/mypage/MyPageManagement" class="code_view actionBtn7" id="f_color">${cdto.comId}님 마이페이지</a></li>
								<li><a href="/member/Logout" class="code_view actionBtn7" id="f_color">로그아웃</a></li>
							</c:when>
						</c:choose>
					</c:otherwise>				
					
				</c:choose> --%>
				
				<c:choose>
				
					<c:when test = "${null ne pdto.guserId}">
						<li><a href="/mypage/MyPageManagement" class="code_view actionBtn7" id="f_color">${pdto.guserId}님 마이페이지</a></li>
						<li><a href="/member/Logout" class="code_view actionBtn7" id="f_color">로그아웃</a></li>
					</c:when>				
					
					<c:when test = "${null ne cdto.comId}">
						<li><a href="/mypage/MyPageManagement" class="code_view actionBtn7" id="f_color">${cdto.comId}님 마이페이지</a></li>
						<li><a href="/member/Logout" class="code_view actionBtn7" id="f_color">로그아웃</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="/member/LoginForm" class="code_view actionBtn7" id="f_color">로그인</a></li>
						<li><a href="/join/JoinChoiceForm" class="code_view actionBtn7" id="f_color">회원가입</a></li>
					</c:otherwise>				
					
				</c:choose>
				
				
					
				
			</ul>
		</div>
	</div>
	</nav>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/resources/assets/js/ie10-viewport-bug-workaround.js"></script>
	<!-- <script src="/resources/examples/offcanvas/offcanvas.js"></script> -->
</body>
</html>