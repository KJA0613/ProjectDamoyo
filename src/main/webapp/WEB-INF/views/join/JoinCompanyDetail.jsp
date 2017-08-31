<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>기업회원가입-2단계</title>

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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('comZoneCode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('comRoadAddress').value = fullRoadAddr;
						document.getElementById('comJibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						/* if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						} */
					}
				}).open();
	}
</script>

<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
<%@include file = "../header2.jsp"%>

</head>

<body>
	<!-- [Content] 개인 회원가입 폼 내용부분 -->
	<div class="container">
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2 mbrRegist">	
				<h1>기업 회원가입</h1>				
				<!-- 도움말 -->
				<p class="help-block">
					&nbsp;<small>* [2단계] 기업의 상세정보를 모두 입력해주세요.</small>
				</p>				
				<br>
	
				<!-- onblur: 요소가 마우스나 키보드 등의 컨트롤러에 의해 포커스를 잃을 때 발생 -->
				<form action="" method="post" class="form-horizontal" id="dataSet">
					
					<!-- 기업명 -->
					<div class="form-group">
						<label for="Name" class="col-md-2 control-label">기업명</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="comName" name="comName" maxlength="20" placeholder="기업명" onblur="checkComName()">
							<!-- 경고 메세지 -->
							<div id="cnameMsg" class="error"></div>
						</div>
					</div>
					
					
					<!-- 대표명 -->
					<div class="form-group">
						<label for="Id" class="col-md-2 control-label">대표명</label>			
						<div class="col-md-10">
							<input type="text" class="form-control" id="comCeoName" name="comCeoName" placeholder="대표명" onblur="checkCeoName()">
							<div id="ceoNameMsg" class="error"></div>							
						</div>						
					</div>
					
					
					<!-- 사업자번호 -->
					<div class="form-group">
						<label for="comSaNo" class="col-md-2 control-label">사업자번호</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="comSaNo" name="comSaNo" placeholder="'-' 없이 입력" onblur="checkSaNo()">
							<div id="sanumMsg" class="error"></div>
						</div>						
					</div>
					
					
					<!-- 기업주소우편번호검색버튼 -->
					<div class="form-group">
						<label for="comJuNo" class="col-md-2 control-label">기업주소</label>
							<div class="col-md-10">
								<input type="button"class="btn btn-grey" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">								
							</div>
					</div>
					
					
					<!-- 기업주소우편번호노출창 -->
					<div class="form-group">					
						<label for="comZoneCode" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comZoneCode" name="comZoneCode" placeholder="우편번호" style="background: #FFFFFF" readonly="readonly" onclick="sample4_execDaumPostcode()" onblur="checkWooNo()">
							</div>
					</div>
					
					
					<!-- 선택된기업주소도로명 -->
					<div class="form-group">					
						<label for="comRoadAddress" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comRoadAddress" name="comRoadAddress" placeholder="도로명주소" style="background: #FFFFFF" readonly="readonly" onclick="sample4_execDaumPostcode()" onblur="checkDoro()"> 
							</div>
					</div>
					
					
					<!-- 선택된기업주소지번 -->
					<div class="form-group">					
						<label for="comJibunAddress" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comJibunAddress" name="comJibunAddress" placeholder="지번주소" style="background: #FFFFFF" readonly="readonly" onclick="sample4_execDaumPostcode()" onblur="checkJibun()">
							</div>
					</div>
					
					
					<!-- 기업주소상세정보입력 -->
					<div class="form-group">					
						<label for="comDetailAddress" class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="comDetailAddress" name="comDetailAddress" placeholder="상세주소를 입력해주세요" onblur="checkDetail()"> 
								<div id="detailMsg" class="error"></div>
							</div>
					</div>					
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
							<button type="submit" class="btn btn-primary" onclick="TwoSubmit(); return false;">완료</button>
						</div>
					</div>
					
					<!-- [hidden] 사용자 코드값(개인: A, 기업: B) -->
					<%-- <input type="hidden" name="comCode" value="${cdto.comCode}"> --%>
					
				</form>
			</div>
		</div>
	
	
		<!-- [회원가입 2단계 JS - 데이터 유효성 검사] -->	
		<script src="/resources/script/js/joinCompanyDetailValidation.js"></script>

		<!-- [Footer] 페이지 하단 (고정화면) -->
		<hr>
		<%@include file = "../footer.jsp"%>
		
	</div>

</body>
</html>