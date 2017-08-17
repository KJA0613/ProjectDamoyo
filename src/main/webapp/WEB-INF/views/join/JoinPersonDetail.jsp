<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
   function TwoSubmit() {
   		document.signform.submit();
   }
</script>


<!--지역상세스크립트  -->
<script type="text/javascript">
<!--1차지역상세배열  -->
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

<!--2차지역상세배열  -->   
   var areaP0 = new Array("-선택-","");
   var areaP1 = new Array("강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구");
   var areaP2 = new Array("가평군","고양시덕양구","고양시일산동구","고양시일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시소사구","부천시오정구","부천시원미구","성남시분당구","성남시수정구","성남시중원구","수원시권선구","수원시영통구","수원시장안구","수원시팔달구","시흥시","안산시단원구","안산시상록구","안성시","안양시동안구","안양시만안구","양주시","양평군","여주시","연천군","오산시","용인시기흥구","용인시수지구","용인시처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시");
   var areaP3 = new Array("강화군","계양구","남구","남동구","동구","부평구","서구","연수구","옹진군","중구");
   var areaP4 = new Array("강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군");
   var areaP5 = new Array("대덕구","동구","서구","유성구","중구");
   var areaP6 = new Array("세종시");
   var areaP7 = new Array("계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시동남구","천안시서북구","청양군","태안군","홍성군");
   var areaP8 = new Array("괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시상당구","청주시서원구","청주시청원구","청주시흥덕구","충주시");
   var areaP9 = new Array("강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구");
   var areaP10 = new Array("남구","동구","북구","울주군","중구");
   var areaP11 = new Array("거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시마산합포구","창원시마산회원구","창원시성산구","창원시의창구","창원시진해구","통영시","하동군","함안군","함양군","합천군");
   var areaP12 = new Array("경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시남구","포항시북구");
   var areaP13 = new Array("남구","달서구","달성군","동구","북구","서구","수성구","중구");
   var areaP14 = new Array("광산구","남구","동구","북구","서구");
   var areaP15 = new Array("강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군");
   var areaP16 = new Array("고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시덕진구","전주시완산군","정읍시","진안군");
   var areaP17 = new Array("서귀포시","제주시");

<!--3차지역상세배열  -->   
   var areaPP0 = new Array("-선택-","");
   var areaPP1 = new Array("강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구");
   var areaPP2 = new Array("가평군","고양시덕양구","고양시일산동구","고양시일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시소사구","부천시오정구","부천시원미구","성남시분당구","성남시수정구","성남시중원구","수원시권선구","수원시영통구","수원시장안구","수원시팔달구","시흥시","안산시단원구","안산시상록구","안성시","안양시동안구","안양시만안구","양주시","양평군","여주시","연천군","오산시","용인시기흥구","용인시수지구","용인시처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시");
   var areaPP3 = new Array("강화군","계양구","남구","남동구","동구","부평구","서구","연수구","옹진군","중구");
   var areaPP4 = new Array("강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군");
   var areaPP5 = new Array("대덕구","동구","서구","유성구","중구");
   var areaPP6 = new Array("세종시");
   var areaPP7 = new Array("계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시동남구","천안시서북구","청양군","태안군","홍성군");
   var areaPP8 = new Array("괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시상당구","청주시서원구","청주시청원구","청주시흥덕구","충주시");
   var areaPP9 = new Array("강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구");
   var areaPP10 = new Array("남구","동구","북구","울주군","중구");
   var areaPP11 = new Array("거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시마산합포구","창원시마산회원구","창원시성산구","창원시의창구","창원시진해구","통영시","하동군","함안군","함양군","합천군");
   var areaPP12 = new Array("경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시남구","포항시북구");
   var areaPP13 = new Array("남구","달서구","달성군","동구","북구","서구","수성구","중구");
   var areaPP14 = new Array("광산구","남구","동구","북구","서구");
   var areaPP15 = new Array("강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군");
   var areaPP16 = new Array("고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시덕진구","전주시완산군","정읍시","진안군");
   var areaPP17 = new Array("서귀포시","제주시");
   
   
