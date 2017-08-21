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
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- JQuery CDN -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>기업회원가입-1단계</title>

<!-- 헤더 폼 CSS -->
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

a {
	color: #3498db;
}
</style>

<!-- 경고 메세지 CSS -->
<style type="text/css">
.gm {
	padding-top: 8px;
	color: #39f;	
}

.error {
	padding-top: 8px;
	color: #e51e1f;
}
</style>


<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
<%@include file = "../header.jsp"%>

</head>

<body>
	<!-- [Content] 개인 회원가입 폼 내용부분 -->
	<div class="container">
		<!-- clearfix: 어긋난 칼럼들 보정 -->
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2 mbrRegist">	
				<h1>기업 회원가입</h1>				
				<!-- 도움말 -->
				<p class="help-block">
					&nbsp;<small>* [1단계] 담당자님의 인적사항을 모두 입력해주세요.</small>
				</p>				
				<br>
						
				<!-- 폼 가운데에 놓기 위해 디브추가함-->
				<!-- 회원가입입력폼 : 1단계 -->
				<!-- onblur: 요소가 마우스나 키보드 등의 컨트롤러에 의해 포커스를 잃을 때 발생 -->
				<form action="" method="post" class="form-horizontal" id="data">
					
					<!-- 이름 -->
					<div class="form-group">
						<label for="Name" class="col-md-2 control-label">담당자명</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="comManager" name="comManager" maxlength="20" placeholder="이름(실명)" onblur="checkName()">
							<!-- 경고 메세지 -->
							<div id="nameMsg" class="error">
							<!-- 에러 메세지 적용되는 부분 -->
							</div>
						</div>
					</div>
					
					<!-- 아이디 -->
					<div class="form-group">
						<!-- 입력항목이름 -->
						<label for="Id" class="col-md-2 control-label">기업아이디</label>
			
						<div class="col-md-10">
							<!-- 입력칸크기 -->
							<input type="text" class="form-control" id="comId" name="comId" placeholder="아이디" onblur="checkId()">
							<!-- 경고 메세지 -->
							<div id="idMsg" class="error"></div>							
						</div>						
					</div>
					
					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="Password" class="col-md-2 control-label">비밀번호</label>
						<div class="col-md-10">
							<input type="password" class="form-control" id="comPw" name="comPw" placeholder="비밀번호" onblur="checkPw1()">
							<!-- 경고 메세지 -->
							<div id="pwMsg1" class="error"></div>
						</div>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="form-group">
						<label for="Password" class="col-md-2 control-label">비밀번호 확인</label>
						<div class="col-md-10">
							<input type="password" class="form-control" id="comPwConfirm" name="comPwConfirm" placeholder="비밀번호 재입력" onblur="checkPw2()">
							<!-- 경고 메세지 -->
							<div id="pwMsg2" class="error"></div>
						</div>
					</div>		
										
					<!-- 이메일 -->
					<div class="form-group">
						<label for="Email" class="col-md-2 control-label">이메일</label>
						<div class="col-md-10">
							<input type="email" class="form-control" id="comEmail" name="comEmail" placeholder="abc@gmail.com" onblur="checkEmail()">
							<!-- 경고 메세지 -->
							<div id="emailMsg" class="error"></div>
						</div>
					</div>
					
					<!-- 기업연락처 -->
					<div class="form-group">
						<label for="Phone" class="col-md-2 control-label">연락처</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="comPhone" name="comPhone" placeholder="기업 또는 담당자의 연락처 ('-' 없이 입력)" onblur="checkPhone()">
							<!-- 경고 메세지 -->
							<div id="mobileMsg" class="error"></div>
						</div>
					</div>
					
				
					<hr>						

					<!-- 1단계 확인 버튼 -->
					<div class="clear-fix">
						<p class="pull-left">
							<small>
								DAMOYO 회원가입은 총 2단계로 진행하고 있습니다.<br>
								2단계에서는 기업의 상세 정보를 제공받고 있습니다.<br>
							</small>
						</p>
						<div class="pull-right">
							<!-- return=false > 기본 속성 무시
							     check_info1() 함수에서 데이터 유효성 만족하면 페이지 넘어가는걸로 만듬 -->
							<button type="submit" class="btn btn-primary" onclick="check_info1(); return false;">1단계 완료</button>
						</div>
					</div>
					
					<!-- [hidden] 사용자 코드값(개인: A, 기업: B) -->
					<input type="hidden" name="comCode" value="B">
					
				</form>
			</div>
		</div>
	
	
		<!-- [회원가입(기업) 1단계 JS - 데이터 유효성 검사] -->	
		<script src="/resources/script/js/joinCompanyIntoValidation.js"></script>
	
		<!-- [Footer] 페이지 하단 (고정화면) -->
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>