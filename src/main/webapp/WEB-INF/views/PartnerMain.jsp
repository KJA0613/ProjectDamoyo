<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<title>광고주 메인페이지</title>

<!-- 소개글 CSS -->
<style>
	.intro_wrap {	    
	    padding-top: 147px;
	    padding-bottom: 59px;
	    
	    padding: 90px 22px 45px;
    	z-index: 2;
    	font-size: 14px;
    	
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
	
	.btn_area {
		width: 1000px;
		height: 100px;
		text-align: center;
	    display: inline-block;
	}
	
	.btn_wrap {
		padding-left: 55px;
	    float: left;
	    width: 30%;
	    display: block;
	}
	
	.btn_wrap a{
		font-size: 26px;
		font-weight: bold;
	}
	
	.btn {
	    width: 270px;
	    height: 50px;
    	padding: 35px 7px 7px 24px;
		text-align: center;
		border-radius: 0;
	}
	
	.space_total {
   		color: #fff; 
		background-color: #03a9f4;
	}
	
	.space_regist {
		color: #fff;
		background-color: #ffcc00;
	}
	
	.my_space {
		color: #fff;
		background-color: #999999;	
	}
</style>

<!-- 모임공간 검색창1 CSS -->
<style type="text/css">
	.box_search {
	    position: relative;
	    padding: 30px;
	    border: 4px solid #40b4e5;
	    background: #fff;
	    padding: 147px 50px 80px;
	    width: 1150px;
	    height: 200;
	    margin: 0 auto;
	    vertical-align: middle;
	}

	.box_inner {
		position: relative;
	}
	
	.box_search .period_search {
    	display: block;
    	padding: 0 168px 0 320px;
	}
	
	.flex_wrap > dl {
		position: absolute;
	    top: 0;
	    left: 0;
	    width: 290px;
	    float: left;
	}
	
	.flex_box {
		display: table;
	}
	
	.flex_wrap .flex {
	    display: block;
    	width: 100%;
	}
	
	.flex_wrap .flex+.flex {
    	margin-top: 16px;
	}
	
	.flex_box .tit {
	    font-size: 18px;
	    padding-top: 2px;
	}
	
	.row {
    	position: relative;
	}

	.select>select {
	    position: relative;
	    z-index: 2;
	    padding: 0 35px 0 13px;
	    margin: 0;
	    width: 100%;
	    height: 48px;
	    border: 0;
	    background-color: transparent;
	    line-height: 48px;
	    vertical-align: top;
	    border-radius: 0;
	}
</style>



<!-- 모임공간 검색창1 CSS -->
<style type="text/css">
	

</style>

<!-- 원하는 위치로 이동 -->
<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>

<!-- 모임공간등록, 나의모임공간 > 기업회원만 접근가능 -->
<script>
	function member_chk(chk_id) {
		if(chk_id == null) {
			alert('기업회원만 작성 가능합니다.^^');			
			$('#memberChk1').removeAttr("href");
			$('#memberChk2').removeAttr("href");
		}
	}
</script>

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
		
		<br>
		
		<div class="btn_area">
			<div class="btn_wrap">
				<a class="btn space_total" onclick="fnMove('1')">전체 모임 공간</a>
			</div>
			<div class="btn_wrap">
				<a href="/place/PlaceRegistForm" id="memberChk1" onclick="member_chk(${cdto.comId})" class="btn space_regist">모임 공간 등록</a>
			</div>
			<div class="btn_wrap">
				<a href="/mypage/MyPageCreateMeeting" id="memberChk2" onclick="member_chk(${cdto.comId})" class="btn my_space">나의 모임 공간</a>
			</div>
		</div>		
	</div>			
	<hr>
	
		
	<!-- 모임공간 광고  -->
    <div class="wrapper" id="div1">
    <br>
  	   <h1>모임 공간</h1>
   	   <hr style="border: solid 1px #b3b3b3;">
	    	<%@include file="place/PlaceAll.jsp"%>   	   		
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>    
    
    <!-- [Footer] 페이지 하단 (고정화면) -->
    <hr>
    <%@include file = "footer.jsp"%>
    <br><br><br>
	</div>		
	
    
</body>
</html>