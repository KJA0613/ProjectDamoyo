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

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<title>광고주 메인페이지</title>

<!-- 소개글 CSS -->
<style>
	.intro_wrap {	    
	    padding-top: 147px;
	    padding-bottom: 59px;
	    
	    padding: 90px 22px 45px;
    	z-index: 2;
    	font-size: 14px;
    	
    	height: auto;
    	color: #000;
    	text-align: center;
	}
	
	.intro_wrap h2 {
    	padding-top: 35px;
    	font-size: 56px;
        line-height: 60px;
	}
	
	em {
    	vertical-align: top;
	}
	
	.intro_wrap .desc {
    	padding-top: 18px;
    	font-size: 20px;
    	line-height: 30px;
    	color: #656565;
	}
	
	.btn_area {
		width: 1000px;
		height: 100px;
		text-align: center;
	    display: inline-block;
	}
	
	.btn_wrap {
		padding-left: 55px;
	    float: left;
	    width: 30%;
	    display: block;
	}
	
	.btn_wrap a{
		font-size: 26px;
		font-weight: bold;
	}
	
	.btn {
	    width: 270px;
	    height: 50px;
    	padding: 35px 7px 7px 24px;
		text-align: center;
		border-radius: 0;
	}
	
	.space_total {
   		color: #fff; 
		background-color: #03a9f4;
	}
	
	.space_regist {
		color: #fff;
		background-color: #ffcc00;
	}
	
	.my_space {
		color: #fff;
		background-color: #999999;	
	}
</style>

<!-- 모임공간 검색창1 CSS -->
<style type="text/css">
	.box_search {
	    position: relative;
	    padding: 30px;
	    border: 4px solid #40b4e5;
	    background: #fff;
	    padding: 147px 50px 80px;
	    width: 1150px;
	    height: 200;
	    margin: 0 auto;
	    vertical-align: middle;
	}

	.box_inner {
		position: relative;
	}
	
	.box_search .period_search {
    	display: block;
    	padding: 0 168px 0 320px;
	}
	
	.flex_wrap > dl {
		position: absolute;
	    top: 0;
	    left: 0;
	    width: 290px;
	    float: left;
	}
	
	.flex_box {
		display: table;
	}
	
	.flex_wrap .flex {
	    display: block;
    	width: 100%;
	}
	
	.flex_wrap .flex+.flex {
    	margin-top: 16px;
	}
	
	.flex_box .tit {
	    font-size: 18px;
	    padding-top: 2px;
	}
	
	.row {
    	position: relative;
	}

	.select>select {
	    position: relative;
	    z-index: 2;
	    padding: 0 35px 0 13px;
	    margin: 0;
	    width: 100%;
	    height: 48px;
	    border: 0;
	    background-color: transparent;
	    line-height: 48px;
	    vertical-align: top;
	    border-radius: 0;
	}
</style>



<!-- 모임공간 검색창1 CSS -->
<style type="text/css">
	

</style>

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

<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>

<!-- [Header] 공통 헤더 -->
<%@include file="header.jsp"%>
</head>

<body>

	<!-- 소개글 -->
	<div class="intro_wrap">
		<h2>
			지금 <em>바로</em> 공간을 공유해보세요! 
		</h2>
		
		<p class="desc">
			스터디룸, 세미나룸, 컨퍼런스룸 등 다양한 모임 공간을 다모여를 통해 공유해보세요!
		</p>
		
		<br>
		
		<div class="btn_area">
			<div class="btn_wrap">
				<a class="btn space_total" onclick="fnMove('1')">전체 모임 공간</a>
			</div>
			<div class="btn_wrap">
				<a href="/place/PlaceRegistForm" onclick="" class="btn space_regist">모임 공간 등록</a>
			</div>
			<div class="btn_wrap">
				<a href="#" class="btn my_space">나의 모임 공간</a>
			</div>
		</div>		
	</div>			
	<hr>
	
	
	<!-- 검색 -->	
 	<!--<div class="box_search">
		<div class="box_inner">
			<div class="period_search">
					<dl class="flex_box">
						<dt class="flex tit">
							<label for="category1">지역별 검색</label>
						</dt>
						
						<dd>
							<div class="row">
								<div class="select">
									<form action="" method="POST" name="signform">
										<select name="bigarea1"	onChange="areachange(this.options.selectedIndex)" id="choice_area1">
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
										</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
										<select name="area" size=1 id="choice_area2">
											<option selected value="">구/군</option>
											<option value=""></option>
										</select>
									</form>	
								</div>
							</div>
						</dd>
					</dl>		
			
					<br><br><br>
			
					카테고리 검색
					<dl class="flex_box">
						<dt class="flex tit">
							<label for="category1">카테고리 검색</label>
						</dt>
						
						<dd>
							<div class="row">
								<div class="select">
									<form action="" method="POST" name="signform">
										<select name="" id="">
											<option value="0">카테고리 선택</option>
											<option value="1" selected>스터디룸</option>
											<option value="2">세미나룸</option>
											<option value="3">파티룸</option>
											<option value="4">카페</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</form>	
								</div>
							</div>
						</dd>
					</dl>		
					
				</div>
			</div>
		</div>

	<div> -->

	
	<!-- 모임공간 광고  -->
    <div class="wrapper" id="div1">
    <br>
  	   <h1>모임 공간</h1>
   	   <hr style="border: solid 1px #b3b3b3;">
	    	<%@include file="place/PlaceAll.jsp"%>   	   		
		<br>
	</div>		
	<br><br><br><br>	
    
    <!-- [Footer] 페이지 하단 (고정화면) -->
    <%-- <hr>
    <%@include file = "footer.jsp"%> --%>
    
</body>
</html>