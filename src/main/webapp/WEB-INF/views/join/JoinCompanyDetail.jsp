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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('comZoneCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('comRoadAddress').value = fullRoadAddr;
                document.getElementById('comJibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

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
					&nbsp;<small>* [2단계] 기업의 상세정보를 모두 입력해주세요.</small>
				</p>				
				<br>
						
				<!-- 폼 가운데에 놓기 위해 디브추가함-->
				<!-- 회원가입입력폼 : 1단계 -->
				<!-- onblur: 요소가 마우스나 키보드 등의 컨트롤러에 의해 포커스를 잃을 때 발생 -->
				<form action="/join/CompanyDetailRegist" method="post" class="form-horizontal">
					
					<!-- 기업명 -->
					<div class="form-group">
						<label for="Name" class="col-md-2 control-label">기업명</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="comName" name="comName" maxlength="20" placeholder="기업명" onblur="checkName()">
							
						</div>
					</div>
					
				
					<div class="form-group">
						<!-- 입력항목이름 -->
						<label for="Id" class="col-md-2 control-label">대표명</label>
			
						<div class="col-md-10">
							<!-- 입력칸크기 -->
							<input type="text" class="form-control" id="comCeoName" name="comCeoName" placeholder="대표명" onblur="checkId()">
														
						</div>						
					</div>
					
					<!-- 사업자번호 -->
					<div class="form-group">
						<label for="comSaNo" class="col-md-2 control-label">사업자번호</label>
						<div class="col-md-10">
							<input type="text" class="form-control" name="comSaNo" placeholder="사업자번호">
						</div>
						
					</div>
					
					<!-- 기업주소우편번호검색버튼 -->
					<div class="form-group">
						<label for="comJuNo" class="col-md-2 control-label">기업주소</label>
							<div class="col-md-10">
								<input type="button"class="btn btn-grey" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">								
									</div></div>
					
					<!-- 기업주소우편번호노출창 -->
					<div class="form-group">					
						<label for="comZoneCode" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comZoneCode" name="comZoneCode" placeholder="우편번호">
									</div></div>
					
					<!-- 선택된기업주소도로명 -->
					<div class="form-group">					
						<label for="comRoadAddress" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comRoadAddress" name="comRoadAddress" placeholder="도로명주소"> 
									</div></div>
					
					<!-- 선택된기업주소지번 -->
					<div class="form-group">					
						<label for="comJibunAddress" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comJibunAddress" name="comJibunAddress" placeholder="지번주소">
									</div></div>
					
					<!-- 기업주소상세정보입력 -->
					<div class="form-group">					
						<label for="comDetailAddress" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="ComDetailAddress" name="comDetailAddress" placeholder="상세주소를입력해주세요"> 
									</div></div>
					
					<hr>						

					<!-- 2단계 확인 버튼 -->
					<div class="clear-fix">
						<p class="pull-left">
							<small>
								DAMOYO 회원가입은 총 2단계로 진행하고 있습니다.<br>
								2단계에서는 기업의 상세 정보를 제공받고 있습니다.<br>
							</small>
						</p>
						<div class="pull-right">
							<button type="submit" class="btn btn-primary">완료</button>
						</div>
					</div>
					
					<!-- [hidden] 사용자 코드값(개인: A, 기업: B) -->
					<%-- <input type="hidden" name="comCode" value="${cdto.comCode}"> --%>
					
				</form>
			</div>
		</div>
	
	
		<!-- [Footer] 페이지 하단 (고정화면) -->
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>