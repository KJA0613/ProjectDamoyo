<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jquery를 이용하여 뿌리기 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
	src="http://scriptmoa.cafe24.com/scriptmoa/jQuery/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<title>모임공간 등록</title>

<style type="text/css">
	.control-label {
		font-size: 16px;
	}
</style>


<!-- [여진양 짱!!!!!!] 주소 > 다음 API-->
<!-- [참고 사이트] http://postcode.map.daum.net/guide-->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function search_corpAddr() {
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
                document.getElementById('placeAddr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('placeAddr2').value = fullRoadAddr;
                document.getElementById('placeAddr3').value = data.jibunAddress;

           	}
        }).open();
     		
    }
</script>


<!-- 이미지 업로드 유효성 검사 -->
<script>
	$(function() {
		$("#placeImage").change(function(){
					
			if($("#placeImage").val() != ""){
				var ext = $("#placeImage").val().split('.').pop().toLowerCase();
				
				/* .split('.')을 하면 return 값을 String 배열로 들어가고, pop은 스택인데 마지막 값(확장자 gif, jpg, 등등 확장자)을 빼냄, tolowerCase()는 문자열을 소문자로 바꿈 */
				
				if($.inArray(ext, ["gif","jpg","jpeg","png","bmp"]) == -1){
						alert("jpg, png, gif, bmp 만 업로드 가능합니다.");
						$("#fileName").val("");
						return false;
				}
			}
		});
	});	
</script>

<!-- [체크한 값 가져오기] 라디오/체크박스 -->
<!-- [참고 사이트] http://lng1982.tistory.com/80 -->
<script>
	$(document).ready(function() {	    
	 	$("#submitAfterCheck").click(function(){	 		
	 		
	 		// [radio] 주차 유무
	        var park_radioYn = $("input:radio[name='placeParking']:checked").val();    	        
	        
	 		
	        // [radio] 비용단위
	        var cost_radioYn = $("input:radio[name='placeCostChoice']:checked").val();    
	        
	    	
	        // [checkbox] 공간유형
			var space_chb = $("input:checkbox[name='placeType']").each(function() {
				var spaceList = $(this).val();
			});
	        
	        
	        // [checkbox] 정기휴무	         
			var day_chb = $("input:checkbox[name='placeNotUseDay']").each(function() {
				var dayList = $(this).val();
			});
	        
	    });
	}); 
</script>


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
				<form action="/place/PlaceRegist" method="POST" class="form-horizontal" enctype="multipart/form-data">					
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">사진</label>
						<div class="col-md-10">
							<input type="file" name="placeImage" id="placeImage" class="form-control" accept="image/gif, image/jpg, image/jpeg, image/png">						
						</div>
						<!-- <div class="col-md-2">
							<button type="button" class="btn btn-grey">사진등록</button>
						</div> -->
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
							<input type="text" name="placeName" class="form-control" placeholder="10자 이내로 입력해주세요." required>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간 소개</label>
						<div class="col-md-10">
							<input type="text" name="placeIntro" class="form-control" placeholder="20자 이내로 입력해주세요." required>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">전화</label>
						<div class="col-md-10">
							<input type="text" name="placeTel" class="form-control" placeholder="02-123-4567" required>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">주소</label>
						<div class="col-md-8">
							<input type="text" name="placeAddr1" id="placeAddr1" class="form-control" placeholder="우편번호"><br>
							<input type="text" name="placeAddr2" id="placeAddr2" class="form-control" placeholder="도로명 주소"><br>
							<input type="text" name="placeAddr3" id="placeAddr3" class="form-control" placeholder="지번 주소"><br>
							<input type="text" name="placeAddr4" id="placeAddr4" class="form-control" placeholder="상세 주소">						
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-grey" onclick="search_corpAddr()">주소 검색</button><br>							
						</div>
					</div>		
	
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">URL</label>
						<div class="col-md-10">
							<input type="text" name="placeURL" class="form-control" placeholder="www.damoyo.com" required>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">비용</label>
						<div class="col-md-2">
							<input type="text" name="placeCost" class="form-control" placeholder="2,500" required>
						</div>
						<div class="col-md-6">
							<input type="radio" name="placeCostChoice" value="1 hour" checked="checked">시간단위 &nbsp;
							<input type="radio" name="placeCostChoice" value="1 day">일단위 &nbsp;
							<input type="radio" name="placeCostChoice" value="1 month">월간단위 &nbsp;
							<input type="radio" name="placeCostChoice" value="Free">무료					
						</div>
						
					</div>
										
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">영업시간</label>
						<div class="col-md-10"> 
							<input type="text" name="placeUseTime" class="form-control" placeholder="09:00 ~ 18:00" required>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">수용인원</label>
						<div class="col-md-2">
							<input type="text" name="placePerCnt" class="form-control" placeholder="6" required>						
						</div>
						<h4>명</h4>
					</div>		 					
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label" id="parkRadio">주차</label>
						<div class="col-md-10">
							<input type="radio" name="placeParking" value="무" checked="checked">무 &nbsp;	 
							<input type="radio" name="placeParking" value="유">유											
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">정기휴무</label>
						<div class="col-md-10">
							<input type="checkbox" name="placeNotUseDay" value="월">&nbsp;월			&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="화">&nbsp;화			&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="수">&nbsp;수			&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="목">&nbsp;목			&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="금">&nbsp;금			&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="토">&nbsp;토			&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="일">&nbsp;일			&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="placeNotUseDay" value="공휴일">&nbsp;공휴일		&nbsp;					
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">상세설명</label>
						<div class="col-md-10">
							<textarea rows="5" cols="10" name="placeContent" class="form-control" required></textarea>				
						</div>
					</div>
									
					<br><br>		
										
					<h3>담당자 정보</h3>
					<hr>
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">이름</label>
						<div class="col-md-10">
							<input type="text" name="comManager" class="form-control" placeholder="실명을 입력해주세요." value="${cdto.comName}" disabled>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">E-mail</label>
						<div class="col-md-10">
							<input type="text" name="comEmail" class="form-control" placeholder="abc@gmail.com" value="${cdto.comEmail}" disabled>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">휴대폰</label>
						<div class="col-md-10">
							<input type="text" name="comPhone" class="form-control" placeholder="010-1234-5678" value="${cdto.comPhone}" disabled>						
						</div>
					</div>	
					<br><br>
					

					<div class="clear-fix">
						<div class="pull-right">
							<button type="submit" class="btn btn-primary" id="submitAfterCheck">모임공간 등록하기</button>
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
   <br><br>   
</body>
</html>