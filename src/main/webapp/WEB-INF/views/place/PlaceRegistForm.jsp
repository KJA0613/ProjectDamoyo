<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임공간 등록</title>

<style type="text/css">
	.control-label {
		font-size: 16px;
	}

</style>


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
				<form action="/space/SpaceRegist" method="POST" class="form-horizontal">					
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">사진</label>
						<div class="col-md-8">
							<input type="text" name="placeImage" class="form-control">						
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-grey">사진등록</button>
						</div>
					</div>

					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간유형</label>
						
						<div class="col-md-10">
							<input type="checkbox" name="placeType" value="스터디룸">스터디룸		&nbsp;
							<input type="checkbox" name="placeType" value="세미나룸">세미나룸		&nbsp;
							<input type="checkbox" name="placeType" value="다목적홀">다목적홀		&nbsp;
							<input type="checkbox" name="placeType" value="파티룸">파티룸		&nbsp;
							<input type="checkbox" name="placeType" value="카페">카페			&nbsp;
							<input type="checkbox" name="placeType" value="레저시설">레저시설		&nbsp;
							<input type="checkbox" name="placeType" value="공연장">공연장		&nbsp;<br>
							<input type="checkbox" name="placeType" value="엠티장소">엠티장소		&nbsp;
							<input type="checkbox" name="placeType" value="작업실">작업실		&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="placeType" value="연습실">연습실		&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="placeType" value="기타">기타
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간명</label>
						<div class="col-md-10">
							<input type="text" name="placeName" class="form-control" placeholder="10자 이내로 입력해주세요.">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간 소개</label>
						<div class="col-md-10">
							<input type="text" name="placeIntro" class="form-control" placeholder="20자 이내로 입력해주세요.">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">전화</label>
						<div class="col-md-10">
							<input type="text" name="placeeTel" class="form-control" placeholder="02-123-4567">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">주소</label>
						<div class="col-md-8">
							<input type="text" name="placeAdr1" class="form-control" placeholder="도로명 주소"><br>
							<input type="text" name="placeAdr2" class="form-control" placeholder="지번 주소"><br>
							<input type="text" name="placeAdr3" class="form-control" placeholder="상세 주소를 입력해주세요.">						
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-grey">주소 검색</button><br>							
						</div>
					</div>		
	
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">URL</label>
						<div class="col-md-10">
							<input type="text" name="placeURL" class="form-control" placeholder="www.naver.com">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">비용</label>
						<div class="col-md-2">
							<input type="text" name="placeCost" class="form-control" placeholder="2,500원">
						</div>
						<div class="col-md-6">
							<input type="radio" name="placeCostChoice" value="1">시간단위 &nbsp;
							<input type="radio" name="placeCostChoice" value="2">일단위 &nbsp;
							<input type="radio" name="placeCostChoice" value="3">월간단위 &nbsp;
							<input type="radio" name="placeCostChoice" value="4">무료					
						</div>
						
					</div>
										
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">이용시간</label>
						<div class="col-md-10"> 
							<input type="text" name="placeUseTime" class="form-control" placeholder="10:00 ~ 18:00">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">수용인원</label>
						<div class="col-md-2">
							<input type="text" name="placePerCnt" class="form-control" placeholder="6명">						
						</div>
						<h4>명</h4>
					</div>							
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">주차</label>
						<div class="col-md-10">
							<input type="radio" name="placeParking" value="1">유	&nbsp;
							<input type="radio" name="placeParking" value="2">무					
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">정기휴무</label>
						<div class="col-md-10">
							<input type="checkbox" name="placeUseDay" value="월">&nbsp;월			&nbsp;
							<input type="checkbox" name="placeUseDay" value="화">&nbsp;화			&nbsp;
							<input type="checkbox" name="placeUseDay" value="수">&nbsp;수			&nbsp;
							<input type="checkbox" name="placeUseDay" value="목">&nbsp;목			&nbsp;
							<input type="checkbox" name="placeUseDay" value="금">&nbsp;금			&nbsp;
							<input type="checkbox" name="placeUseDay" value="토">&nbsp;토			&nbsp;
							<input type="checkbox" name="placeUseDay" value="일">&nbsp;일			&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="placeUseDay" value="공휴일">&nbsp;공휴일		&nbsp;					
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">상세설명</label>
						<div class="col-md-10">
							<textarea rows="5" cols="10" name="placeContent" class="form-control"></textarea>				
						</div>
					</div>
									
					<br>
					

					<hr>					
					<h3>담당자 정보</h3><br>
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">이름</label>
						<div class="col-md-10">
							<input type="text" name="" class="form-control" placeholder="실명을 입력해주세요.">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">E-mail</label>
						<div class="col-md-10">
							<input type="text" name="" class="form-control" placeholder="abc@gmail.com">						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">휴대폰</label>
						<div class="col-md-10">
							<input type="text" name="" class="form-control" placeholder="010-1234-5678">						
						</div>
					</div>	
					<br><br>
					
					<!-- 모임 공간 생성 버튼 -->
					<div class="clear-fix">
						<div class="pull-right">
							<button type="submit" class="btn btn-primary">모임공간 등록하기</button>
						</div>
					</div>
				
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