<!--1차지역선택  -->
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
<!--2차지역선택  -->
function areachange2(item){
    var temp1, i=0, j=0;
    var ccount, cselect;

    temp1 = document.signform.areaP;

    for (i=(temp1.options.length-1) ; i>0 ; i--){ temp1.options[i] = null; }
    eval('ccount = areaP' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = areaP' + item + '[' + j + '];');
        temp1.options[j]= new Option(cselect,cselect); 
    }
    
    temp1.options[0].selected=true;
    return true;
}
<!--3차지역선택  -->
function areachange3(item){
    var temp2, i=0, j=0;
    var ccount, cselect;

    temp2 = document.signform.areaPP;

    for (i=(temp2.options.length-1) ; i>0 ; i--){ temp2.options[i] = null; }
    eval('ccount = areaPP' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = areaPP' + item + '[' + j + '];');
        temp2.options[j]= new Option(cselect,cselect); 
    }
    
    temp2.options[0].selected=true;
    return true;
}

</script>


<!-- ========================================================================================================================== -->

<!-- 카테고리 코드 셀렉트 박스 스크립트 -->
<script type="text/javascript">
<!-- 카테고리 그룹 1차 중분류 선택 배열 -->
var catMidOne0 = new Array("-선택-",""); 
var catMidOne1 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidOne2 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidOne3 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");


/* <!-- 카테고리 그룹 1차 소분류 선택 배열 --> */
var catBotOne0 = new Array("중국어","일본어","독일어","아랍어","태국어","스페인어","러시아어","프랑스어","베트남어","외국어 기타");
var catBotOne1 = new Array("토익","토플","텝스","토스","영어회화","작문/독해","번역","미드","영어 기타");
var catBotOne2 = new Array("기타/우쿠렐라","피아노/키보드","보컬/음악이론","작사/작곡","밴드","국악","연기/연극/뮤지컬","댄스무용","진행/행사","마술/음악공연 기타");
var catBotOne3 = new Array("육아","반려동물","금융/재테크","상담/컨설팅","건강/웰빙","사주/타로","독서/글쓰기","사진/영상","키덜트","생활공예","요리/베이킹","인테리어");
var catBotOne4 = new Array("자소서/면접","인적성","스피치","자격증","기업공채","공모전/대외활동","창업/스타트업","취업 기타");
var catBotOne5 = new Array("리그오브레전드","도타","피파온라인","오버워치","서든어택","온라인게임","PC게임","모바일게임","보드게임","게임 기타");
var catBotOne6 = new Array("축구","야구","농구","테니스","배드민턴","골프","등산","수영","자전거","스케이트/보드","요가/에어로빅","헬스/다이어트","무예/무술","시즌스포츠","스포츠 기타");
var catBotOne7 = new Array("헤어","네일아트","피부관리","메이크업","반영구 메이크업","스타일/코디","뷰티/미용 기타");
var catBotOne8 = new Array("알고리즘","응용프로그래밍","웹프로그래밍","모바일프로그래밍","데이터베이스/서버","게임프로그래밍","문서작성/편집","컴퓨터자격증","사물인터넷","하드웨어","컴퓨터 기타");
var catBotOne9 = new Array("행정","교육","경찰","소방","의료/보건","사법","기술","회계","국방","공무원 기타");
var catBotOne10 = new Array("웹/모바일 디자인","일러스트/삽화","광고/영상","만화/웹툰","편집디자인","패션디자인","3D/VFX","도예/세라믹","캘러리그라피","회화","디자인/미술 기타");

/* <!-- 카테고리 그룹 2차 중분류 선택 배열 --> */
var catMidTwo0 = new Array("-선택-",""); 
var catMidTwo1 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidTwo2 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidTwo3 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");


