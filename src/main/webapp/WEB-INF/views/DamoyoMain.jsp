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

<title>다모여 메인페이지</title>
<style type="text/css">
	.btn-primary {
	   background-color: #66a3ff;
	   padding: 50px 70px;
	   font-size: 50px;
	   color: white;
	   text-align: center;
	   font-weight: 600px;
	   border: none;
	}
	
	.col-xs-2 {
		background-color: #80bfff;
		border: 1px;
		color: white;
		font-size: 50px;
	}
</style>

<!-- 주제 이미지 효과  CSS -->
<style>
	.clear {
	    clear: both;
	}
	.images2 {
		padding-top: 130px;
	}
</style>

<!-- 검색창 효과 -->
<style>
	.blue_search{
		display: inline-block;
	    width: 400px;
	    height: 41px;
	    border: 2px solid #03a9f4;
	    background: #fff;
	}
	.input_text {
	    margin: 8px 0 0 0px;
	    width: 380px;
	    height: 23px;
	    outline: 0;
	    border: 0;
	    color: #bbb9b9;
	    font-weight: normal;
	    font-size: 16px;
	    line-height: 20px;
	}
	.btn_search {
 		width: 41px;
		height: 41px;	 
		position: absolute;
		border: 0;
	    background: #03a9f4;
		overflow: visible;    
	}
	.img_srh{
		position: absolute;
	    top: 4px;
	    left: 3px;
	}
	
	#choice_area1 {
		/* position: absolute; */
 		width: 120px;
		height: 41px;	 
		border: 2px solid #03a9f4;   
	    background: #fff;
	}
	#choice_area2 {
		/* position: absolute; */
 		width: 120px;
		height: 41px;	 
		border: 2px solid #03a9f4;   
	    background: #fff;
/* 	    left: 100px; */
	}
	
</style>

<!-- 장소 광고 CSS -->
<!-- <style>
	.wrapper {
	    max-width: 1100px;
	    margin: 0 auto;
	    position: relative;
	}
	
	.wrapper ul.properties_list li {
	    display: block;
	    width: 30%;
	    height: auto;
	    position: relative;
	    float: left;	    
	    margin: 0 3% 3% 0;
	}
	
	.wrapper ul.properties_list li img.property_img {
	    width: 100%;
	    height: auto!important;
	    vertical-align: top;
	}
	
	.wrapper ul.properties_list li .price {
	    position: absolute;
	    top: 10px;
	    left: 10px;
	    padding: 15px 20px;
	    background: #ffffff;
	    color: #514d4d;
	    font-size: 16px;
	    font-weight: bold;
	    letter-spacing: 1px;
    }
    
    .wrapper ul li .property_details {
	    width: 100%;
	    padding: 2.9% 5.8% 4.1% 5.8%;
	    border-bottom: 1px solid #f2f1f1;
	    border-left: 1px solid #f2f1f1;
	    border-right: 1px solid #f2f1f1;
    }
    
    .wrapper ul li .property_details h1 a {
	    text-decoration: none;
	    color: #666464;
	}
	 
	.wrapper ul li .property_details.title a{
	    color: #666464;
	    font-size: 28%;
	    font-weight: bold;
	    margin-left: 0px;
	    margin-bottom: 5px;
	    line-height: 28px;
	    vertical-align: baseline;
	    background: transparent;
	}
	
	.property_details h3 {
		color: #40b4e5;
		margin-left: 0px;
	    margin-bottom: 5px;
	    line-height: 25px;
	}
	
	.details {
		margin-left: 0;
	}
	
	#s1 {
	margin-left: 0px;
		color: #777;
		font-weight: bold;
		font-size: 16px;
		    /* display: inline-block; */
    	/* padding: 0px 5px 0; */
	}
	#s2 {
	margin-left: 0px;
		color: #777;
		font-size: 16px;
		font-weight: normal;
	}	

</style> -->


<!-- JavaScript -->
<!-- 주제별 URL -->
<script>
	// 검색어 체크된 상태로 검색되게 작업하기
	function subject(type) {
		document.location.href="gather/gathering?type="+type;
	}
</script>


<!-- 위치 선택 -->
<!-- [Header] 공통 헤더 -->
<%@include file="header.jsp"%>

</head>

