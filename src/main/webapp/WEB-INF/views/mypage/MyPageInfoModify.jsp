<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery CDN -->	
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>회원 정보 수정</title>

<!-- [TEST] CSS (2차: resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
	table {
		margin-left: 10px;
		text-align: center;
	}
	
	th {
		text-align: center;
	}

	#guserId {
		font-weight: bold;
	}
</style>

<script type="text/javascript">
	
	// 한 페이지 안에서 > 폼 번호에 따라 각각 다른 경로로 폼 3개에 해당하는 데이터 전송
	function form_link(formNum) {
		
		if(formNum == 1) {			
			// 개인정보 수정
			document.form1.action = "/mypage/PersonFirstModify";		// 폼 name으로 접근
			document.form1.submit();			
			
		} else if (formNum == 2) {
			// 비밀번호 변경
			document.form2.action = "/mypage/PersonPwModify";
			document.form2.submit();
			
		} else if (formNum == 3) {
			// 입력값이 없을 경우 > 경고창			
			
			// 회원 탈퇴
			document.form3.action = "/mypage/PersonQuit";
			document.form3.submit();
		}
		
	}

</script>

<!-- 왼쪽 메뉴바 클릭시, 해당 페이지 보이게하기 -->
<script>
   $('.nav-pills').scrollingTabs(); 
</script>

