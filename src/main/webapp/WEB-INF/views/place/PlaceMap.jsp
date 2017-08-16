<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>

<!-- jquery를 이용하여 뿌리기 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
	src="http://scriptmoa.cafe24.com/scriptmoa/jQuery/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>

<body>
	<div id="map" style="width:500px;height:350px;"></div>

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

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			/* 아래에 키워드에 주소 넣기 */
			/* keyword에 placeAdd3 넣으면 될꺼같음 */
			//var keyword = ${place.placeAddr3}; // keyword는 검색 값 
			var keyword = '이태원 맛집';
			
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			// 즉, 주소로 검색되는 위치의 지도를 가져옴
			ps.keywordSearch(keyword, placesSearchCB); // placesSearchCB는 지도의 위치를 나타내줌, ex) 서울특별시 강남구면 강남구를 뿌려줌.
		}

		
				
		// data를 dto로 받아서 가져오기
		// dto를 하나만들어서 data로 넣기
		function placesSearchCB(data, status, pagination) { // state는 성공 했을때 
			
			if (status === daum.maps.services.Status.OK) {
				
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }       

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

		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: new daum.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    daum.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}			

		
	</script>
</body>
</html>