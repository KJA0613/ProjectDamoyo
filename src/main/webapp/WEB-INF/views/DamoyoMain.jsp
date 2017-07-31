<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>다모여 메인페이지</title>
<style type="text/css">
	.btn-primary {
	   background-color: #66a3ff;
	   padding: 50px 70px;
	   font-size: 50px;
	   color: white;
	   text-align: center;
	   font-weight: 600px;
	   border: none;
	}
	
	.col-xs-2 {
		background-color: #80bfff;
		border: 1px;
		color: white;
		font-size: 50px;
	}
</style>

<!-- 주제 이미지 효과  CSS -->
<style>
	.clear {
	    clear: both;
	}
	.images2 {
		padding-top: 130px;
	}
</style>

<!-- 검색창 효과 -->
<style>
	.blue_search{
		display: inline-block;
	    width: 400px;
	    height: 41px;
	    border: 2px solid #03a9f4;
	    background: #fff;
	}
	.input_text {
	    margin: 8px 0 0 0px;
	    width: 380px;
	    height: 23px;
	    outline: 0;
	    border: 0;
	    color: #bbb9b9;
	    font-weight: normal;
	    font-size: 16px;
	    line-height: 20px;
	}
	.btn_search {
 		width: 41px;
		height: 41px;	 
		position: absolute;
		border: 0;
	    background: #03a9f4;
		overflow: visible;    
	}
	.img_srh{
		position: absolute;
	    top: 4px;
	    left: 3px;
	}
	
	#choice_area1 {
		/* position: absolute; */
 		width: 120px;
		height: 41px;	 
		border: 2px solid #03a9f4;   
	    background: #fff;
	}
	#choice_area2 {
		/* position: absolute; */
 		width: 120px;
		height: 41px;	 
		border: 2px solid #03a9f4;   
	    background: #fff;
/* 	    left: 100px; */
	}
	
</style>