/* <!-- 카테고리 그룹 2차 소분류 선택 배열 --> */
var catBotTwo0 = new Array("중국어","일본어","독일어","아랍어","태국어","스페인어","러시아어","프랑스어","베트남어","외국어 기타");
var catBotTwo1 = new Array("토익","토플","텝스","토스","영어회화","작문/독해","번역","미드","영어 기타");
var catBotTwo2 = new Array("기타/우쿠렐라","피아노/키보드","보컬/음악이론","작사/작곡","밴드","국악","연기/연극/뮤지컬","댄스무용","진행/행사","마술/음악공연 기타");
var catBotTwo3 = new Array("육아","반려동물","금융/재테크","상담/컨설팅","건강/웰빙","사주/타로","독서/글쓰기","사진/영상","키덜트","생활공예","요리/베이킹","인테리어");
var catBotTwo4 = new Array("자소서/면접","인적성","스피치","자격증","기업공채","공모전/대외활동","창업/스타트업","취업 기타");
var catBotTwo5 = new Array("리그오브레전드","도타","피파온라인","오버워치","서든어택","온라인게임","PC게임","모바일게임","보드게임","게임 기타");
var catBotTwo6 = new Array("축구","야구","농구","테니스","배드민턴","골프","등산","수영","자전거","스케이트/보드","요가/에어로빅","헬스/다이어트","무예/무술","시즌스포츠","스포츠 기타");
var catBotTwo7 = new Array("헤어","네일아트","피부관리","메이크업","반영구 메이크업","스타일/코디","뷰티/미용 기타");
var catBotTwo8 = new Array("알고리즘","응용프로그래밍","웹프로그래밍","모바일프로그래밍","데이터베이스/서버","게임프로그래밍","문서작성/편집","컴퓨터자격증","사물인터넷","하드웨어","컴퓨터 기타");
var catBotTwo9 = new Array("행정","교육","경찰","소방","의료/보건","사법","기술","회계","국방","공무원 기타");
var catBotTwo10 = new Array("웹/모바일 디자인","일러스트/삽화","광고/영상","만화/웹툰","편집디자인","패션디자인","3D/VFX","도예/세라믹","캘러리그라피","회화","디자인/미술 기타");


/* <!-- 카테고리 그룹 3차 중분류 선택 배열 --> */
var catMidThr0 = new Array("-선택-",""); 
var catMidThr1 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidThr2 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidThr3 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");


/*<!-- 카테고리 그룹 3차 소분류 선택 배열 -->*/
var catBotThr0 = new Array("중국어","일본어","독일어","아랍어","태국어","스페인어","러시아어","프랑스어","베트남어","외국어 기타");
var catBotThr1 = new Array("토익","토플","텝스","토스","영어회화","작문/독해","번역","미드","영어 기타");
var catBotThr2 = new Array("기타/우쿠렐라","피아노/키보드","보컬/음악이론","작사/작곡","밴드","국악","연기/연극/뮤지컬","댄스무용","진행/행사","마술/음악공연 기타");
var catBotThr3 = new Array("육아","반려동물","금융/재테크","상담/컨설팅","건강/웰빙","사주/타로","독서/글쓰기","사진/영상","키덜트","생활공예","요리/베이킹","인테리어");
var catBotThr4 = new Array("자소서/면접","인적성","스피치","자격증","기업공채","공모전/대외활동","창업/스타트업","취업 기타");
var catBotThr5 = new Array("리그오브레전드","도타","피파온라인","오버워치","서든어택","온라인게임","PC게임","모바일게임","보드게임","게임 기타");
var catBotThr6 = new Array("축구","야구","농구","테니스","배드민턴","골프","등산","수영","자전거","스케이트/보드","요가/에어로빅","헬스/다이어트","무예/무술","시즌스포츠","스포츠 기타");
var catBotThr7 = new Array("헤어","네일아트","피부관리","메이크업","반영구 메이크업","스타일/코디","뷰티/미용 기타");
var catBotThr8 = new Array("알고리즘","응용프로그래밍","웹프로그래밍","모바일프로그래밍","데이터베이스/서버","게임프로그래밍","문서작성/편집","컴퓨터자격증","사물인터넷","하드웨어","컴퓨터 기타");
var catBotThr9 = new Array("행정","교육","경찰","소방","의료/보건","사법","기술","회계","국방","공무원 기타");
var catBotThr10 = new Array("웹/모바일 디자인","일러스트/삽화","광고/영상","만화/웹툰","편집디자인","패션디자인","3D/VFX","도예/세라믹","캘러리그라피","회화","디자인/미술 기타");



