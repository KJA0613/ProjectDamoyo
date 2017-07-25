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

<!-- 주제 이미지 효과 -->
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
	    width: 474px;
	    height: 41px;
	    border: 2px solid #40b4e5;
	    background: #fff;
	}
	.input_text {
	    margin: 11px 0 0 9px;
	    width: 405px;
	    height: 23px;
	    outline: 0;
	    border: 0;
	    background-color: transparent;
	    color: #000;
	    font-weight: 700;
	    font-size: 18px;
	    line-height: 23px;
	}

</style>

<!-- 주제별 URL -->
<script>
	function subject(type) {
		if(type == 'foreign') {
			document.location.href='gather/gathering';
		}	
	}
</script>

<!-- [Header] 공통 헤더 -->
<%@include file="header.jsp"%>

</head>

<body>
	<br><br><br> 
    <div class="container text-center">

    <!-- 01. 검색 -->
    <span class="blue_search">
    	<input type="text" title="검색어 입력" onclick="" class="input_text">
    </span>	
   <!--  <form class="form-inline">
		<div class="input-group">
			<input type="text" class="form-control" size="50" placeholder="지역명을 작성해주세요." required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-primary">검색</button>
				</div>
		</div>
	</form>	 -->
	<br><br><br>	

	<!-- 02. 주제  -->
	<h1 class="page-header">주제</h1>
	<br>
	
	<!-- 1행 -->
	<div class="images1">
			<!-- 1. 외국어 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('foreign');" style="position: absolute;">		
					<div class="cutter foreign">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>	<!-- #ABD8EB -->
					</div>
				</div>
			</div>
			
			<!-- 2. 영어 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('eng');" style="position: absolute;">		
					<div class="cutter eng">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 3. 음악/공연 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('music');" style="position: absolute;">		
					<div class="cutter music">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 4. 라이프 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('life');" style="position: absolute;">		
					<div class="cutter life">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 5. 취업 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('job');" style="position: absolute;">		
					<div class="cutter job">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 6. 게임 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('game');" style="position: absolute;">		
					<div class="cutter game">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
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
				<div class="boxm col1 masonry-brick" onclick="subject('sports');" style="position: absolute;">		
					<div class="cutter sports">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>	<!-- #ABD8EB -->
					</div>
				</div>
			</div>
			
			<!-- 8. 뷰티/미용 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('beauty');" style="position: absolute;">		
					<div class="cutter beauty">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 9. 컴퓨터 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('computer');" style="position: absolute;">		
					<div class="cutter computer">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 10. 공무원 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('life');" style="position: absolute;">		
					<div class="cutter life">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 11. 디자인/미술 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('art');" style="position: absolute;">		
					<div class="cutter art">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
			
			<!-- 12. 기타 -->
			<div class="col-md-2">
				<div class="boxm col1 masonry-brick" onclick="subject('etc');" style="position: absolute;">		
					<div class="cutter etc">
						<div class="img"><img src="resources/image/main/heart(1).png"></div>
					</div>
				</div>
			</div>
		<div class="clear"></div>
	</div>	


	<!-- hidden -->
    <input type="hidden" name="guserId" value="${pdto.guserId}">
    <input type="hidden" name="guserPw" value="${pdto.guserPw}">
           





    <br><br><br> <br><br><br>  <br><br><br>
	<h1 class="page-header">광고</h1>
    <div class="row">
            <div class="col-xs-6 col-lg-4">
              <h2>모아스터디</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>스프링 모임</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>토익 스피킹 뽀개기</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>기타 교실</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>독서 토론 모임</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>쿠아 카페</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
          </div><!--/row-->   
             



   <!-- [Footer] 페이지 하단 (고정화면) -->
   <hr>
   <%@include file = "footer.jsp"%>
   </div>
   <br><br>
</body>
</html>