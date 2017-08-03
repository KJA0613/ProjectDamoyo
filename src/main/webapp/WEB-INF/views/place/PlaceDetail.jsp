<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 상세페이지</title>

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
				<h1>${pl_dto.placeName}</h1>				
				<!-- <p class="help-block">
					&nbsp;<small>* 모임공간에 오신걸 환영합니다. 상세한 내용 확ㅇ</small>
				</p> -->								
				<hr>
				
				<!-- 모임공간 등록 폼 -->
				<form action="/place/PlaceListAll" method="POST" class="form-horizontal" enctype="multipart/form-data">					
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">사진</label>
						<div class="col-md-8">
							${pl_dto.placeImage}						
						</div>
					</div>

					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간유형</label>
						
						<div class="col-md-10">
							${pl_dto.placeType}
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간명</label>
						<div class="col-md-10">
							${pl_dto.placeName}					
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간 소개</label>
						<div class="col-md-10">
							${pl_dto.placeIntro}						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">전화</label>
						<div class="col-md-10">
							${pl_dto.placeTel}						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">주소</label>
						<div class="col-md-8">
							${pl_dto.placeAddr1}<br>						
							${pl_dto.placeAddr2}<br>						
							${pl_dto.placeAddr3}<br>						
							${pl_dto.placeAddr4}<br>						
						</div>
					</div>		
	
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">URL</label>
						<div class="col-md-10">
							<a>${pl_dto.placeURL}</a>						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">비용</label>
						<div class="col-md-6">
							${pl_dto.placeCostChoice} / ${pl_dto.placeCost} 원 	
						</div>
					</div>
										
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">영업시간</label>
						<div class="col-md-10"> 
							${pl_dto.placeUseTime}				
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">수용인원</label>
						<div class="col-md-2">
							${pl_dto.placePerCnt} 명
						</div>
					</div>		 					
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label" id="parkRadio">주차</label>
						<div class="col-md-10">
							${pl_dto.placeParking}										
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">정기휴무</label>
						<div class="col-md-10">
							${pl_dto.placeNotUseDay}			
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">상세설명</label>
						<div class="col-md-10">
							${pl_dto.placeContent}				
						</div>
					</div>
									
					<br>
					

					<hr>					
					<h3>담당자 정보</h3><br>
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">이름</label>
						<div class="col-md-10">
							${cdto.comName}						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">E-mail</label>
						<div class="col-md-10">
							${cdto.comEmail}						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">휴대폰</label>
						<div class="col-md-10">
							${cdto.comPhone}						
						</div>
					</div>	
					<br><br>
					

					<div class="clear-fix">
						<div class="col-md-4" style="text-align:center;">
							<button type="submit" class="btn btn-primary" id="submitAfterCheck">전체 목록보기</button>
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