<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>모집글 작성</title>

<!-- Bootstrap core CSS -->
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="/resources/examples/offcanvas/offcanvas.css"
	rel="stylesheet"> -->

<script src="/resources/assets/js/ie-emulation-modes-warning.js"></script>

<!-- jquery를 이용하여 뿌리기 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
	src="http://scriptmoa.cafe24.com/scriptmoa/jQuery/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
 	$(function() {
		$("#fileName").change(function(){
					
			if($("#fileName").val() != ""){
				var ext = $("#fileName").val().split('.').pop().toLowerCase();
				
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

<script type="text/javascript">
 function form_check(){
	 var content = $("#gContent").val();
	 
	 if(!content){ /*  !content 이뜻은 스크립트에서 값이 null 일때는 false를 반환하기 때문에 !false == true임 */
		 alert("생각 좀 하고 빈칸 채우렴.");
	 }else{
		 $("#gMake").submit();
	 }
 }
</script>


<!--지역상세스크립트  -->
<script type="text/javascript">
<!--1차지역상세배열  -->
   var areaMid0 = new Array("-선택-","");
   var areaMid1 = new Array("강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구");
   var areaMid2 = new Array("가평군","고양시 덕양구","고양시 일산동구","고양시 일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시 소사구","부천시 오정구","부천시 원미구","성남시 분당구","성남시 수정구","성남시 중원구","수원시 권선구","수원시 영통구","수원시 장안구","수원시 팔달구","시흥시","안산시 단원구","안산시 상록구","안성시","안양시 동안구","안양시 만안구","양주시","양평군","여주시","연천군","오산시","용인시 기흥구","용인시 수지구","용인시 처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시");
   var areaMid3 = new Array("강화군","계양구","남구","남동구","동구","부평구","서구","연수구","옹진군","중구");
   var areaMid4 = new Array("강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군");
   var areaMid5 = new Array("대덕구","동구","서구","유성구","중구");
   var areaMid6 = new Array("세종시");
   var areaMid7 = new Array("계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시 동남구","천안시 서북구","청양군","태안군","홍성군");
   var areaMid8 = new Array("괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시 상당구","청주시 서원구","청주시 청원구","청주시 흥덕구","충주시");
   var areaMid9 = new Array("강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구");
   var areaMid10 = new Array("남구","동구","북구","울주군","중구");
   var areaMid11 = new Array("거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시 마산합포구","창원시 마산회원구","창원시 성산구","창원시 의창구","창원시 진해구","통영시","하동군","함안군","함양군","합천군");
   var areaMid12 = new Array("경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시 남구","포항시 북구");
   var areaMid13 = new Array("남구","달서구","달성군","동구","북구","서구","수성구","중구");
   var areaMid14 = new Array("광산구","남구","동구","북구","서구");
   var areaMid15 = new Array("강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군");
   var areaMid16 = new Array("고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시 덕진구","전주시 완산군","정읍시","진안군");
   var areaMid17 = new Array("서귀포시","제주시");
  
   
<!--1차지역선택  -->
function areachange(item){ 
	// item은 select박스에서 선택한 option의 인덱스(순서대로 1,2,3,... 를 가져옴)
    var temp, i=0, j=0;
    var ccount, cselect;
    
    //alert("item : "+item);
    
    temp = document.makeGathering.areaMid; 
    // 다음 셀렉트박스, 즉 서울시를 선택하면   강남구, 강서구 등등, 결과를 뿌릴 셀렉트 박스의 주소를 가져옴
    /* temp는 선택된 것에 따른 결과를 뿌릴 selectbox의 name */
    
    //alert("전에 선택한카테고리맞는 배열의 길이"+temp.options.length); // 결과를 뿌릴 셀렉트박스의 현재 option의수를 구함 , 즉 제주도 검색하고, 지금 서울을 검색하려고 하면 길이 2(서귀포시, 제주시)가 나옴
    for (i=(temp.options.length-1) ; i>0 ; i--){ /* 전에 설정되있던 옵션을을 초기화 시킴 */
		temp.options[i] = null; 
    }
    eval('ccount = areaMid' + item + '.length'); // ccount = areaMid14.length 이게됨, areaMid선택한익덱스.length임
    //alert('ccount = areaMid' + item + '.length');
   
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = areaMid' + item + '[' + j + '];'); // cselect = areaMid14[0] ~ cselect = areaMid14[4]; 까지 반복, areaMid14 배열에는 5개의 값이 있음
        //alert('cselect = areaMid' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect);  
        // new Option('text값1','value값1');
        /* 
        	<option value="text값1">value값1</option>
        	
        	* 광주일 경우,
        	<option value="광산구">광산구</option>
			<option value="남구">남구</option>
        	<option value="동구">동구</option>
			<option value="북구">북구</option>
        	<option value="서구">서구</option>        
        */
    }
    
    temp.options[0].selected=true;
    return true;
}
</script>


<!-- ========================================================================================================================== -->

<!-- 카테고리 코드 셀렉트 박스 스크립트 -->
<script type="text/javascript">

/* <!-- 카테고리 그룹 1차 중분류 선택 배열 --> */
var categoryMid0 = new Array("-선택-",""); 
var categoryMid1 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var categoryMid2 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var categoryMid3 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");

/* <!-- 카테고리 그룹 1차 소분류 선택 배열 --> */
var categoryBot0 = new Array("중국어","일본어","독일어","아랍어","태국어","스페인어","러시아어","프랑스어","베트남어","외국어 기타");
var categoryBot1 = new Array("토익","토플","텝스","토스","영어회화","작문/독해","번역","미드","영어 기타");
var categoryBot2 = new Array("기타/우쿠렐라","피아노/키보드","보컬/음악이론","작사/작곡","밴드","국악","연기/연극/뮤지컬","댄스무용","진행/행사","마술/음악공연 기타");
var categoryBot3 = new Array("육아","반려동물","금융/재테크","상담/컨설팅","건강/웰빙","사주/타로","독서/글쓰기","사진/영상","키덜트","생활공예","요리/베이킹","인테리어");
var categoryBot4 = new Array("자소서/면접","인적성","스피치","자격증","기업공채","공모전/대외활동","창업/스타트업","취업 기타");
var categoryBot5 = new Array("리그오브레전드","도타","피파온라인","오버워치","서든어택","온라인게임","PC게임","모바일게임","보드게임","게임 기타");
var categoryBot6 = new Array("축구","야구","농구","테니스","배드민턴","골프","등산","수영","자전거","스케이트/보드","요가/에어로빅","헬스/다이어트","무예/무술","시즌스포츠","스포츠 기타");
var categoryBot7 = new Array("헤어","네일아트","피부관리","메이크업","반영구 메이크업","스타일/코디","뷰티/미용 기타");
var categoryBot8 = new Array("알고리즘","응용프로그래밍","웹프로그래밍","모바일프로그래밍","데이터베이스/서버","게임프로그래밍","문서작성/편집","컴퓨터자격증","사물인터넷","하드웨어","컴퓨터 기타");
var categoryBot9 = new Array("행정","교육","경찰","소방","의료/보건","사법","기술","회계","국방","공무원 기타");
var categoryBot10 = new Array("웹/모바일 디자인","일러스트/삽화","광고/영상","만화/웹툰","편집디자인","패션디자인","3D/VFX","도예/세라믹","캘러리그라피","회화","디자인/미술 기타");


/* 카테고리 그룹 선택 1-1  */
function categoryTopChange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.makeGathering.categoryMid;
    

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null;      
    }
    eval('ccount = categoryMid' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = categoryMid' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    
    temp.options[0].selected=true;
    return true;
}


/*카테고리 그룹 선택 1-2  */
function categoryMidChange(item){
    var temp, i=0, j=0;
    var ccount, cselect;
    
    temp = document.makeGathering.categoryBot;

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = categoryBot' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = categoryBot' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
        
    temp.options[0].selected=true;
    return true;
}

</script>

<!-- 공통 헤더 -->
<%@include file="../header.jsp"%>

</head>

<body>

	<!-- 부트스트랩을 감싸는 컨테이너 -->
	<div class="container">

		<!-- row는 수평 horizen과 같음, 왼쪽부터 배치하겠다  -->
		<div class="row row-offcanvas row-offcanvas-right">
			
			<%@ include file="./gathering_sidebar.jspf"%>
			
			<!--/.sidebar-offcanvas-->

			<br> <br> <br> <br>
			<div class="col-xs-12 col-sm-10">
				<div class="row">
			
<!-- ********************************* 폼테그 시작 -->
					<form id="gMake" name="makeGathering" class="form-horizontal" action="/gather/gatheringModify" method="post" enctype="multipart/form-data">
						<input type="hidden" name="guserId" value="${pdto.guserId}" />

						<!-- 주제 -->
						<div class="form-group">
							<!-- 입력항목이름 -->
							<label for="ID" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="gatherSubject" placeholder="제목를 작성해 주세영">
							</div>
						</div>

						<!-- 모집분류  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">모집분류</label>
							
							<div class="dropdown">
								<div class="col-sm-3">
									<select class="form-control" name="categoryTop" onChange="categoryTopChange(this.options.selectedIndex)">
										<option selected value="">-선택-</option>
										<option value="스터디">스터디</option>
										<option value="동호회">동호회</option>
										<option value="컨퍼런스">컨퍼런스</option>
									</select>
								</div>	
								
								<div class="col-sm-3">
									<select class="form-control" name="categoryMid" onChange="categoryMidChange(this.options.selectedIndex)">
										<option selected value="">-선택-</option>
										<option value=""></option>
									</select>
								</div>	
								
								<div class="col-sm-3">							
									<select class="form-control" name="categoryBot">
											<option selected value="">-선택-</option>
											<option value=""></option>
									</select>
								</div>
							</div>
						</div>

						<!-- 기간 -->
						<div class="form-group">
							<label for="date" class="col-sm-2 control-label">기간</label>

							<div class="col-sm-3">
								<input type="date" class="form-control" name="gatherSdate">
							</div>
							<div class="col-sm-1">부터</div>
							
							<div class="col-sm-3">
								<input type="date" class="form-control" name="gatherEdate">
							</div>
							<div class="col-sm-1">까지 </div>
						</div>

						<!-- 요일 -->
						<div class="form-group">
							<label for="Gender" class="col-sm-2 control-label">요일</label>
							<div class="col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" name="gatherDay" value="월">월&nbsp; </label> 
									<label><input type="checkbox" name="gatherDay" value="화">화&nbsp; </label> 
									<label><input type="checkbox" name="gatherDay" value="수">수&nbsp; </label> 
									<label><input type="checkbox" name="gatherDay" value="목">목&nbsp; </label> 
									<label><input type="checkbox" name="gatherDay" value="금">금&nbsp; </label> 
									<label><input type="checkbox" name="gatherDay" value="토">토&nbsp; </label> 
									<label><input type="checkbox" name="gatherDay" value="일">일&nbsp; </label>
								</div>
							</div>
						</div>

						<!-- 지역  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">지역</label>
							<div class="dropdown">
								
								<div class="col-sm-3">
									<select class="form-control" name="areaTop" onChange="areachange(this.options.selectedIndex)"> <!-- this.options.selectedIndex 선택된 인덱스를 가져옴  -->
										<option selected value="">-선택-</option>
										<option value="서울특별시">서울특별시</option>
										<option value="경기도">경기도</option>
										<option value="인천광역시">인천광역시</option>
										<option value="강원도">강원도</option>
										<option value="대전광역시">대전광역시</option>
										<option value="세종특별자치시">세종특별자치시</option>
										<option value="충청남도">충청남도</option>
										<option value="충청북도">충청북도</option>
										<option value="부산광역시">부산광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="경상남도">경상남도</option>
										<option value="경상북도">경상북도</option>
										<option value="대구광역시">대구광역시</option>
										<option value="광주광역시">광주광역시</option>
										<option value="전라남도">전라남도</option>
										<option value="전라북도">전라북도</option>
										<option value="제주특별자치도">제주특별자치도</option>
									</select>
								</div>
								
								<div class="col-sm-3">
									<select class="form-control" name="areaMid">
										<option selected value="">-선택-</option>
										<option value=""></option>
									</select>
								</div>
							</div>

						</div>

						<!-- 장소  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">장소</label>
							<div class="col-sm-5">
								<input type="text" id="gPlace" class="form-control" name="gatherPlace" placeholder="지역을 입력해주세영? 뭔지 잘 몰것음">
							</div>
							<div class="col-sm-2">
								<input type="button" class="btn btn-default" value="장소추천">
							</div>

						</div>

						<!-- 인원  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">인원</label>
							<div class="col-sm-1">
								<input type="text" id="gParti" class="form-control" name="gatherPartiMax" placeholder="인원수">
							</div>명
						</div>

						<!-- 모집분류  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">상세정보</label>
							<div class="col-sm-7">
								<textarea id="gContent" class="form-control" rows="5" name="gatherContent"
									placeholder="상세내용을 입력해 주세영"></textarea>
							</div>
						</div>

						<!-- 이미지 올리기  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">썸네일(오늘) 사진</label>
							<div class="col-sm-7">
								<input id="fileName" type="file" name="gatherImg" >
							</div>
						</div>

						<br>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" id="btn" onclick="form_check()" class="btn btn-default">신청</button>
							</div>
						</div>
					</form>

				</div>
				<!--/row-->
			</div>
			<!--/.col-xs-12.col-sm-9-->
		</div>
		<!--/row-->

		<hr>

		<!-- [Footer] 페이지 하단 -->
		<hr>
		<%@include file = "../footer.jsp"%>

	</div>
	<!--/.container-->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/dist/js/bootstrap.min.js"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/resources/assets/js/ie10-viewport-bug-workaround.js"></script>

	<script src="/resources/examples/offcanvas/offcanvas.js"></script>
</body>
</html>