</head>
<body>
	<!-- 참고 사이트: https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_tabs_dynamic&stacked=h -->
	<!-- 가로 탭 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#menu1" data-toggle="tab">개인정보수정</a></li>
		<li><a href="#menu2" data-toggle="tab">비밀번호 변경</a></li>
		<li><a href="#menu3" data-toggle="tab">회원탈퇴</a></li>
	</ul>

	<!--////////// Tab1, Tab2, Tab3 > 해당되는 내용 //////////-->
	<div class="tab-content">

		<!--///// 1-1. 회원정보관리 > 개인정보수정(현재 비밀번호 확인 > 회원가입 때, 입력한 내용 가져오기) /////-->
		<div id="menu1" class="tab-pane fade in active">
			<br>
			<div id="changeMyInfo" class="tab-pane fade active in">
				<!-- 참고 사이트: https://www.w3schools.com/bootstrap/bootstrap_panels.asp -->
				<!-- panel: 콘텐츠가 있는 박스 형태의 구성요소를 만들 때 사용 -->
				<div class="panel panel-default">
					<!--/// 제목 ///-->
					<div class="panel-heading">
						<h4><strong>비밀번호 확인</strong></h4>						
					</div>
					<!--/// 내용 ///-->
					<div class="panel-body">
						<!-- 도움말 -->
						<p class="help-block">
							&nbsp;<small>* 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</small>
						</p>
						<br>
						<form action="" method="POST" class="form-horizontal" id="infoChangeForm" name="form1" onsubmit="return false;">
							<!-- 아이디 입력 -->
							<div class="form-group">
								<label for="guserId" class="control-label col-md-2">아이디 </label>
								<div class="col-md-8">		
									<input type="text" class="form-control" name="guserId" id="guserId" value="${pdto.guserId}${cdto.comId}" disabled>
								</div>
							</div>
							
							<!-- 비밀번호 입력 -->
							<div class="form-group">
								<label for="guserPw" class="control-label col-md-2">비밀번호 </label>
								<div class="col-md-8">
									<input type="password" class="form-control" id="guserPw" name="guserInfoPw" placeholder="비밀번호를 입력하세요." required>
								</div>
							</div>
							
							<br>
							<div class="clearfix">
								<button type="submit" class="btn btn-danger pull-right" onclick="form_link(1)">확 인</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>


		<!--///// 1-2. 회원정보관리 > 개인정보수정(현재 비밀번호 변경) /////-->
		<div id="menu2" class="tab-pane fade">
			<br>
			<div id="changePassword" class="tab-pane fade active in">
				<!-- 참고 사이트: https://www.w3schools.com/bootstrap/bootstrap_panels.asp -->
				<!-- panel: 콘텐츠가 있는 박스 형태의 구성요소를 만들 때 사용 -->
				<div class="panel panel-default">
					<!--/// 제목 ///-->
					<div class="panel-heading">
						<h4>
							<strong>비밀번호 변경</strong>
						</h4>
					</div>
					<!--/// 내용 ///-->
					<div class="panel-body">					
						<!-- [비밀번호수정 폼] --> 
						<!-- onsubmit="return false;": Enter키를 통해 form 객체의 Submit 방지 -->
						<form action="" method="POST" class="col-md-12" id="passwordForm" name="form2" onsubmit="return false;">
							<div class="form-group">
								<label for="currentPasswordInput">현재 비밀번호</label>
								<input type="password" class="form-control" id="currentPwInput" name="guserCurPw" placeholder="현재 비밀번호를 입력하세요." required>
							</div>
							<div class="form-group">
								<label for="newPasswordInput">새로운 비밀번호</label>
								<input type="password" class="form-control" id="newPwInput" name="guserNewPw" placeholder="새로운 비밀번호를 입력하세요." required>
								<!-- 도움말 -->
								<p class="help-block">
									&nbsp;<small>* 6~32자의 영문 대/소문자, 숫자, 특수문자 혼용 가능</small>
								</p>
							</div>
							<div class="form-group">
								<label for="newPasswordCheckInput">새로운 비밀번호 확인</label>
								<input type="password" class="form-control" id="newPwCheckInput" name="guserNewPwCheck" placeholder="새로운 비밀번호를 재입력하세요." required>
							</div>
							<br>
							<div class="clearfix">
								<button type="submit" class="btn btn-danger pull-right" id="pwChange" onclick="form_link(2)">비밀번호 변경</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!--///// 1-3. 회원정보관리 > 개인정보수정(회원 탈퇴)  /////-->
		<div id="menu3" class="tab-pane fade">
			<br>
			<div id="exit" class="panel panel-default">
				<!--/// 제목 ///-->
				<div class="panel-heading">
					<h4>
						<strong>회원님의 모든 자료가 삭제됩니다.</strong>
					</h4>
				</div>

				<!--/// 내용 ///-->
				<div class="panel-body">
					<div class="col-md-12">
						<h4>※ 지금까지 이용해주셔서 감사 드립니다. 탈퇴하기 전, 아래 유의사항을 확인해주세요!!!</h4>
						<ul class="list-unstyled">
							<li><small>* 현재 사용자의 <span style="color: red">계정정보가 모두 삭제</span>됩니다.</small></li>
							<li><small>* 현재 사용자의 <span style="color: red">업로드된 이미지 및 데이터들이 모두 삭제</span>됩니다.	</small></li>
							<li><small>* 그동안 작업한 모든 모임과 데이터들도 삭제되며, 
								<span style="color: red">복구가 불가능</span>합니다.</small>
							</li>
						</ul>
						<hr>

						<!-- [회원탈퇴 폼] 아이디: 받아오기 / 패스워드: 패스워드 확인 코드 넣기(자바스크립트) -->
						<!-- <form action="/PersonDelete" method="POST" class="form-horizontal" id="exitForm" name="form3"> -->
						<form action="" method="POST" class="form-horizontal" id="exitForm" name="form3"> 
							<!-- 아이디 입력 -->
							<div class="form-group">
								<label for="guserId" class="control-label col-md-2">아이디 </label>
								<div class="col-md-6">		
									<input type="text" class="form-control" name="guserId" id="guserId" value="${pdto.guserId}" disabled>
								</div>
							</div>

							<!-- 비밀번호 입력 -->
							<div class="form-group">
								<label for="guserPw" class="control-label col-md-2">비밀번호 </label>
								<div class="col-md-6">
									<input type="password" class="form-control" id="guserPw" name="guserPw" placeholder="비밀번호를 입력하세요." required>
								</div>
							</div>

							<!-- 체크박스 -->
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<div class="checkbox">
										<label><input type="checkbox" name="agreeExit" required>위의 유의사항을 모두 확인했으며, 이에 동의합니다.</label>
									</div>
								</div>
							</div>

							<!-- 탈퇴 버튼 -->
							<div class="form-group">
								<div class="clearfix">
									<button type="submit" class="btn btn-danger pull-right" onclick="form_link(3)">탈퇴하기</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>