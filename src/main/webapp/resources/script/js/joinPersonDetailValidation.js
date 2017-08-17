/**
 * [개인] 회원가입 2단계 > 데이터 유효성 검사
 */

function TwoSubmit() {

	// 처음 소스코드
	// document.signform.submit();

	// Form Id
	var data = document.getElementById('per');

	// 모임 희망지역1
	var a1 = document.getElementById('bigarea1');
	var valA1 = a1.options[a1.selectedIndex].value; // ''

	// 모임 희망지역2
	var a2 = document.getElementById('bigarea2');
	var valA2 = a2.options[a2.selectedIndex].value; // ''

	// 모임 희망지역3
	var a3 = document.getElementById('bigarea3');
	var valA3 = a3.options[a3.selectedIndex].value; // ''

	// 희망지역 미선택 > 제약조건
	if (valA1 == '' || valA2 == '' || valA3 == '') {
		alert('필수 항목입니다. 선택해주세요!!!');

		return false;
	}

	// 희망 카테고리1
	var c1_1 = document.getElementById('catTopOne');
	var valC1_1 = c1_1.options[c1_1.selectedIndex].value; // ''
	var c1_2 = document.getElementById('catMidOne');
	var valC1_2 = c1_2.options[c1_2.selectedIndex].value; // ''
	var c1_3 = document.getElementById('catBotOne');
	var valC1_3 = c1_3.options[c1_3.selectedIndex].value; // ''

	// 희망 카테고리2
	var c2_1 = document.getElementById('catTopTwo');
	var valC2_1 = c2_1.options[c2_1.selectedIndex].value;
	var c2_2 = document.getElementById('catMidTwo');
	var valC2_2 = c2_2.options[c2_2.selectedIndex].value;
	var c2_3 = document.getElementById('catBotTwo');
	var valC2_3 = c2_3.options[c2_3.selectedIndex].value;

	// 희망 카테고리3
	var c3_1 = document.getElementById('catTopThr');
	var valC3_1 = c3_1.options[c3_1.selectedIndex].value;
	var c3_2 = document.getElementById('catMidThr');
	var valC3_2 = c3_2.options[c3_2.selectedIndex].value;
	var c3_3 = document.getElementById('catBotThr');
	var valC3_3 = c3_3.options[c3_3.selectedIndex].value;

	// 희망카테고리 미선택 > 제약조건
	if (valC1_1 == '' || valC1_2 == '' || valC1_3 == '' || valC2_1 == '' || valC2_2 == '' || valC2_3 == '' || valC3_1 == '' || valC3_2 == '' || valC3_3 == '') {
		alert('필수 항목입니다. 선택해주세요!!!');

		return false;
	}

	// 카테고리 모두 선택 후, 회원가입 완료
	var url = '/join/PersonDatailRegist';

	data.action = url;
	data.submit();
}