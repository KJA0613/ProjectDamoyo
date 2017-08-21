/**
 * [광고주] 회원가입 2단계 > 데이터 유효성 검사
 */

// [전체 함수 관리] 2단계 유효성 검사
function TwoSubmit() {
	// 유효성 체크 함수들
	checkComName();
	checkCeoName();
	checkSaNo();
	checkWooNo();
	checkDoro();
	checkJibun();
	checkDetail();
	
	// Form Id
	var dataSet = document.getElementById('dataSet');

	// 유효성에 적합한 값 입력 시, 회원가입 완료
	if(checkComName() && checkCeoName() && checkSaNo() && checkWooNo() && checkDoro() && checkJibun() && checkDetail()) {
		var url = '/join/CompanyDetailRegist';
		
		dataSet.action = url;
		dataSet.submit();
	}
}


// [Check_01] 회사이름
function checkComName() {
	var cName = document.getElementById('comName').value;						// 이름 값
	var tempCname = document.getElementById('comName');
	cName = cName.trim();														// 공백 제거
	var oMsg = document.getElementById('cnameMsg');								// 보낼 에러 메세지
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(cName == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."

		return false;
	}	 
	
	
	// [데이터 유효성 검사2] 유효 문자 제한 (한글과 영문만 가능)
	var isCName = /^[가-힣a-zA-Z]+$/;
	
	if(!isCName.test(cName)) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "한글과 영문 대/소문자를 사용하세요. (특수기호 사용 불가)";
        document.getElementById("cnameMsg").style.color = "red";
        
        tempCname.value = "";
        tempCname.focus();
        
        return false;
	} else {
		oMsg.style.display = "none";											// 메세지 안 보여주기
	} 
	
	return true;
}


// [Check_02] 사업자 이름 (중복 가능)
function checkCeoName() {
	var ceoName = document.getElementById('comCeoName').value;	
	var tempCeoName = document.getElementById('comCeoName');
	ceoName = ceoName.trim();														
	var oMsg = document.getElementById('ceoNameMsg');								
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(ceoName == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."

		return false;
	}
	
	
	// [데이터 유효성 검사2] 유효 문자 제한 (한글과 영문만 가능)
	var isCeoName = /^[가-힣a-zA-Z]+$/;
	
	if(!isCeoName.test(ceoName)) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "한글과 영문 대/소문자를 사용하세요. (특수기호 사용 불가)";
        document.getElementById("ceoNameMsg").style.color = "red";
        
        tempCeoName.value = "";
        tempCeoName.focus();
        
        return false;
	} else {
		oMsg.style.display = "none";											// 메세지 안 보여주기
	} 
	
	return true;
}


// [Check_03] 사업자번호
function checkSaNo() {
	var sano = document.getElementById('comSaNo').value;	
	var tempSano = document.getElementById('comSaNo');
	sano = sano.trim();														
	var oMsg = document.getElementById('sanumMsg');								
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(sano == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."

		return false;
	}
	
	
	// [데이터 유효성 검사2] 정확한 주소 검사 
	var isSano = /[0-9]{10}/;											// 숫자 0~9, 10자리
	
	isSano  =   0;
	isSano  +=  parseInt(sano.substring(0,1));
	isSano  +=  parseInt(sano.substring(1,2)) * 3 % 10;
	isSano  +=  parseInt(sano.substring(2,3)) * 7 % 10;
	isSano  +=  parseInt(sano.substring(3,4)) * 1 % 10;
	isSano  +=  parseInt(sano.substring(4,5)) * 3 % 10;
	isSano  +=  parseInt(sano.substring(5,6)) * 7 % 10;
	isSano  +=  parseInt(sano.substring(6,7)) * 1 % 10;
	isSano  +=  parseInt(sano.substring(7,8)) * 3 % 10;
	isSano  +=  Math.floor(parseInt(sano.substring(8,9)) * 5 / 10);
	isSano  +=  parseInt(sano.substring(8,9)) * 5 % 10;
	isSano  +=  parseInt(sano.substring(9,10));
	
	//if(!isSano.test(sano)) {
	if(isSano % 10  !=  0) {
		oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = " 올바르지 않은 사업자등록번호입니다.";
        document.getElementById("sanumMsg").style.color = "red";
        
        tempSano.value = "";
        tempSano.focus();
        
        return false;		
	} else {
		oMsg.style.display = "none";											
	}
	
	return true;
	
}


// [Check_04] 우편번호
function checkWooNo() {
	var woono = document.getElementById('comZoneCode').value;		
	var tempWoono = document.getElementById('comZoneCode');
	woono = woono.trim();														
	
	// [데이터 유효성 검사2] 정확한 주소 검사 >> JoinCompanyDetail.jsp에서 readonly="readonly"로 처리 + 클릭해야만 주소 입력 가능 (사전 방지)
	
	return true;
}


// [Check_05] 도로명 주소
function checkDoro() {
	var road = document.getElementById('comRoadAddress').value;	
	var tempRoad = document.getElementById('comRoadAddress');
	road = road.trim();														
	var oMsg = document.getElementById('detailMsg');								
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(road == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다. (상세주소 제외)"

		return false;
	}
	
	// [데이터 유효성 검사2] 정확한 주소 검사 >> JoinCompanyDetail.jsp에서 readonly="readonly"로 처리 + 클릭해야만 주소 입력 가능 (사전 방지)
	
	return true;	
}


// [Check_06] 지번 주소
function checkJibun() {
	var jibun = document.getElementById('comJibunAddress').value;		
	//alert("지번: " + jibun);
	var tempJibun = document.getElementById('comJibunAddress');
	jibun = jibun.trim();														
	var oMsg = document.getElementById('detailMsg');								
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(jibun == "") {
		oMsg.style.display = "block";
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다. (상세주소 제외)"

		return false;
	}
	
	// [데이터 유효성 검사2] 정확한 주소 검사 >> JoinCompanyDetail.jsp에서 readonly="readonly"로 처리 + 클릭해야만 주소 입력 가능 (사전 방지)
	
	return true;
}
	

// [Check_07] 상세 주소
function checkDetail() {
	var detail = document.getElementById('comDetailAddress').value;
	var tempDetail = document.getElementById('comDetailAddress');
	detail = detail.trim();														
	
	return true;	
}