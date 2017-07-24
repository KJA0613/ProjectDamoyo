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

<title>비밀번호 찾기 페이지</title>

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

	// 02. [데이터 유효성 체크] 로그인 폼 > 아이디, 비밀번호 미입력 > 경고창 생성
    $(document).ready(function() {
		$('#btnfindPW').click(function() {			
			// tag.val() > 태그에 입력된 값 가져오기 (input 태그 안 > "id값"으로 가져옴)
			/* var guserId = $('#input_guserId').val();
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
			} 	 */
			
			//alert('[TEST-로그인] 아이디/비밀번호: ' + guserId + ' / ' + guserPw);
			
			// 로그인 폼 입력한 ID, PW > 로그인 데이터 확인하는 URL로 전송
			document.findPwForm.action = "/member/sendEmailAction";	
		});
	});		
    
</script>

</head>

<body>

	<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
	<%@include file = "../header2.jsp"%>


	<!-- [Content] 로그인 폼 내용부분 -->
	<!-- [컨테이너2] -->
	<div class="container">
		<!-- clearfix: 어긋난 칼럼들 보정 -->
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2">				
				<h1>비밀번호 찾기</h1>
				<br>
				<form action="" method="POST" id="dataset" name="findPwForm">
					<div class="form-group">
						<label for="guserName">아이디 입력 &nbsp;&nbsp;
							
						</label>
						<!-- tabindex: Tab 키 사용시, 포커스의 이동 순서를 임의로 조정 가능 -->
						<input type="text" id="input_guserId" name="guserId" class="form-control" placeholder="아이디를 입력하세요." tabindex="1" required>
					</div>
					<div class="form-group">
						<label for="guserEmail">이메일 입력 &nbsp;&nbsp;
							
						</label>
						<input type="text" id="input_guserEmail" name="guserEmail" class="form-control" placeholder="가입시 입력한 이메일 주소를 입력하세요." tabindex="2" required>
					</div>
					<br>	
					<div class="form-group pull-right">					
						<button type="submit" class="btn btn-primary" id="btnfindPW" tabindex="3">비밀번호찾기</button>		
					</div>
					<br>
					<br>
					
					<!-- 회원가입 선택 페이지로 이동 -->
					<a href="/join/JoinChoiceForm" tabindex="4"> 처음 오셨나요? 지금 바로 회원가입 하실 수  있습니다^^</a>	
				</form>
			
			</div>
		</div>
	
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>