<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery CDN -->	
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>마이페이지 사이드바</title>

<script>
	$('.nav-pills').scrollingTabs();
</script>

</head>
<body>
	<!-- 메뉴 리스트 -->
	<ul class="nav nav-pills nav-stacked" role="tablist">
		<!-- active: selected 의미 (미리 선택되어 있음) -->
		<!-- data-toggle="tab": 탭 활성화 -->
		<!-- 1. 회원정보관리 -->
		<li id="link_myInfoModify" class="active"><a href="/mypage/MyPageManagement" class="active">회원정보관리</a></li>
		<!-- 2. 내가 개설한 모임 -->
		<li id="link_myCreateMeeting"><a href="/mypage/MyPageCreateMeeting">내가 개설한 모임</a></li>
		<!-- 3. 내가 참여중인 모임 -->
		<li id="link_myEnterMeeting"><a href="/mypage/MyPageParticipation">내가 참여중인 모임</a></li>
		<!-- 4. 내가 찜한 모임 -->
		<li id="link_myGoodMeeting"><a href="/mypage/MyPageGood">내가 찜한 모임</a></li>
		<!-- 5. 내가 올린 자료 -->
		<li id="link_myUploadFile"><a href="/mypage/MyPageUploadFile">내가 올린 자료</a></li>
	</ul>
</body>
</html>