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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- JQuery CDN -->	
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>로그인 폼 페이지</title>

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
</style>

<!-- JQuery -->
<script type="text/javascript">

	/* //01. [초기화] Input 태그에 입력한 내용 전체 초기화 시키기
	$(document).ready(function() {
		$('#btnReset').click(function() {
			$('#dataset').each(function() {
				// 입력 폼 데이터 전체 초기화
				this.reset();				
			});
		});		
	});
	 */
	// 02. [데이터 유효성 체크] 로그인 폼 > 아이디, 비밀번호 미입력 > 경고창 생성
   /*  $(document).ready(function() {
    	//test
		
    	
		$('#btnLogin').click(function() {			
			// tag.val() > 태그에 입력된 값 가져오기 (input 태그 안 > "id값"으로 가져옴)
			var guserId = $('#input_guserId').val();
			var guserPw = $('#input_guserPw').val();

			
			// 아이디 미입력 > 아이디 다시 입력하게 경고창 및 포커스두기
			if(guserId == '') {
				alert("아이디를 입력하세요");
				$('#guserId').focus();
				return false;
			}		
	
			// 패스워드 미입력 > 아이디 다시 입력하게 경고창 및 포커스두기
			if(guserPw == '') {
				alert('비밀번호를 입력하세요');
				$('#guserPw').focus();
				return false;			// 함수 종료
			} 	
			
			// 로그인 폼 입력한 ID, PW > 로그인 데이터 확인하는 URL로 전송
			// document.loginForm.action = "/member/PersonLogin";	
			
	

		});
	});		 */
	
	
  // [개인회원, 기업회원 선택 ] 

	function LoginChoiceSubmit(type) {

		// 폼 안에 있는 데이터들 사용하려고 셋팅
		// var lc = document.getElementById('dataset');   

		//if(event.keyCode == 13) {
		var guserId = $('#input_guserId').val();
		var guserPw = $('#input_guserPw').val();

		// 아이디 미입력 > 아이디 다시 입력하게 경고창 및 포커스두기
		if (guserId == '') {
			alert("아이디를 입력하세요");
			$('#guserId').focus();
			return false;
		}

		// 패스워드 미입력 > 아이디 다시 입력하게 경고창 및 포커스두기
		if (guserPw == '') {
			alert('비밀번호를 입력하세요');
			$('#guserPw').focus();
			return false; // 함수 종료
		}

		// 개인
		if (type.value === 'A') {
			// 개인회원 : value = A > 값 찍기
			//var person = document.getElementById('person').value;
			document.loginForm.action = "/member/PersonLogin";
			document.loginForm.submit();

		}
		
		// 광고주
		if (type.value === 'B') {
			//var company = document.getElementById('company').value;
			document.loginForm.action = "/member/CompanyLogin";
			document.loginForm.submit();
		}
		
		// 관리자
		if(type.value != 'A' && type.value != 'B') {
			document.loginForm.action = "/member/AdminLogin";
			document.loginForm.submit();
		}

	}
</script>

<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
<%@include file = "../header.jsp"%>
<%
	String temp = request.getHeader("referer");
%>

</head>

<body>

	<!-- 02. [Content] 로그인 폼 내용부분 -->
	<!-- [컨테이너2] -->
	<div class="container">
		<!-- clearfix: 어긋난 칼럼들 보정 -->
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2">								
				<!-- [에러 메세지] 로그인 미일치 -->
				<c:if test="${not empty loginErrorMsg}">
					<br>
					<div class="alert alert-danger">
						<div class="error">${loginErrorMsg}</div>
					</div>
				</c:if>
				<h1>로그인</h1>
				<br>
				
				<form method="POST" id="dataset" name="loginForm" onKeyPress="if(event.keyCode == 13) {LoginChoiceSubmit(guserCode);}">
					<div class="radio">
						<label><input type="radio" name="guserCode" value="A">개인회원</label>&nbsp;&nbsp;&nbsp;&nbsp;
					
						<label><input type="radio" name="guserCode" value="B" >기업회원</label>
						
						<!-- <label><input type="hidden" name="guserCode" value="Z">관리자</label> -->
					</div>
					
					<div class="form-group">
						<label for="guserId">아이디 입력 &nbsp;
							<small>
								<a href="/member/findID" tabindex="5">아이디를 찾으시나요?</a>
							</small>
						</label>
						<!-- tabindex: Tab 키 사용시, 포커스의 이동 순서를 임의로 조정 가능 -->
						<input type="text" id="input_guserId" name="guserId" class="form-control" placeholder="아이디를 입력하세요." tabindex="1" required>
					</div>
					<div class="form-group">
						<label for="guserPw">비밀번호 입력 &nbsp;
							<small>
								<a href="/member/findPW" tabindex="6">비밀번호를 찾으시나요?</a>
							</small>
						</label>
						<input type="password" id="input_guserPw" name="guserPw" class="form-control" placeholder="비밀번호를 입력하세요." tabindex="2" required>
						<input type="hidden" name="preURL" value=<%=temp%>/>
					</div>
					<br>	
					<div class="form-group pull-right">													
						<button type="button" class="btn btn-primary" onclick="LoginChoiceSubmit(guserCode)" id="btnLogin" tabindex="3">로그인</button>		<!-- 로그인 되면: 메인페이지로 이동(아이디 세션 유지) / 로그인 안 되면(Javascript 경고창) --> 
					</div>
					<br>
					<br>
					
					<!-- 회원가입 선택 페이지로 이동 -->
					<a href="/join/JoinChoiceForm" tabindex="4">처음 오셨나요? 지금 바로 회원가입을 하실 수  있습니다^^</a>	
				</form>
				
				
			</div>
		</div>
		
		
		<!-- 03. [Footer] 페이지 하단 -->
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>