<body>
	<br><br><br>
   	<div class="container text-center">
		<!-- 01. 검색 -->
		<!-- 01-01. 위치 검색 (위치 선택)-->
		<div class="from-group"  style="height: 0px;">
		<br><br><br><br>		
					
			<!-- 01-02. 주제어 검색 -->
			<div class="col-md-12" style="width: 1px;">
				<form action="/gather/damoyoSearch" method="get" style="width: 450px; margin-left: 320px;">
					<span class="blue_search">
						<input type="text" name="sSTR" class="input_text" placeholder="주제어를 검색해주세요.">
					</span>
					<button type="submit" class="btn_search">
						<span class="img_srh">
							<img src="resources/image/main/btn_srh.png">		 
						</span>
					</button>
				</form>
			</div>		
		
			<!-- 01-03. 인기 검색 -->
			
<%-- 		<div>
			<c:forEach var="gathering" items="${list2}">
				<li>${gathering.name}</li><br/>
			</c:forEach>
		</div> --%>

		<!-- Page Content -->
		</div>	
		
		<div style="margin-left: 830px; border-style: solid; border-color: #b3b3b3; border-width: thin;">
		 	<ol>
			<c:forEach var="dto" items="${list}">
				<li style="text-align: left;"><a href="">${dto.gatherSubject}</a></li>
			</c:forEach>
			</ol>
		</div>
   
		<!-- 02. 테마  -->
		<h1 style="margin-top: 180px">테마별 검색</h1>
		<hr style="border: solid 1px #b3b3b3;">
		<br>
		
		<!-- 1행 -->
		<div class="images1">
		<br>
				<!-- 1. 외국어 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox1');" style="position: absolute;">		
						<div class="cutter foreign">
							<div class="img"><img src="resources/image/main/foreign.png"></div>	<!-- #ABD8EB -->
						</div>
					</div>
				</div>
				
				<!-- 2. 영어 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox2');" style="position: absolute;">		
						<div class="cutter eng">
							<div class="img"><img src="resources/image/main/english.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 3. 음악/공연 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox3');" style="position: absolute;">		
						<div class="cutter music">
							<div class="img"><img src="resources/image/main/music.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 4. 라이프 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox4');" style="position: absolute;">		
						<div class="cutter life">
							<div class="img"><img src="resources/image/main/life.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 5. 취업 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox5');" style="position: absolute;">		
						<div class="cutter job">
							<div class="img"><img src="resources/image/main/job.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 6. 게임 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox6');" style="position: absolute;">		
						<div class="cutter game">
							<div class="img"><img src="resources/image/main/game.png"></div>
						</div>
					</div>
				</div>
			<div class="clear"></div>
		</div>
		<br><br>
		
		
		<!-- 2행 -->
		<div class="images2">
				<!-- 7. 스포츠 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox7');" style="position: absolute;">		
						<div class="cutter sports">
							<div class="img"><img src="resources/image/main/sports.png"></div>	<!-- #ABD8EB -->
						</div>
					</div>
				</div>
				
				<!-- 8. 뷰티/미용 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox8');" style="position: absolute;">		
						<div class="cutter beauty">
							<div class="img"><img src="resources/image/main/beauty.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 9. 컴퓨터 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox9');" style="position: absolute;">		
						<div class="cutter computer">
							<div class="img"><img src="resources/image/main/computer.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 10. 공무원 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox10');" style="position: absolute;">		
						<div class="cutter civil">
							<div class="img"><img src="resources/image/main/civil.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 11. 디자인/미술 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox11');" style="position: absolute;">		
						<div class="cutter art">
							<div class="img"><img src="resources/image/main/art.png"></div>
						</div>
					</div>
				</div>
				
				<!-- 12. 기타 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('cbox12');" style="position: absolute;">		
						<div class="cutter etc">
							<div class="img"><img src="resources/image/main/etc.png"></div>
						</div>
					</div>
				</div>
			<div class="clear"></div>
		</div>	
	
	   
	   <!-- 03. 광고  -->
	   <h1 style="margin-top: 230px">모임 공간</h1>
	   
	   <hr style="border: solid 1px #b3b3b3;">
	   	    <div class="more" align="right"><a href="/place/PlaceListAll">최근에 개설된 모임들입니다. 더 궁금하다면?</a></div>
	   <br>

   	   <div class="wrapper">
   	   		<%@include file="place/PlaceAll.jsp"%>			
   	   </div>
		
	   <br><br><br>		
	   <!-- hidden -->
	   <input type="hidden" name="guserId" value="${pdto.guserId}">
	   <input type="hidden" name="guserPw" value="${pdto.guserPw}">


   	   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   
   <!-- [Footer] 페이지 하단 (고정화면) -->
   <hr>
   <%@include file = "footer.jsp"%>
   </div>
   <br><br>
</body>
</html>