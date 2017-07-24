<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입 > 개인/기업 선택 버튼</title>

<!-- CSS 임돠.. -->
<style type="text/css">   
	.container-c2 {
		height: 150px;
	}
	
	.container-c3 {
		height: 250px;
	}
	
	.button {
	    background-color: #4CAF50; /* Green */
	    /* border: none; */
	    border: 2px;
	    color: white;
	    padding: 50px 80px;
	    text-align: center;
	   /*  text-shadow: 2px 2px 2px gray; */
	    text-decoration: none;
	    display: inline-block;
	    font-size: 33px;
	    margin: 5px 2px;
	    -webkit-transition-duration: 0.4s; /* Safari */
	    transition-duration: 0.4s;
	    cursor: pointer;
	}
	
	/* #008CBA;  */
	.button1 {
	    background-color: white; 
	    color: #595959; 
	    border: 2px solid #4dc3ff;
	}
	
	.button1:hover {
	    background-color: #4dc3ff;
	    color: white;
	}
	
	.button2 {
	    background-color: white; 
	    color: #595959; 
	    border: 2px solid #66a3ff;;
	}
	
	.button2:hover {
	    background-color: #66a3ff;;
	    color: white; 	
	}
</style>

<!-- JavaScript -->
<script type="text/javascript">

	// [개인회원, 광고주(기업) 선택 ] Type별 해당 URL로 이동
	function JoinChoiceSubmit(type) {
		
		// 폼 안에 있는 데이터들 사용하려고 셋팅
		var bc = document.getElementById('joinChoiceFormData');		
		
		// "개인" 회원가입 폼 이동
		if(type == 1) {			
			// 개인회원 : value = A > 값 찍기
			var person = document.getElementById('person').value;
			
			//alert('[TEST-개인회원(A)] : '+ person); 			// A
   						
   			// 개인(person: A) / 기업(company: B) 
			var url = "/join/JoinChoiceCheck?person="+person;
			
		// "기업" 회원가입 폼 이동
		} /* else if (type == 2) {
			//var company = document.getElementById('company').value;
			var company = document.getElementByName('company').value;
			alert('[TEST-기업회원(B)] : ' + company);		// B
			
			var url = "/join/PersonInto";
			//var url = "#";
		}  */
		
		// 해당되는 url로 이동
		bc.action = url;
		bc.submit();		
	}
	
	
	// 개인회원, 광고주 선택 시 > 해당 URL로 이동
	/* function buttonClick(type) {
		// form 안에 있는 데이터들 사용
		var bc = document.getElementById("dataset");
		
		// type == 1 > 개인 회원가입 폼 이동
		var url = "/join/PersonInto";
		
		// type == 2 > 기업 회원가입 폼 이동
		if(type==2) {
			var url = "#";
		}
		
		// url로 이동
		bc.action = url;
		bc.submit();		
	} */
	
</script>

<!-- [Header] 공통 헤더 -->
<%@include file = "../header2.jsp"%>
</head>

<body>	
	
	<!-- [content] 회원가입 종류 선택 -->
	<div class="contianer">
		
		<div class="container-c2"></div>	
			
		<!-- 폼 가운데에 놓기 위해 디브추가함 -->
		<!-- 회원가입시 개인회원 기업회원 선택 버튼 -->
		<div class="container">
			<div class="clearfix">
				<div class="col-md-8 col-md-offset-2">
					<form action="" method="POST" id="joinChoiceFormData">
						<div class="spanClass" style="text-align: center;">
							<h2><span style= "color: #808080;">회원가입을 환영합니다.</span></h2>
							<br>
						</div>
							<br>
							<br>
						<div class="btnClass" style="text-align: center;">
							<button type="button" class="button button1" onclick="JoinChoiceSubmit(1)" id="person" value="A">개인회원</button>
							&nbsp;&nbsp;&nbsp; 
							<button type="button" class="button button2" onclick="JoinChoiceSubmit(2)" id="company" value="B">기업회원</button>
						</div>
					 	<br>
					</form>
				</div>
			</div>
			
			<div class="container-c3"></div>	
	
	
			<!-- 03. [Footer] 페이지 하단 (고정화면) -->
			<hr>
			<%@include file = "../footer.jsp"%>
			
		</div>
	</div>

</body>
</html>