<!-- 장소 광고 CSS -->
<style>
	.wrapper {
	    max-width: 1100px;
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


<!-- JavaScript -->
<!-- 주제별 URL -->
<script>
	// 검색어 체크된 상태로 검색되게 작업하기
	function subject(type) {
		if(type == 'foreign') {
			document.location.href='gather/gathering';
		} else if (type == 'eng') {
			document.location.href='gather/gathering';
		} else if (type == 'music') {
			document.location.href='gather/gathering';
		} else if (type == 'life') {
			document.location.href='gather/gathering';
		} else if (type == 'job') {
			document.location.href='gather/gathering';
		} else if (type == 'game') {
			document.location.href='gather/gathering';
		} else if (type == 'sports') {
			document.location.href='gather/gathering';
		} else if (type == 'computer') {
			document.location.href='gather/gathering';
		} else if (type == 'lifr') {
			document.location.href='gather/gathering';
		} else if (type == 'art') {
			document.location.href='gather/gathering';
		} else if (type == 'etc') {
			document.location.href='gather/gathering';
		}
	}
</script>


<!-- 위치 선택 -->
<script>
	var area0 = new Array("-선택-","");
	var area1 = new Array("강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구");
	var area2 = new Array("가평군","고양시덕양구","고양시일산동구","고양시일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시소사구","부천시오정구","부천시원미구","성남시분당구","성남시수정구","성남시중원구","수원시권선구","수원시영통구","수원시장안구","수원시팔달구","시흥시","안산시단원구","안산시상록구","안성시","안양시동안구","안양시만안구","양주시","양평군","여주시","연천군","오산시","용인시기흥구","용인시수지구","용인시처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시");
	var area3 = new Array("강화군","계양구","남구","남동구","동구","부평구","서구","연수구","옹진군","중구");
	var area4 = new Array("강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군");
	var area5 = new Array("대덕구","동구","서구","유성구","중구");
	var area6 = new Array("세종시");
	var area7 = new Array("계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시동남구","천안시서북구","청양군","태안군","홍성군");
	var area8 = new Array("괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시상당구","청주시서원구","청주시청원구","청주시흥덕구","충주시");
	var area9 = new Array("강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구");
	var area10 = new Array("남구","동구","북구","울주군","중구");
	var area11 = new Array("거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시마산합포구","창원시마산회원구","창원시성산구","창원시의창구","창원시진해구","통영시","하동군","함안군","함양군","합천군");
	var area12 = new Array("경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시남구","포항시북구");
	var area13 = new Array("남구","달서구","달성군","동구","북구","서구","수성구","중구");
	var area14 = new Array("광산구","남구","동구","북구","서구");
	var area15 = new Array("강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군");
	var area16 = new Array("고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시덕진구","전주시완산군","정읍시","진안군");
	var area17 = new Array("서귀포시","제주시");
	
	function areachange(item){
	    var temp, i=0, j=0;
	    var ccount, cselect;

	    temp = document.signform.area;

	    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
	    eval('ccount = area' + item + '.length');
	   
	    
	    for (j=0 ; j<ccount ; j++) {
	        eval('cselect = area' + item + '[' + j + '];');
	        temp.options[j]= new Option(cselect,cselect); 
	    }
	    
	    temp.options[0].selected=true;
	    return true;
	}
</script>


<!-- [Header] 공통 헤더 -->
<%@include file="header.jsp"%>

</head>

<body>
	<br><br><br>
	
   <div class="container text-center">
		<!-- 01. 검색 -->
		<!-- 01-01. 위치 검색 (위치 선택)-->
		<div class="from-group">
		<br><br><br><br>		
			<div class="col-md-3 col-md-offset-2">
				<form action="" method="POST" name="signform">
					<select name="bigarea1"
						onChange="areachange(this.options.selectedIndex)" id="choice_area1">
						<option selected value="">시 선택</option>
						<option value=1>서울특별시</option>
						<option value=2>경기도</option>
						<option value=3>인천광역시</option>
						<option value=4>강원도</option>
						<option value=5>대전광역시</option>
						<option value=6>세종특별자치시</option>
						<option value=7>충청남도</option>
						<option value=8>충청북도</option>
						<option value=9>부산광역시</option>
						<option value=10>울산광역시</option>
						<option value=11>경상남도</option>
						<option value=12>경상북도</option>
						<option value=13>대구광역시</option>
						<option value=14>광주광역시</option>
						<option value=15>전라남도</option>
						<option value=16>전라북도</option>
						<option value=17>제주특별자치도</option>
					</select>&nbsp;
					<select name="area" size=1 id="choice_area2">
						<option selected value="">구/군</option>
						<option value=""></option>
					</select>
				</form>
			</div>		
		
			<!-- 01-02. 주제어 검색 -->
			<div class="col-md-5">
					<span class="blue_search">
						<input type="text" title="검색어 입력" class="input_text" placeholder="주제어를 검색해주세요.">
					</span>
					<button type="button" class="btn_search" onclick="">
						<span class="img_srh">
							<img src="resources/image/main/btn_srh.png">		 
						</span>
					</button>
			</div>		
		
			<!-- 01-03. 인기 검색 -->
			
		</div>	


  		<br><br><br><br><br><br><br><br>	

   
		<!-- 02. 테마  -->
		<h1>테마별 검색</h1>
		<hr>
		<br>
		
		<!-- 1행 -->
		<div class="images1">
		<br>
				<!-- 1. 외국어 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('foreign');" style="position: absolute;">		
						<div class="cutter foreign">
							<div class="img"><img src="resources/image/main/english.png"></div>	<!-- #ABD8EB -->
						</div>
					</div>
				</div>
				
				<!-- 2. 영어 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('eng');" style="position: absolute;">		
						<div class="cutter eng">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 3. 음악/공연 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('music');" style="position: absolute;">		
						<div class="cutter music">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 4. 라이프 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('life');" style="position: absolute;">		
						<div class="cutter life">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 5. 취업 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('job');" style="position: absolute;">		
						<div class="cutter job">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 6. 게임 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('game');" style="position: absolute;">		
						<div class="cutter game">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
			<div class="clear"></div>
		</div>
		<br><br>
		
		
		<!-- 2행 -->
		<div class="images2">
				<!-- 7. 스포츠 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('sports');" style="position: absolute;">		
						<div class="cutter sports">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>	<!-- #ABD8EB -->
						</div>
					</div>
				</div>
				
				<!-- 8. 뷰티/미용 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('beauty');" style="position: absolute;">		
						<div class="cutter beauty">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 9. 컴퓨터 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('computer');" style="position: absolute;">		
						<div class="cutter computer">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 10. 공무원 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('life');" style="position: absolute;">		
						<div class="cutter life">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 11. 디자인/미술 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('art');" style="position: absolute;">		
						<div class="cutter art">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
				
				<!-- 12. 기타 -->
				<div class="col-md-2">
					<div class="boxm col1 masonry-brick" onclick="subject('etc');" style="position: absolute;">		
						<div class="cutter etc">
							<div class="img"><img src="resources/image/main/heart(1).png"></div>
						</div>
					</div>
				</div>
			<div class="clear"></div>
		</div>	
	

		
	   <br><br><br> <br><br><br>  <br><br><br><br><br>
	   
	   <!-- 03. 광고  -->
	   <h1>모임 공간</h1>
	   <hr>
	   <br>
   
   	   <div class="wrapper">
			<ul class="properties_list">
				<li>
					<a href="/">
						<img src="resources/image/main/english_space.png" alt title class="property_img">
					</a>
					<span class="price">1 hour: 2,500</span>
					<div class="property_details">
						<div class="title">
							<h3><a href="">24시간 상쾌한 회회공간</a></h3>
						</div>
						<div class="details">
							<span id="s1">지역</span>&nbsp;&nbsp;
							<span id="s2">서울시 | 강남구</span>
							<br>
							<span id="s1">위치</span>&nbsp;&nbsp;
							<span id="s2">강남역 2번출구 200m</span>
							<br>
							<span id="s1">영업시간</span>&nbsp;&nbsp;
							<span id="s2">주말 제외</span>
						</div>
					</div>
				</li>	
				
				<li>
					<a href="/">
						<img src="resources/image/main/english_space.png" alt title class="property_img">
					</a>
					<span class="price">1 hour: 2,500</span>
					<div class="property_details">
						<div class="title">
							<h3><a href="">24시간 상쾌한 회회공간</a></h3>
						</div>
						<div class="details">
							<span id="s1">지역</span>&nbsp;&nbsp;
							<span id="s2">서울시 | 강남구</span>
							<br>
							<span id="s1">위치</span>&nbsp;&nbsp;
							<span id="s2">강남역 2번출구 200m</span>
							<br>
							<span id="s1">영업시간</span>&nbsp;&nbsp;
							<span id="s2">주말 제외</span>
						</div>
					</div>
				</li>	
				
				<li>
					<a href="/">
						<img src="resources/image/main/english_space.png" alt title class="property_img">
					</a>
					<span class="price">1 hour: 2,500</span>
					<div class="property_details">
						<div class="title">
							<h3><a href="">24시간 상쾌한 회회공간</a></h3>
						</div>
						<div class="details">
							<span id="s1">지역</span>&nbsp;&nbsp;
							<span id="s2">서울시 | 강남구</span>
							<br>
							<span id="s1">위치</span>&nbsp;&nbsp;
							<span id="s2">강남역 2번출구 200m</span>
							<br>
							<span id="s1">영업시간</span>&nbsp;&nbsp;
							<span id="s2">주말 제외</span>
						</div>
					</div>
				</li>	
			</ul>
			
			<br>
			
			<ul class="properties_list">
				<li>
					<a href="/">
						<img src="resources/image/main/english_space.png" alt title class="property_img">
					</a>
					<span class="price">1 hour: 2,500</span>
					<div class="property_details">
						<div class="title">
							<h3><a href="">24시간 상쾌한 회회공간</a></h3>
						</div>
						<div class="details">
							<span id="s1">지역</span>&nbsp;&nbsp;
							<span id="s2">서울시 | 강남구</span>
							<br>
							<span id="s1">위치</span>&nbsp;&nbsp;
							<span id="s2">강남역 2번출구 200m</span>
							<br>
							<span id="s1">영업시간</span>&nbsp;&nbsp;
							<span id="s2">주말 제외</span>
						</div>
					</div>
				</li>	
				
				<li>
					<a href="/">
						<img src="resources/image/main/english_space.png" alt title class="property_img">
					</a>
					<span class="price">1 hour: 2,500</span>
					<div class="property_details">
						<div class="title">
							<h3><a href="">24시간 상쾌한 회회공간</a></h3>
						</div>
						<div class="details">
							<span id="s1">지역</span>&nbsp;&nbsp;
							<span id="s2">서울시 | 강남구</span>
							<br>
							<span id="s1">위치</span>&nbsp;&nbsp;
							<span id="s2">강남역 2번출구 200m</span>
							<br>
							<span id="s1">영업시간</span>&nbsp;&nbsp;
							<span id="s2">주말 제외</span>
						</div>
					</div>
				</li>	
				
				<li>
					<a href="/">
						<img src="resources/image/main/english_space.png" alt title class="property_img">
					</a>
					<span class="price">1 hour: 2,500</span>
					<div class="property_details">
						<div class="title">
							<h3><a href="">24시간 상쾌한 회회공간</a></h3>
						</div>
						<div class="details">
							<span id="s1">지역</span>&nbsp;&nbsp;
							<span id="s2">서울시 | 강남구</span>
							<br>
							<span id="s1">위치</span>&nbsp;&nbsp;
							<span id="s2">강남역 2번출구 200m</span>
							<br>
							<span id="s1">영업시간</span>&nbsp;&nbsp;
							<span id="s2">주말 제외</span>
						</div>
					</div>
				</li>	
			</ul>
   	   </div>
		
   <br><br><br>		
   <!-- hidden -->
   <input type="hidden" name="guserId" value="${pdto.guserId}">
   <input type="hidden" name="guserPw" value="${pdto.guserPw}">


   <br><br><br>
   
   <!-- [Footer] 페이지 하단 (고정화면) -->
   <hr>
   <%@include file = "footer.jsp"%>
   </div>
   <br><br>
</body>
</html>