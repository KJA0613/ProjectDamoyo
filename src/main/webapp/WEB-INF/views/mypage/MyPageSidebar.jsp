<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 사이드바</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
   .navbar-inverse {
       background-color: #2bb7d5;
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
       font-size: 28px;
       font-weight: bold;
   }   
   
   .navbar-inverse .navbar-nav > li > a {
       color: white;
   }   
   
   .h4 {
         font-size: 18px;
         margin-top: 10px;
         margin-bottom: 10px;
         color: inherit;
   }
      
   .li {
        font-color: black;
   }   
</style>

</head>
<body>
	<!-- 메뉴 리스트 -->
	<ul class="nav nav-pills nav-stacked" role="tablist">
		<!-- active: selected 의미 (미리 선택되어 있음) -->
		<!-- data-toggle="tab": 탭 활성화 -->
		<!-- 1. 회원정보관리 -->
		<li id="link_myInfoModify" class="active"><a href="/mypage/MyPageManagement">회원정보관리</a></li>
		<!-- 2. 내가 개설한 모임 -->
		<li id="link_myCreateMeeting"><a href="/mypage/CreateMeeting">내가 개설한 모임</a></li>
		<!-- 3. 내가 참여중인 모임 -->
		<li id="link_myEnterMeeting"><a href="/mypage/Participation">내가 참여중인 모임</a></li>
		<!-- 4. 내가 찜한 모임 -->
		<li id="link_myGoodMeeting"><a href="/mypage/Good">내가 찜한 모임</a></li>
		<!-- 5. 내가 올린 자료 -->
		<li id="link_myUploadFile"><a href="/mypage/UploadFile">내가 올린 자료</a></li>
	</ul>
</body>
</html>