<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<!-- jQuery library -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- JQuery CDN -->	
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>마이페이지</title>

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

<!-- JavaScript -->
<!-- 왼쪽 메뉴바 클릭시, 해당 페이지 보이게하기 -->
<script>
	$('.nav-pills').scrollingTabs();
</script>

<!-- [Header] 공통 헤더 -->
<%@include file = "../header.jsp"%>

</head>
<body>
	
	<!-- [Content] 내용 입력 -->
	<div class="container">
		<!-- 타이틀 -->
		<div class="page-header clearfix">
			<h1>마이페이지</h1>		
		</div>
	
		<!-- "리스트" 및 리스트에 해당되는 "내용"  -->
		<div id="myPageSetting" class="row">
		
			<!--/// [왼쪽/리스트 목록]: 12칸 중 "3칸" 크기 확보 ///-->
			<div class="col-md-3">			
				<!-- 메뉴 리스트 -->
				<ul class="nav nav-pills nav-stacked" role="tablist">
					<!-- active: selected 의미 (미리 선택되어 있음) -->
					<!-- data-toggle="tab": 탭 활성화 -->
					<!-- 1. 회원정보관리 -->
					<li id="link_myInfoModify" class="active"><a href="#tab1" data-toggle="tab">회원정보관리</a></li>
					<!-- 2. 내가 개설한 모임 -->
					<li id="link_myCreateMeeting"><a href="#tab2" data-toggle="tab">내가 개설한 모임</a></li>
					<!-- 3. 내가 참여중인 모임 -->
					<li id="link_myEnterMeeting"><a href="#tab3" data-toggle="tab">내가 참여중인 모임</a></li>
					<!-- 4. 내가 찜한 모임 -->
					<li id="link_myGoodMeeting"><a href="#tab4" data-toggle="tab">내가 찜한 모임</a></li>
					<!-- 5. 내가 올린 자료 -->
					<li id="link_myUploadFile"><a href="#tab5" data-toggle="tab">내가 올린 자료</a></li>
				</ul>				
			</div>
			
			
			<!--/// [오른쪽/리스트에 해당되는 내용]: 12칸 중 "9칸" 크기 확보 ///-->
			<div class="col-md-9">							
				<!-- 각 탭에 해당되는 내용 -->	
				<div class="tab-content">				
					<!-- 1. 회원정보관리 -->
					<div id="tab1" class="tab-pane active">
						<%@include file = "MyPageInfoModify.jsp"%>					
					</div>						
				
					<!-- 2. 내가 개설한 모임 -->				
					<div id="tab2" class="tab-pane">
	    				<%@include file = "MyPageCreateMeeting.jsp"%>
	    			</div>	
				
					<!-- 3. 내가 참여중인 모임 -->				
					<div id="tab3" class="tab-pane">
	    				<%@include file = "MyPageParticipation.jsp"%>
	    			</div>	
				
					<!-- 4. 내가 찜한 모임 -->
					<div id="tab4" class="tab-pane">
	    				<%@include file = "MyPageGood.jsp"%>
	    			</div>
	    			
					<!-- 5. 내가 올린 자료  -->
					<div id="tab5" class="tab-pane">
	    				<%@include file = "MyPageUploadFile.jsp"%>
	    			</div>	
	      		</div>
			</div>
			
		</div>

		
	<!-- [Footer] 페이지 하단 (고정화면) -->
	<hr>
	<%@include file = "../footer.jsp"%>
	
	</div>
	
</body>
</html>