<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<!-- 장소 수정 여부 -->
<script>
	function placeModify(placeNo) {
		var mod = confirm("해당 장소를 수정 하시겠습니까?");
		
		if(mod == true) {
			location.href="/place/PlaceModify?placeNo="+placeNo;
		} else {
			history.go(0);		// 현재 페이지 유지
		}
	}
</script>

<!-- 장소 삭제 여부  -->
<script>
	function placeDelete(placeNo) {
		var del = confirm("해당 장소를 정말 삭제하시겠습니까?")

		if(del == true) {
			location.href="/place/PlaceDeleteAll?placeNo="+placeNo;		// 사용자(로그인)가 쓴 글 번호 넘겨서 삭제
		} else {
			history.go(0);
		}
	}
</script>


<!-- [Header] 공통 헤더 -->
<%@include file="../header.jsp"%>
</head>

<body>
	<br>
	<div class="container">
		<div class="clearfix">
			<h1>${pl_dto.placeName}</h1>
			<div class="form-group pull-right">	
			
			<!-- [광고주] 수정하기 / 삭제하기 > 로그인 한 사람 = 글 쓴 사람-->		
			<c:if test="${login_cdto.comId eq pl_dto.comId}">
				<button type="submit" class="btn btn-warning" id="place_modify" onclick="placeModify(${pl_dto.placeNo})">수정하기</button>
				<button type="submit" class="btn btn-danger" id="place_delete" onclick="placeDelete(${pl_dto.placeNo})">삭제하기</button>
			</c:if>
			
			</div>
			<hr style="border: solid 1px #b3b3b3;">
			<br>										
				
				<!-- 모임공간 등록 폼 -->
				<form action="/place/PlaceListAll" method="POST" class="form-horizontal" enctype="multipart/form-data">					
					<h3>기본 정보</h3>
					<hr>
					<%-- <div class="form-group">
						<label for="type" class="col-md-2 control-label">사진</label>
						<div class="col-md-6">
							<img src="${pl_dto.placeImage}" width="50%" height="auto" class="property_img">					
						</div>
					</div> --%>

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
					
					<!-- 다음 지도 -->
					<div class="form-group">
						<label for="type" class="col-md-2 control-label">위치</label>
						<div class="col-md-6" id="map" style="width:700px;height:400px;"></div>
					</div>
					
					<!-- 내 키값 -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7d8e5d495b6455649d08379c3f21296&libraries=services"></script>
					<script>
						// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
						var infowindow = new daum.maps.InfoWindow({zIndex:1});
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
							level : 3 // 지도의 확대 레벨
						};
				
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption);
				
						// 장소 검색 객체를 생성합니다
						var ps = new daum.maps.services.Places();
				
						// 검색을 요청하는 함수입니다
						ps.keywordSearch('${pl_dto.placeAddr3}', placesSearchCB); // placesSearchCB는 지도의 위치를 나타내줌, ex) 서울특별시 강남구면 강남구를 뿌려줌.
						
												
						// 검색 위치에 맞는 지도를 뿌려주는 
						function placesSearchCB(data, status, pagination) { // state는 성공 했을때 
							
							if (status === daum.maps.services.Status.OK) {
								
								/* alert(${pl_dto.placeY}+", "+${pl_dto.placeX}); */
								
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        // LatLngBounds 객체에 좌표를 추가합니다
						        var bounds = new daum.maps.LatLngBounds();
								
					            displayMarker();    
					            bounds.extend(new daum.maps.LatLng(${pl_dto.placeY}, ${pl_dto.placeX}));
						              
						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						        map.setBounds(bounds);
												
							} else if (status === daum.maps.services.Status.ZERO_RESULT) {
						        alert('존재하지 않습니다.');
						        return;
							} else if (status === daum.maps.services.Status.ERROR) {
								alert('오류가 발생했습니다.');
								return;
							}
							
						}
				
						// 마커찍는부분
						function displayMarker() {
						    
						    // 마커를 생성하고 지도에 표시합니다
						    var marker = new daum.maps.Marker({
						        map: map,
						        position: new daum.maps.LatLng(${pl_dto.placeY}, ${pl_dto.placeX})
						    });
				
						    // 마커에 클릭이벤트를 등록합니다
						    daum.maps.event.addListener(marker, 'click', function() {
						        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
						        infowindow.setContent('<div style="padding:5px;font-size:12px;">${pl_dto.placeName}</div>');
						        infowindow.open(map, marker);
						    });
						}			
					</script>
					
									
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
										
					<!-- 구글 애드센스 광고 : 도메인 등록해야하는ㅠ -->
					<!-- <div class="google-middle-add-center"></div> -->			

					<div class="clear-fix pull-right">
						<div class="col-md-4" style="text-align:center;">
							<button type="submit" class="btn btn-primary" id="submitAfterCheck">전체 목록보기</button>
						</div>
					</div>
					
					
					<!-- <input type="hidden" name="" value=""> -->

				</form>
			</div>
		   <!-- [Footer] 페이지 하단 (고정화면) -->
		   <hr>
		   <%@include file = "../footer.jsp"%>
   		</div>
   		<br>

</body>
</html>