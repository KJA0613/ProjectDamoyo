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
<script>

// [Check] Caps Lock


// [Check_01] 이름
function checkName() {
	var name = document.getElementById('comManager').value;		// 이름 값
	name = name.trim();											// 공백 제거
	var oMsg = document.getElementById('nameMsg');				// 보낼 에러 메세지
	
	if(name == "") {
		//oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;
	}		
}


// [Check_02] 아이디
function checkId(result) {
	
	// [데이터 유효성 검사1] 입력여부 확인
	var id = document.getElementById('comId').value;			// 아이디 값
	id = id.trim();												// 공백 제거
	var oMsg = document.getElementById('idMsg');				// 보낼 에러 메세지
	
	if(id == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;
	}
	
	// [데이터 유효성 검사2] 비밀번호 입력값 확인
	var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	
    if (!isID.test(id)) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
    
        return false;
    }
    
    // [데이터 유효성 검사3] DB에 아이디 있는지 여부 판단 
    // 서버에 보낼 데이터
    var checkId = "comId=" + $("#comId").val();
        
    // Ajax: 비동기식 데이터 전송 방식 (URL 이동 없이 데이터만 확인해서 결과 출력 가능)
    // [참고 사이트] : http://marobiana.tistory.com/77
	$.ajax({
			type : "POST",														// 서버에 반환되는 데이터 타입
			data : checkId,														// 서버로 보낼 데이터
			dataType: "JSON",													// 받을 데이터 포맷 형식													
			url : "/join/checkDuplicatePersonIdAjax",							// 정보 요청할 URL
			success : function(result) {										// 요청 성공하면 실행될 콜백함수
				console.log(result);
			
				if (result == "OK") {
					//document.getElementById("idcheck").innerHTML="사용가능";
					//alert(result);
					Msg.className = "error gm";
					oMsg.innerHTML = "멋진 아이디네요!";
					document.getElementById("comId").style.color = "blue";
				} else {
					//document.getElementById("idcheck").innerHTML="중복된아이디";
					//document.getElementById("idcheck").style.color="red";
					Msg.className = "error";
					oMsg.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";
					id.value = "";
					id.focus();
				}
			},error : function() {
				alert("통신오류가 발생하였습니다. 재시도 해주세요");
			}
	});
}

	
</script>

<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            }
        }).open();
    });
</script>

<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
<%@include file = "../header2.jsp"%>

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
					&nbsp;<small>* [2단계] 기업의 상세정보를 모두 입력해주세요.</small>
				</p>				
				<br>
						
				<!-- 폼 가운데에 놓기 위해 디브추가함-->
				<!-- 회원가입입력폼 : 1단계 -->
				<!-- onblur: 요소가 마우스나 키보드 등의 컨트롤러에 의해 포커스를 잃을 때 발생 -->
				<form action="/join/CompanyDataRegist" method="post" class="form-horizontal">
					
					<!-- 기업명 -->
					<div class="form-group">
						<label for="Name" class="col-md-2 control-label">기업명</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="comName" name="comName" maxlength="20" placeholder="기업명" onblur="checkName()">
							<!-- 경고 메세지 -->
							<div id="nameMsg" class="error">
								<!-- 에러 메세지 적용되는 부분 -->
							</div>
						</div>
					</div>
					
					<!-- 아이디 -->
					<div class="form-group">
						<!-- 입력항목이름 -->
						<label for="Id" class="col-md-2 control-label">대표명</label>
			
						<div class="col-md-10">
							<!-- 입력칸크기 -->
							<input type="text" class="form-control" id="comCeoName" name="comCeoName" placeholder="대표명" onblur="checkId()">
							<!-- 경고 메세지 -->
							<div id="idMsg" class="error">
								<!-- 에러 메세지 적용되는 부분 -->
							</div>
							<div id="idMsg" class="error gm">
								<!-- 에러 메세지 적용되는 부분 -->
							</div>		
							
						</div>						
					</div>
					
					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="comSaNo" class="col-md-2 control-label">사업자번호</label>
						<div class="col-md-10">
							<input type="text" class="form-control" name="comSaNo" placeholder="사업자번호">
						</div>
						<!-- 경고 메세지 -->
						<div id="pwMsg" class="error"></div>
					</div>
					
					
						<!-- 경고 메세지 -->
						<div id="mobileMsg" class="error"></div>
				
					
				
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
							<button type="submit" class="btn btn-primary">1단계 완료</button>
						</div>
					</div>
					
					<!-- [hidden] 사용자 코드값(개인: A, 기업: B) -->
					<input type="hidden" name="comCode" value="${cdto.comCode}">
					
				</form>
			</div>
		</div>
	
	
		<!-- [Footer] 페이지 하단 (고정화면) -->
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>