/*카테고리 그룹 선택 1-1  */
function catChangeOne(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.catMidOne;
    

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catMidOne' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catMidOne' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    
    temp.options[0].selected=true;
    return true;
}

/*카테고리 그룹 선택 1-2  */
function catMidChangeOne(item){
    var temp, i=0, j=0;
    var ccount, cselect;

  
    temp = document.signform.catBotOne;

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catBotOne' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catBotOne' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
        
    temp.options[0].selected=true;
    return true;
}

/*카테고리 그룹 선택 2-1  */
function catChangeTwo(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.catMidTwo;
    

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catMidTwo' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catMidTwo' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    
    temp.options[0].selected=true;
    return true;
}
/*카테고리 그룹 선택 2-2  */
function catMidChangeTwo(item){
    var temp, i=0, j=0;
    var ccount, cselect;

  
    temp = document.signform.catBotTwo;

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catBotTwo' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catBotTwo' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
        
    temp.options[0].selected=true;
    return true;
}

/*카테고리 그룹 선택 3-1  */
function catChangeThr(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.catMidThr;
    

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catMidThr' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catMidThr' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    
    temp.options[0].selected=true;
    return true;
}
/*카테고리 그룹 선택 3-2  */
function catMidChangeThr(item){
    var temp, i=0, j=0;
    var ccount, cselect;

  
    temp = document.signform.catBotThr;

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catBotThr' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catBotThr' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
        
    temp.options[0].selected=true;
    return true;
}
</script>


<script>
	
</script>

<title>개인회원가입2차상세페이지</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
   .navbar-inverse {
       background-color: #2bb7d5;
       border-color: #00a3cc;
   }
   .navbar {
       margin: 0;
       border: none;
       border-bottom: 2px solid #95daea;
       border-radius: 0;
   }
   .navbar .navbar-brand{
       color: #fff;
       font-size: 28px;
       font-weight: bold;
   }
   
   .navbar-inverse .navbar-nav > li > a {
      color: white;
   }   
</style>

<!-- [Header2] Navigation Bar로 구현 > 로그인 폼 페이지 > 아무것도 안 보이게 하기  -->
<%@include file = "../header.jsp"%>

</head>

