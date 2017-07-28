<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임공간 등록</title>

<!-- [Header] 공통 헤더 -->
<%@include file="../header.jsp"%>
</head>
<body>

	<div class="container">
		<div class="clearfix">
			<div class="col-md-8 col-md-offset-2">	
				<h1>모임공간 등록</h1>				
				<p class="help-block">
					&nbsp;<small>* 회원님의 모임공간 등록에 필요한 사항을 모두 입력해주세요.</small>
				</p>								
				<br><br>
				
				<!-- 모임공간 등록 폼 -->
				<form action="/space/SpaceRegist" method="POST">			
					<!-- 1. 모임공간 유형 -->
					<div class="form-group">
						<label for="type" class="col-md-3 control-label">모임공간 유형</label>
						
						<input type="checkbox" name="space_type" value="스터디룸">스터디룸	&nbsp;
						<input type="checkbox" name="space_type" value="세미나룸">세미나룸	&nbsp;
						<input type="checkbox" name="space_type" value="다목적홀">다목적홀	&nbsp;
						<input type="checkbox" name="space_type" value="파티룸">파티룸		&nbsp;
						<input type="checkbox" name="space_type" value="카페">카페			&nbsp;
						<input type="checkbox" name="space_type" value="레저시설">레저시설	&nbsp;
						<input type="checkbox" name="space_type" value="공연장">공연장		&nbsp;<br>
						<input type="checkbox" name="space_type" value="엠티장소">엠티장소	&nbsp;
						<input type="checkbox" name="space_type" value="작업실">작업실		&nbsp;
						<input type="checkbox" name="space_type" value="연습실">연습실		&nbsp;
					</div>
					
					
					<!-- 2. 예약유형 선택 -->
					<div class="form-group">
						<label for="type" class="col-md-3 control-label">예약유형</label>
						
						<input type="radio" name="chk_info" value="time">시간단위
						<input type="radio" name="chk_info" value="day">시간단위
					</div>
					
					<br><br>
					
					<!-- 3. 기타 입력 -->
					<div class="form-group">
						<label for="type" class="col-md-3 control-label">공간명</label>
						<input type="text" name="spaceName" class="form-control" placeholder="10자 이내로 입력해주세요.">						
					</div>
					
					공간 정보
					공간명
					공간 한 줄 소개
					공간 소개
					시설안내
					이용시간
					정기휴무
					웹사이트 URL
					대표이미지
					이메일
					휴대폰
					대표전화
					주소
					수용인원
					
					<!-- 모임 공간 생성하기 > button -->
				
				</form>
			</div>



   		</div>
   		<br>
   		
   		
   <!-- [Footer] 페이지 하단 (고정화면) -->
   <hr>
   <%@include file = "../footer.jsp"%>
   
   </div>
</body>
</html>