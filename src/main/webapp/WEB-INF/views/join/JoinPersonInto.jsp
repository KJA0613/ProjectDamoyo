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

<title>개인회원가입-1단계</title>

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


<!-- [회원가입 - 데이터 유효성 검사] -->	
<!-- [참고 사이트] http://tonks.tistory.com/20 -->
<script>

// 1단계 유효성 전체 함수 관리
function check_info1() {
	// 유효성 체크 함수들
	checkName();
	checkId();
	checkPw1();
	checkPw2();
	checkEmail();
	checkPhone();	
	
	var data = document.getElementById('data');
	
	// 유효성에 적합한 값 입력 시, 2단계로 데이터 전송
	if(checkName() && checkId() && checkPw1() && checkPw2() && checkEmail() && checkPhone()) {
		var url = '/join/PersonDataRegist';
		
		data.action = url;
		data.submit();
	}
		
}

// [Check_01] 이름 (중복 허용)
function checkName() {
	var name = document.getElementById('guserName').value;						// 이름 값
	var tempName = document.getElementById('guserName');
	name = name.trim();															// 공백 제거
	var oMsg = document.getElementById('nameMsg');								// 보낼 에러 메세지
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(name == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."

		return false;
	}		
	
	
	// [데이터 유효성 검사2] 유효 문자 제한 (한글과 영문만 가능)
	//var isName = /^[0-9]*$/;
	var isName = /^[가-힣a-zA-Z]+$/;
	
	if(!isName.test(name)) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "한글과 영문 대/소문자를 사용하세요. (특수기호 사용 불가)";
        document.getElementById("nameMsg").style.color = "red";
        
        tempName.value = "";
        tempName.focus();
        
        return false;
	} else {
		oMsg.style.display = "none";											// 메세지 안 보여주기
	}

	return true;
}


// [Check_02] 아이디
function checkId() {
	
	var id = document.getElementById('guserId').value;							// 아이디 값
	var tempId = document.getElementById('guserId');
	id = id.trim();																
	var oMsg = document.getElementById('idMsg');								
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(id == "") {
		oMsg.style.display = "block";											// 메세지 보여주기
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;
	}
	
	
	// [데이터 유효성 검사2] 유효 문자 제한
	var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		
    if (!isID.test(id)) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        document.getElementById("idMsg").style.color = "red";
    
        return false;
    }
    
    
    // [데이터 유효성 검사3] DB에 아이디 있는지 여부 판단 
    var checkId = "guserId=" + $("#guserId").val();
        
    // Ajax: 비동기식 데이터 전송 방식 (URL 이동 없이 데이터만 확인해서 결과 출력 가능)
    // [참고 사이트] : http://marobiana.tistory.com/77
	$.ajax({
			type : "POST",														// 서버에 반환되는 데이터 타입
			data : checkId,														// 서버로 보낼 데이터
			dataType: "text",													// 받을 데이터 포맷 형식													
			url : "/join/checkDuplicatePersonIdAjax",							// 정보 요청할 URL
			success : function(result) {										// 요청 성공하면 실행될 콜백함수
				if (result == "OK") {
					oMsg.style.display = "block";
					oMsg.className = "error pass";
					oMsg.innerHTML = "멋진 아이디네요^^";
					document.getElementById("idMsg").style.color = "blue";
				} else {
					oMsg.className = "error";
					oMsg.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";
					document.getElementById("idMsg").style.color = "red";
					tempId.value = "";
					tempId.focus();
					
					return false;
				}
			}, error : function(request, status, error){														// 에러가 어디서 발생했는지 무슨 에러인지 알려줌
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			// [참고 사이트] http://shonm.tistory.com/454
		    }
	});
    
	return true;
}


