<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- 장소 광고 CSS -->
<style>
	.wrapper {
	    max-width: 1200px;
	    margin: 0 auto;
	    position: relative;
	}
	
	.wrapper ul.properties_list li {
	    display: block;
	    width: 30%;
	    height: auto;
	    position: relative;
	    float: left;	    
	    margin: 0 3% 3% 0;
	}
	
	.wrapper ul.properties_list li img.property_img {
	    width: 100%;
	    height: auto!important;
	    vertical-align: top;
	}
	
	.wrapper ul.properties_list li .price {
	    position: absolute;
	    top: 10px;
	    left: 10px;
	    padding: 15px 20px;
	    background: #ffffff;
	    color: #514d4d;
	    font-size: 16px;
	    font-weight: bold;
	    letter-spacing: 1px;
    }
    
    .wrapper ul li .property_details {
	    width: 100%;
	    padding: 2.9% 5.8% 4.1% 5.8%;
	    border-bottom: 1px solid #f2f1f1;
	    border-left: 1px solid #f2f1f1;
	    border-right: 1px solid #f2f1f1;
    }
    
    .wrapper ul li .property_details h1 a {
	    text-decoration: none;
	    color: #666464;
	}
	 
	.wrapper ul li .property_details.title a{
	    color: #666464;
	    font-size: 28%;
	    font-weight: bold;
	    margin-left: 0px;
	    margin-bottom: 5px;
	    line-height: 28px;
	    vertical-align: baseline;
	    background: transparent;
	}
	
	.property_details h3 {
		color: #40b4e5;
		margin-left: 0px;
	    margin-bottom: 5px;
	    line-height: 25px;
	}
	
	.details {
		margin-left: 0;
	}
	
	#s1 {
	margin-left: 0px;
		color: #777;
		font-weight: bold;
		font-size: 16px;
		    /* display: inline-block; */
    	/* padding: 0px 5px 0; */
	}
	#s2 {
	margin-left: 0px;
		color: #777;
		font-size: 16px;
		font-weight: normal;
	}	

</style>


<!-- [Header] 공통 헤더 -->
<%@include file="../header.jsp"%>
</head>

<body>
	<br>
	<div class="container">
		<div class="clearfix">
				<h1>${pl_dto.placeName}</h1>				
				<!-- <p class="help-block">
					&nbsp;<small>* 모임공간에 오신걸 환영합니다.</small>
				</p> -->								
				<hr style="border: solid 1px #b3b3b3;">
				<br>				
				
				<!-- 구글 애드센스 광고 : 도메인 등록해야하는ㅠ -->
				<!-- <div class="google-middle-add-center"></div> -->
				
				<!-- 모임공간 등록 폼 -->
				<form action="/place/PlaceListAll" method="POST" class="form-horizontal" enctype="multipart/form-data">					
					<h3>기본 정보</h3>
					<hr>
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">사진</label>
						<div class="col-md-6">
							<img src="${pl_dto.placeImage}" width="50%" height="auto" class="property_img">					
						</div>
					</div>

					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간유형</label>
						
						<div class="col-md-6">
							${pl_dto.placeType}
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간명</label>
						<div class="col-md-6">
							${pl_dto.placeName}					
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">공간 소개</label>
						<div class="col-md-6">
							${pl_dto.placeIntro}						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">전화</label>
						<div class="col-md-6">
							${pl_dto.placeTel}						
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">주소</label>
						<div class="col-md-6">
							${pl_dto.placeAddr1}<br>						
							${pl_dto.placeAddr2}<br>						
							${pl_dto.placeAddr3}<br>						
							${pl_dto.placeAddr4}<br>						
						</div>
					</div>		
	
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">URL</label>
						<div class="col-md-6">
							<a href="${pl_dto.placeURL}">${pl_dto.placeURL}</a>						
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
						<div class="col-md-6"> 
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
						<div class="col-md-6">
							${pl_dto.placeParking}										
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">정기휴무</label>
						<div class="col-md-6">
							${pl_dto.placeNotUseDay}			
						</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">상세설명</label>
						<div class="col-md-6">
							${pl_dto.placeContent}				
						</div>
					</div>
									
					<br><br>
														
					<h3>담당자 정보</h3><hr>
					 <div class="form-group">
						<label for="type" class="col-md-2 control-label">이름</label>
						<div class="col-md-10">
							${cdto.comManager}						
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
					

					<!-- 다음 지도 -->
					<div class="form-group">
					<div id="map" style="width:500px;height:400px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=808e992783fa7a2691f58ef6a4ae0ed4"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = { 
						        center: new daum.maps.LatLng(37.537123, 127.005523), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };
						
						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new daum.maps.Map(mapContainer, mapOption); 
						</script>
					</div>					

				<div class="clear-fix pull-right">
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



</body>
</html>