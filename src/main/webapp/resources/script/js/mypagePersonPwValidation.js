/**
 *  [개인] 마이페이지 - 비밀번호 수정 > 데이터 유효성 검사
 */

// 현재 비밀번호
function checkPwDB() {
	var pwCur = document.getElementById('guserCurPw').value;							
	var tempPwCur = document.getElementById('guserCurPw');
	pwCur = pwCur.trim();																
	var oMsg = document.getElementById('pwDBMsg');								
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(pwCur == "") {
		oMsg.style.display = "block";												
	    oMsg.className = "error";
		oMsg.innerHTML = "현재 비밀번호를 입력해주세요."
	
		return false;
	}
	
	
	// [데이터 유효성 검사2] 비밀번호 정규식
	var isPwCur = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;

	if (!isPwCur.test(pwCur)) {
		oMsg.style.display = "block";
	    oMsg.className = "error";
	    oMsg.innerHTML = "6~16자 영문 대/소문자, 숫자, 특수문자를 사용하세요.";
	    document.getElementById("pwDBMsg").style.color = "red";
	        
	    tempPwCur.value = "";
	    tempPwCur.focus();
	    
	    return false;
	} else {
	   	oMsg.style.display = "none";
	}
    
	
    // [데이터 유효성 검사3] DB에 비밀번호 유무 판단 
    var checkPwCur = "guserPw=" + $("#guserCurPw").val(); 
    //alert('[TEST] 입력한 비밀번호: ' + checkPwDB);
        
	$.ajax({
			type : "POST",															// 서버에 반환되는 데이터 타입
			data : checkPwCur,														// 서버로 보낼 데이터
			dataType: "text",														// 받을 데이터 포맷 형식													
			url : "/mypage/checkDuplicatePersonPwAjax",								// 정보 요청할 URL
			success : function(result) {											// 요청 성공하면 실행될 콜백함수
				if (result == "OK") {
					oMsg.style.display = "block";
					oMsg.className = "error";
					oMsg.innerHTML = "입력하신 비밀번호가 현재 비밀번호와 일치합니다.^^";
					document.getElementById("pwDBMsg").style.color = "blue";
				} else {
					oMsg.style.display = "block";
					oMsg.className = "error";
					oMsg.innerHTML = "입력하신 비밀번호가 현재 비밀번호와 일치하지 않습니다.";
					document.getElementById("pwDBMsg").style.color = "red";
					tempPwCur.value = "";
					tempPwCur.focus();
					
					return false;
				}	
			}, error : function(request, status, error) {															// 에러가 어디서 발생했는지 무슨 에러인지 알려줌
		     	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			// [참고 사이트] http://shonm.tistory.com/454
		    }
	});
    
	return true;
}
	
	
// 새 비밀번호
function checkPwNew() {
	var pwNew = document.getElementById('guserNewPw').value;							
	var tempPwNew = document.getElementById('guserNewPw');
	pwNew = pwNew.trim();																
	var oMsg = document.getElementById('pwNewMsg');								
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(pwNew == "") {
		oMsg.style.display = "block";												
	    oMsg.className = "error";
		oMsg.innerHTML = "새로운 비밀번호를 입력해주세요."
	
		return false;
	}
	
	
	// [데이터 유효성 검사2] 비밀번호 정규식
	var isPwNew = /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	if (!isPwNew.test(pwNew)) {
		oMsg.style.display = "block";
	    oMsg.className = "error";
	    oMsg.innerHTML = "6~16자 영문 대/소문자, 숫자, 특수문자를 사용하세요.";
	    document.getElementById("pwNewMsg").style.color = "red";
	        
	    tempPwNew.value = "";
	    tempPwNew.focus();
	    
	    return false;
	} else {
	   	oMsg.style.display = "none";
	}	
	
	return true;
}


// 새 비밀번호 == 재입력 비밀번호
function checkPwNewRe() {
	var pwNew = document.getElementById('guserNewPw').value;	
	var pwNewRe = document.getElementById('guserNewPwCheck').value;
	
	var temppwNewRe = document.getElementById('guserNewPwCheck');
	
	pwNew = pwNew.trim();	
	pwNewRe = pwNewRe.trim();
	
	var oMsg = document.getElementById('pwNewReMsg');
	
	
	// [데이터 유효성 검사1] 입력여부 확인
	if(pwNewRe == "") {
		oMsg.style.display = "block";											
	    oMsg.className = "error";
		oMsg.innerHTML = "새로운 비밀번호를 재입력해주세요."
	
		return false;	
	}
	
	// [데이터 유효성 검사2] 비밀번호 값 VS 비밀번호 재입력 값 > 일치 여부 확인
	if(pwNew != pwNewRe) {
		oMsg.style.display = "block";
	    oMsg.className = "error";
	    oMsg.innerHTML = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
	    document.getElementById("pwNewReMsg").style.color = "red";
	        
	    temppwNewRe.value = "";
	    temppwNewRe.focus();
	    
	    return false;
	} else {
	    oMsg.style.display = "none";
	}
	
	return true;	
}