// [Check_03-1] 비밀번호
function checkPw1() {
	
	var pw = document.getElementById('guserPw').value;							// 비밀번호 값
	var tempPw = document.getElementById('guserPw');
	pw = pw.trim();																
	var oMsg = document.getElementById('pwMsg1');								

	
	// [데이터 유효성 검사1] 입력여부 확인
	if(pw == "") {
		oMsg.style.display = "block";											
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
		
		return false;
	}
	
	
	// [데이터 유효성 검사2] 비밀번호 정규식
	var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;

	if (!isPW.test(pw)) {
		oMsg.style.display = "block";
	    oMsg.className = "error";
	    oMsg.innerHTML = "6~16자 영문 대/소문자, 숫자, 특수문자를 사용하세요.";
	    document.getElementById("pwMsg1").style.color = "red";
	        
	    tempEmail.value = "";
	    tempEmail.focus();
	    
	    return false;
	} else {
	   	oMsg.style.display = "none";
	}
	
	return true;
	 
}


//[Check_03-1] 비밀번호 재입력
function checkPw2() {	
	
	var pw = document.getElementById('guserPw').value;
	var pwCnf = document.getElementById('guserPwConfirm').value;				// 비밀번호 재입력 값
	
	var tempPwCnf = document.getElementById('guserPwConfirm');

	pw = pw.trim();
	pwCnf = pwCnf.trim();	
	
	var oMsg = document.getElementById('pwMsg2');								
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(pwCnf == "") {
		oMsg.style.display = "block";											
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;	
	}
	
	
	// [데이터 유효성 검사2] 비밀번호 값 VS 비밀번호 재입력 값 > 일치 여부 확인
	if(pw != pwCnf) {
		oMsg.style.display = "block";
	    oMsg.className = "error";
	    oMsg.innerHTML = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
	    document.getElementById("pwMsg2").style.color = "red";
	        
	    tempPwCnf.value = "";
	    tempPwCnf.focus();
	    
	    return false;
	} else {
	    oMsg.style.display = "none";
	}
	
	return true;
}


// [Check_04] 이메일
function checkEmail() {
	var email = document.getElementById('guserEmail').value;					// 이메일 값
	var tempEmail = document.getElementById('guserEmail');
	email = email.trim();														
	var oMsg = document.getElementById('emailMsg');								
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(email == "") {
		oMsg.style.display = "block";											
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;
	}	
	
	
	// [데이터 유효성 검사2] 이메일 정규식
	//var isEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var isHangeul = /[ㄱ-ㅎ가-힣]/g;			// 한글 입력 불가
	
	if (!isEmail.test(email) || isHangeul.test(email)) {
		oMsg.style.display = "block";
	    oMsg.className = "error";
	    oMsg.innerHTML = "@를 포함한 이메일 양식에 맞는 주소로 입력해주세요.";
	    document.getElementById("emailMsg").style.color = "red";
	        
	    tempEmail.value = "";
	    tempEmail.focus();
	    
	    return false;
	} else {
	    	oMsg.style.display = "none";
	}	
	
	return true;
}

	
// [Check_05] 휴대폰 번호
function checkPhone() {
	var phone = document.getElementById('guserPhone').value;					// 휴대폰 번호 값
	var tempPhone = document.getElementById('guserPhone');
	phone = phone.trim();														
	var oMsg = document.getElementById('mobileMsg');							
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(phone == "") {
		oMsg.style.display = "block";											
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;
	}	
	
	// [데이터 유효성 검사2] 숫자만 가능 (XXX-XXX-XXXX or XXX-XXXX-XXXX)
	var isPhone =  /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		
    if (!isPhone.test(phone)) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "실제 본인 휴대폰 번호만 입력 가능합니다.";
        document.getElementById("mobileMsg").style.color = "red";
        
        tempPhone.value = "";
        tempPhone.focus();
        
        return false;
    } else {
    	oMsg.style.display = "none";
    }		
	
    return true;
}


</script>


<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
<%@include file = "../header.jsp"%>

</head>