<body>	
	
	<!-- [Content] 개인 회원가입 폼 내용부분 -->
    <div class="container" id="data">
    	<div class="clearfix">
			<div class="col-md-8 col-md-offset-2">	
				<h1>개인 회원가입</h1>	
				<!-- 도움말 -->
				<p class="help-block">
					&nbsp;<small>* [2단계] 모임을 희망하는 지역 및 카테고리를 선택 해주세요.</small>
				</p>				
				<br>
				
				<!-- 회원가입입력폼 : 2단계 -->
				<form action="/join/PersonDatailRegist" method="post" name="signform" id="per">
			         <h4><strong>모임 희망 지역</strong></h4>	
			         <div id=list1>
			            <div class="dropdown">
			
			               <table cellpadding=1>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                  </tr>
			                  <tr>
			                     <!--1차지역선택  -->
			                     <td><select name="bigarea1" class="form-control" onChange="areachange(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
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
			                     </select></td>
			
			                     <td><select name="area" class="form-control" size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                  </tr>
			                  <tr>
			                     <!--2차지역선택  -->
			                     <td><select name="bigarea2" class="form-control" onChange="areachange2(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
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
			                     </select></td>
			                     <td><select name="areaP" class="form-control" size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                  </tr>
			                  <tr>
			                     <!--3차지역선택  -->
			                     <td><select name="bigarea3" class="form-control" onChange="areachange3(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
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
			                     </select></td>
			                     <td><select name="areaPP" class="form-control" size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			
			                     <!-- <td>
			                     <button type="submit">go</button>
			                  </td> -->
			                  </tr>
			
			               </table>
			            </div>
			         </div>
				
					 <br><br>
			        
					 <h4><strong>희망 카테고리</strong></h4>										
			         <!-- 카테고리 선택 -->
			         <div id=list2>
			            <div class="dropdown">
			               <!-- 카테고리 그룹 선택 3-1 -->
			               <table cellpadding=1>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                     <td>3차</td>
			                  </tr>
			                  <tr>
			                     <!--1차카테고리선택  -->
			                     <td><select name="catTopOne" class="form-control" onChange="catChangeOne(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=1>스터디(취업/시험 대비)</option>
			                           <option value=2>동호회(취미)</option>
			                           <option value=3>컨퍼런스</option>
			
			                     </select></td>
			                     <!--2차카테고리선택  -->
			                     <td><select name="catMidOne" size=1 class="form-control" onChange="catMidChangeOne(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                     <!--3차카테고리선택  -->
			                     <td><select name="catBotOne" class="form-control" size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                  </tr>
			               </table>
			
			               <!-- 카테고리 그룹 선택 3-2 -->
			               <table cellpadding=1>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                     <td>3차</td>
			                  </tr>
			                  <tr>
			                     <!--1차카테고리선택  -->
			                     <td><select name="catTopTwo" class="form-control" onChange="catChangeTwo(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=1>스터디(취업/시험 대비)</option>
			                           <option value=2>동호회(취미)</option>
			                           <option value=3>컨퍼런스</option>
			
			                     </select></td>
			                     <!--2차카테고리선택  -->
			                     <td><select name="catMidTwo" class="form-control" size=1 onChange="catMidChangeTwo(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                     <!--3차카테고리선택  -->
			                     <td><select name="catBotTwo" class="form-control" size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                  </tr>
			               </table>
			
			               <!-- 카테고리 그룹 선택 3-3 -->
			               <table cellpadding=1>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                     <td>3차</td>
			                  </tr>
			                  <tr>
			                     <!--1차카테고리선택  -->
			                     <td><select name="catTopThr" class="form-control" onChange="catChangeThr(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=1>스터디(취업/시험 대비)</option>
			                           <option value=2>동호회(취미)</option>
			                           <option value=3>컨퍼런스</option>
			
			                     </select></td>
			                     <!--2차카테고리선택  -->
			                     <td><select name="catMidThr" size=1 class="form-control" onChange="catMidChangeThr(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                     <!--3차카테고리선택  -->
			                     <td><select name="catBotThr" class="form-control"size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                  </tr>
			                  <!-- <td>
			               <button type="submit">go</button>
			            </td> -->
			
			               </table>
			            </div>
			         </div>
					 					 
					 <hr>
					 
					 <!-- 2단계 확인 버튼 -->
					 <div class="clear-fix">
						<p class="pull-left">
							<small>
								DAMOYO 회원가입 총 2단계로 진행하고 있습니다.<br>
								2단계에서는 희망지역 및 카테고리 입력을 통해 추천 서비스를 제공합니다.<br>
							</small>
						</p>
						<div class="pull-right">
							<button type="submit" onClick="javascript:TwoSubmit()" class="btn btn-primary">2단계 완료</button>
						</div>
					 </div>
					 
					 <!-- 회원가입하려는 사용자 정보 (1단계에서 입력한 내용) > hidden 처리 -->
					 <input type="hidden" name="guserId" value="${pdto.guserId}">
					 <input type="hidden" name="guserPw" value="${pdto.guserPw}">
					 <input type="hidden" name="guserName" value="${pdto.guserName}">
					 <input type="hidden" name="guserGender" value="${pdto.guserGender}">
					 <input type="hidden" name="guserPhone" value="${pdto.guserPhone}">
					 <input type="hidden" name="guserEmail" value="${pdto.guserEmail}">
					 <input type="hidden" name="guserCode" value="${pdto.guserCode}">
			         <!-- <input type="button" onClick="javascript:TwoSubmit()" value="확인 및 가입완료"> -->
			
			      </form>
      	</div>
	</div>
	
	
    <!-- [Footer] 페이지 하단 (고정화면) -->
	<hr>
	<%@include file = "../footer.jsp"%>
	
   </div>
   
</body>
</html>