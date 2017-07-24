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

<!-- [Header] 공통 헤더 -->
<%@include file="header.jsp"%>

</head>

<body>
   <br><br><br>
   
   <!-- [Content] 내용 입력 -->
   <div class="container text-center">

	<form class="form-inline">
		<div class="input-group">
			<input type="text" class="form-control" size="50" placeholder="지역명을 작성해주세요." required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-primary">검색</button>
				</div>
		</div>
	</form>
	
	
	<br>
	<h1 class="page-header">주제</h1>
	<br>
	
	<form action="">
		<div class="row placeholders">
			<a href="/gather/gathering">
				<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="외국어" onclick="category_link(1)">
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="영어">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="음악/공연">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="라이프">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="취업">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="게임">&nbsp;&nbsp;
			
			<br><br><br><br>
			
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="스포츠">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="뷰티/미용">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="컴퓨터">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="공무원">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type= "button" style="WIDTH: 100pt; HEIGHT: 100pt; border: 2px; font-size: 22px;" value="디자인/미술">
	    </div>
	    
	    <!-- hidden -->
        <input type="hidden" name="guserId" value="${pdto.guserId}">
        <input type="hidden" name="guserPw" value="${pdto.guserPw}">
    </form> 
        
    <br><br><br>
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
             
   <%-- <div class="jumbotron">
         <br> <br> <br> <br> <br> <br>
         <h1 align="center">Welcome!</h1>
         <br>
         <p align="center">로그인 후 다모여의 다양한 서비스를 즐겨보세요!</p><br><br>

         <center><button type="button" class="btn btn-primary" onclick="location.href='' ">로그인하러가기</button></center>
      
         <div class="container c1">${dtoLogin.guserId}</div>
      </div> --%>


   <!-- 03. [Footer] 페이지 하단 (고정화면) -->
   <hr>
   <%@include file = "footer.jsp"%>
   
   </div>
   
</body>
</html>