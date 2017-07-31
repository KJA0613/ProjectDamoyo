<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>아이디 찾기 페이지</title>

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

.navbar .navbar-brand {
	color: #fff;
	font-size: 28px;
	font-weight: bold;
}

.navbar-inverse .navbar-nav>li>a {
	color: white;
}
</style>

<!-- JQuery -->
<script type="text/javascript">


	//비번찾기처음페이지로이동
	$(document).ready(function() {
		$('#btnReSearch').click(function() {

			document.findPWForm.action = "/member/findPW";
		});
	});

	// 로그인페이지로이동
	$(document).ready(function() {
		$('#btnfindPW').click(function() {

			document.findPWForm.action = "/member/LoginForm";
		});
	});
</script>

</head>

<body>

	<!-- 01.[Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
	<%@include file="../header2.jsp"%>


	<!-- 02. [Content] 로그인 폼 내용부분 -->
	<!-- [컨테이너2] -->
	<div class="container">
		<!-- clearfix: 어긋난 칼럼들 보정 -->
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2">
				<!-- loginErrorMsg : 서버에서 받은 값 -->
				<%-- <c:if test="${not empty dtoLogin}">
					<div class="alert alert-danger alertLoginError">
						<c:out value="${loginErrorMsg}"/>
					</div>
				</c:if>
				<c:out value="${loginErrorMsg}"/> --%>
				<h2>비밀번호찾기</h2>
				<br>

				<form action="" method="POST" id="dataset" name="findPWForm">

					<div class="form-group">
						<label for="guserName">아이디 입력 &nbsp;&nbsp; </label>
						<!-- tabindex: Tab 키 사용시, 포커스의 이동 순서를 임의로 조정 가능 -->
						<input type="text" id="input_guserId" name="guserId"
							class="form-control" placeholder="아이디를 입력하세요." tabindex="1">
					</div>
					<div class="form-group">
						<label for="guserEmail">이메일 입력 &nbsp;&nbsp; </label> <input
							type="text" id="input_guserEmail" name="guserEmail"
							class="form-control" placeholder="가입시 입력한 이메일 주소를 입력하세요."
							tabindex="2">
					</div>
					<br>
					<div class="form-group pull-right">
						<button type="submit" class="btn btn-default" id="btnReSearch"
							tabindex="7">다시찾기</button>
						<!-- 메인페이지로 이동 -->
						<button type="submit" class="btn btn-primary" id="btnfindPW"
							tabindex="3">로그인으로이동</button>
					</div>
					<br> <br><br>

					<div class="result">
				
					<c:choose>
							<c:when test="${empty pdto.guserId}and${empty cdto.comId}">
								<font size="4" color="#F15F5F">맞는 조건의 비밀번호가 없습니다. 다시 확인 해주세요.</font>
								<br>
							</c:when>
							 <c:otherwise>
								<font size="3" color="#F15F5F">회원님의 비밀번호가${pdto.guserEmail} ${cdto.comEmail}로 전송되었습니다.이메일을 확인 해주세요.</font>
								<br>
							</c:otherwise>
							
						</c:choose>

					</div> 
	
					<br>
					<!-- 회원가입 선택 페이지로 이동 -->
					<a href="/join/JoinChoiceForm" tabindex="4"> 처음 오셨나요? 지금 바로
						회원가입 하실 수 있습니다^^</a>
				</form>
			</div>
		</div>


		<!-- 03. [Footer] 페이지 하단 -->
		<hr>
		<%@include file="../footer.jsp"%>

	</div>

</body>
</html>