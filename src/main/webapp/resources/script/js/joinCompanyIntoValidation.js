/**
 *  [광고주] 회원가입 1단계 > 데이터 유효성 검사
 */

// [전체 함수 관리] 1단계 유효성 검사
function check_info1() {
	// 유효성 체크 함수들
	checkName();
	checkId();
	checkPw1();
	checkPw2();
	checkEmail();
	checkPhone();	
	
	// Form Id
	var data = document.getElementById('data');
	
	// 유효성에 적합한 값 입력 시, 2단계로 데이터 전송
	if(checkName() && checkId() && checkPw1() && checkPw2() && checkEmail() && checkPhone()) {
		var url = '/join/CompanyDataRegist';
		
		data.action = url;
		data.submit();
	}
		
}


// [Check_01] 이름 (중복 허용)
function checkName() {
	var name = document.getElementById('comManager').value;						// 이름 값
	var tempName = document.getElementById('comManager');
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
	
	var id = document.getElementById('comId').value;							// 아이디 값
	var tempId = document.getElementById('comId');
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
    var checkId = "comId=" + $("#comId").val();
        
    // Ajax: 비동기식 데이터 전송 방식 (URL 이동 없이 데이터만 확인해서 결과 출력 가능)
    // [참고 사이트] : http://marobiana.tistory.com/77
	$.ajax({
			type : "POST",														// 서버에 반환되는 데이터 타입
			data : checkId,														// 서버로 보낼 데이터
			dataType: "text",													// 받을 데이터 포맷 형식													
			url : "/join/checkDuplicateCompanyIdAjax",							// 정보 요청할 URL
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
			}/*, error : function(request, status, error){														// 에러가 어디서 발생했는지 무슨 에러인지 알려줌
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			// [참고 사이트] http://shonm.tistory.com/454
		    }*/
	});
    
	return true;
}


// [Check_03-1] 비밀번호
function checkPw1() {
	
	var pw = document.getElementById('comPw').value;							// 비밀번호 값
	var tempPw = document.getElementById('comPw');
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
	var isPW = /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

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
	
	var pw = document.getElementById('comPw').value;
	var pwCnf = document.getElementById('comPwConfirm').value;				// 비밀번호 재입력 값
	
	var tempPwCnf = document.getElementById('comPwConfirm');

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
	var email = document.getElementById('comEmail').value;					// 이메일 값
	var tempEmail = document.getElementById('comEmail');
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

	
// [Check_05] 기업 번호 혹은 핸드폰 번호
function checkPhone() {
	var phone = document.getElementById('comPhone').value;					// 휴대폰 번호 값
	var tempPhone = document.getElementById('comPhone');
	phone = phone.trim();														
	var oMsg = document.getElementById('mobileMsg');							
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(phone == "") {
		oMsg.style.display = "block";											
	    oMsg.className = "error";
		oMsg.innerHTML = "필수 정보입니다."
	
		return false;
	}	
	
	// [데이터 유효성 검사2] 회사 번호 혹은 핸드폰 번호
	var isPhone = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})?[0-9]{3,4}?[0-9]{4}$/;

    if (!isPhone.test(phone)) {
    	oMsg.style.display = "block";
        oMsg.className = "error";
        oMsg.innerHTML = "잘못된 전화번호입니다. '-'없이 숫자만 입력해주세요. 예) 010-XXXX-XXXX";
        document.getElementById("mobileMsg").style.color = "red";

        tempPhone.value = "";
        tempPhone.focus();
        
        return false;		
    } else {        
        oMsg.style.display = "none";
    }	
	
    return true;
}