<body>
	<!-- [Content] 개인 회원가입 폼 내용부분 -->
	<div class="container">
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2 mbrRegist">	
				<h1>개인 회원가입</h1>				
				<!-- 도움말 -->
				<p class="help-block">
					&nbsp;<small>* [1단계] 회원님의 인적사항을 모두 입력해주세요.</small>
				</p>				
				<br>
						
				<!-- 폼 가운데에 놓기 위해 디브추가함-->
				<!-- 회원가입입력폼 : 1단계 -->
				<!-- onblur: 요소가 마우스나 키보드 등의 컨트롤러에 의해 포커스를 잃을 때 발생 -->
				<form action="" method="post" class="form-horizontal" id="data">
					
					<!-- 이름 -->
					<div class="form-group">
						<label for="Name" class="col-md-2 control-label">이름</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="guserName" name="guserName" maxlength="20" placeholder="이름(실명)" onblur="checkName()">
							<!-- 경고 메세지 -->
							<div id="nameMsg" class="error">
								<!-- 에러 메세지 적용되는 부분 -->
							</div>
						</div>
					</div>
					
					<!-- 아이디 -->
					<div class="form-group">
						<!-- 입력항목이름 -->
						<label for="Id" class="col-md-2 control-label">아이디</label>
			
						<div class="col-md-10">
							<!-- 입력칸크기 -->
							<input type="text" class="form-control" id="guserId" name="guserId" placeholder="아이디" onblur="checkId()">
							<!-- 경고 메세지 -->
							<div id="idMsg" class="error">
								<!-- 에러 메세지 출력 부분 -->
							</div>							
						</div>						
					</div>
					
					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="Password" class="col-md-2 control-label">비밀번호</label>
						<div class="col-md-10">
							<input type="password" class="form-control" id="guserPw" name="guserPw" placeholder="비밀번호" onblur="checkPw1()">
							<!-- 경고 메세지 -->
							<div id="pwMsg1" class="error"></div>
						</div>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="form-group">
						<label for="Password" class="col-md-2 control-label">비밀번호 확인</label>
						<div class="col-md-10">
							<input type="password" class="form-control" id="guserPwConfirm" name="guserPwConfirm" placeholder="비밀번호 재입력" onblur="checkPw2()">
							<!-- 경고 메세지 -->
							<div id="pwMsg2" class="error"></div>
						</div>
					</div>		
										
					<!-- 이메일 -->
					<div class="form-group">
						<label for="Email" class="col-md-2 control-label">이메일</label>
						<div class="col-md-10">
							<input type="email" class="form-control" id="guserEmail" name="guserEmail" placeholder="abc@gmail.com" onblur="checkEmail()">
							<!-- 경고 메세지 -->
							<div id="emailMsg" class="error"></div>
						</div>
					</div>
					
					<!-- 핸드폰 번호 -->
					<div class="form-group">
						<label for="Phone" class="col-md-2 control-label">휴대폰 번호</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="guserPhone" name="guserPhone" placeholder="01012345678" onblur="checkPhone()">
							<!-- 경고 메세지 -->
							<div id="mobileMsg" class="error"></div>
						</div>
					</div>
					
					<!-- 성별 -->
					<div class="form-group">
						<label for="Gender" class="col-md-2 control-label">성별</label>
						<div class="col-md-10">
							<div class="radio">
								<label><input type="radio" name="guserGender" value="W" checked="checked"> 여 </label> 
								&nbsp;&nbsp; <label><input type="radio" name="guserGender" value="M"> 남 </label>
							</div>
							<!-- 경고 메세지 -->
							<div id="sexMsg" class="error"></div>
						</div>
					</div>
					<hr>						

					<!-- 1단계 확인 버튼 -->
					<div class="clear-fix">
						<p class="pull-left">
							<small>
								DAMOYO 회원가입 총 2단계로 진행하고 있습니다.<br>
								2단계에서는 희망지역 및 카테고리 입력을 통해 추천 서비스를 제공합니다.<br>
							</small>
						</p>
						<div class="pull-right">
							<button type="submit" class="btn btn-primary" onclick="check_info1(); return false;">1단계 완료</button>
						</div>
					</div>
					
					<!-- [hidden] 사용자 코드값(개인: A, 기업: B) -->
					<input type="hidden" name="guserCode" value="${pdto.guserCode}">
					
				</form>
			</div>
		</div>
	
	
		<!-- [Footer] 페이지 하단 (고정화면) -->
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>