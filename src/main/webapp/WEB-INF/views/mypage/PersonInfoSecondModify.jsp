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

    // ccount : 각 지역의 총 갯수 (세종시: 1개)
    for (i=(temp.options.length-1) ; i>0 ; i--){ 
    	temp.options[i] = null; }
    eval('ccount = area' + item + '.length');       
    
    // cselect : 서울특별시 > 중랑구 (각 시의 맨 마지막 지역)
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

<title>희망지역, 카테고리 수정</title>


<!-- [Header] 공통 헤더 -->
<%@include file = "../header.jsp"%>
</head>

<body>	

	<!-- [Content] 개인 회원가입 폼 내용부분 -->
	<div class="container">
	    <!-- 타이틀 -->
        <div class="page-header clearfix">
           <h1>마이페이지</h1>      
        </div>
        
        <div id="changeMyInfo" class="tab-pane fade active in">  
	         <div id="myPageSetting" class="row">
	         <!--/// [왼쪽/리스트 목록]: 12칸 중 "3칸" 크기 확보 ///-->
	         <div class="col-md-3">         
	         	<%@include file = "MyPageSidebar.jsp"%>
	         </div>
	         
	         <!--/// [오른쪽/해당되는 내용]: 12칸 중 "9칸" 크기 확보 ///-->
			 <div class="col-md-9">
				<div class="tab-content">   
				<div class="panel panel-default">
					<!--/// 제목 ///-->
					<div class="panel-heading">
						<h4><strong>회원정보수정 - 2단계</strong></h4>					
					</div>
						
					<!--/// 내용 ///-->
					<div class="panel-body">
						<!-- 도움말 -->
						<p class="help-block">
							&nbsp;<small>* 희망지역 및 카테고리들을 수정 및 확인하실 수 있습니다.</small>
						</p>
						<br>
						
						<!-- [Form] 희망지역, 희망카테고리 수정 -->
						<form action="" method="post" name="signform" id="per">
						         <h4>모임 희망지역</h4>
						         <div id=list1>
						            <div class="dropdown">
						
						               <table cellpadding=1>
						                  <tr>
						                     <td>1차</td>
						                     <td>2차</td>
						                  </tr>
						                  <tr>
						                     <!--1차지역선택  -->
						                     <td>
							                     <select class="form-control" id="bigarea1" name="bigarea1" onChange="areachange(this.options.selectedIndex)">
							                           <option selected value="">-선택-</option>
								                       <option value="1" <c:if test="${adto.bigarea1 eq '1'}">selected="selected"</c:if>>서울특별시</option>
								                       <option value="2" <c:if test="${adto.bigarea1 eq '2'}">selected="selected"</c:if>>경기도</option>
								                       <option value="3" <c:if test="${adto.bigarea1 eq '3'}">selected="selected"</c:if>>인천광역시</option>
								                       <option value="4" <c:if test="${adto.bigarea1 eq '4'}">selected="selected"</c:if>>강원도</option>
								                       <option value="5" <c:if test="${adto.bigarea1 eq '5'}">selected="selected"</c:if>>대전광역시</option>
								                       <option value="6" <c:if test="${adto.bigarea1 eq '6'}">selected="selected"</c:if>>세종특별자치시</option>
								                       <option value="7" <c:if test="${adto.bigarea1 eq '7'}">selected="selected"</c:if>>충청남도</option>
								                       <option value="8" <c:if test="${adto.bigarea1 eq '8'}">selected="selected"</c:if>>충청북도</option>
								                       <option value="9" <c:if test="${adto.bigarea1 eq '9'}">selected="selected"</c:if>>부산광역시</option>
								                       <option value="10" <c:if test="${adto.bigarea1 eq '10'}">selected="selected"</c:if>>울산광역시</option>
								                       <option value="11" <c:if test="${adto.bigarea1 eq '11'}">selected="selected"</c:if>>경상남도</option>
								                       <option value="12" <c:if test="${adto.bigarea1 eq '12'}">selected="selected"</c:if>>경상북도</option>
								                       <option value="13" <c:if test="${adto.bigarea1 eq '13'}">selected="selected"</c:if>>대구광역시</option>
								                       <option value="14" <c:if test="${adto.bigarea1 eq '14'}">selected="selected"</c:if>>광주광역시</option>
								                       <option value="15" <c:if test="${adto.bigarea1 eq '15'}">selected="selected"</c:if>>전라남도</option>
								                       <option value="16" <c:if test="${adto.bigarea1 eq '16'}">selected="selected"</c:if>>전라북도</option>
								                       <option value="17" <c:if test="${adto.bigarea1 eq '17'}">selected="selected"</c:if>>제주특별자치도</option>
							                     </select>
						                     </td>
											 
						                     <td>					                     
						                     
						                     <select class="form-control" name="area" size=1>
							                     <%-- <c:forEach var = "adto" items="${adto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${adto.area}">${adto.area}</option>					                      
							                     <%-- </c:forEach> --%>
						                     </select>
						                     
						                     </td>
						                  <tr>
						                     <td>1차</td>
						                     <td>2차</td>
						                  </tr>
						                  <tr>
						                     <!--2차지역선택  -->
						                     <td><select class="form-control" id="bigarea2" name="bigarea2" onChange="areachange2(this.options.selectedIndex)">
						                           <option selected value="">-선택-</option>
								                       <option value="1" <c:if test="${adto.bigarea2 eq '1'}">selected="selected"</c:if>>서울특별시</option>
								                       <option value="2" <c:if test="${adto.bigarea2 eq '2'}">selected="selected"</c:if>>경기도</option>
								                       <option value="3" <c:if test="${adto.bigarea2 eq '3'}">selected="selected"</c:if>>인천광역시</option>
								                       <option value="4" <c:if test="${adto.bigarea2 eq '4'}">selected="selected"</c:if>>강원도</option>
								                       <option value="5" <c:if test="${adto.bigarea2 eq '5'}">selected="selected"</c:if>>대전광역시</option>
								                       <option value="6" <c:if test="${adto.bigarea2 eq '6'}">selected="selected"</c:if>>세종특별자치시</option>
								                       <option value="7" <c:if test="${adto.bigarea2 eq '7'}">selected="selected"</c:if>>충청남도</option>
								                       <option value="8" <c:if test="${adto.bigarea2 eq '8'}">selected="selected"</c:if>>충청북도</option>
								                       <option value="9" <c:if test="${adto.bigarea2 eq '9'}">selected="selected"</c:if>>부산광역시</option>
								                       <option value="10" <c:if test="${adto.bigarea2 eq '10'}">selected="selected"</c:if>>울산광역시</option>
								                       <option value="11" <c:if test="${adto.bigarea2 eq '11'}">selected="selected"</c:if>>경상남도</option>
								                       <option value="12" <c:if test="${adto.bigarea2 eq '12'}">selected="selected"</c:if>>경상북도</option>
								                       <option value="13" <c:if test="${adto.bigarea2 eq '13'}">selected="selected"</c:if>>대구광역시</option>
								                       <option value="14" <c:if test="${adto.bigarea2 eq '14'}">selected="selected"</c:if>>광주광역시</option>
								                       <option value="15" <c:if test="${adto.bigarea2 eq '15'}">selected="selected"</c:if>>전라남도</option>
								                       <option value="16" <c:if test="${adto.bigarea2 eq '16'}">selected="selected"</c:if>>전라북도</option>
								                       <option value="17" <c:if test="${adto.bigarea2 eq '17'}">selected="selected"</c:if>>제주특별자치도</option>
						                     </select></td>
						                     <td><select class="form-control" name="areaP" size=1>
						                        <%-- <c:forEach var = "adto" items="${adto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${adto.areaP}">${adto.areaP}</option>					                      
							                     <%-- </c:forEach> --%>
						                     </select></td>
						                  <tr>
						                     <td>1차</td>
						                     <td>2차</td>
						                  </tr>
						                  <tr>
						                     <!--3차지역선택  -->
						                     <td><select class="form-control" id="bigarea3" name="bigarea3" onChange="areachange3(this.options.selectedIndex)">
						                           	   <option selected value="">-선택-</option>
								                       <option value="1" <c:if test="${adto.bigarea3 eq '1'}">selected="selected"</c:if>>서울특별시</option>
								                       <option value="2" <c:if test="${adto.bigarea3 eq '2'}">selected="selected"</c:if>>경기도</option>
								                       <option value="3" <c:if test="${adto.bigarea3 eq '3'}">selected="selected"</c:if>>인천광역시</option>
								                       <option value="4" <c:if test="${adto.bigarea3 eq '4'}">selected="selected"</c:if>>강원도</option>
								                       <option value="5" <c:if test="${adto.bigarea3 eq '5'}">selected="selected"</c:if>>대전광역시</option>
								                       <option value="6" <c:if test="${adto.bigarea3 eq '6'}">selected="selected"</c:if>>세종특별자치시</option>
								                       <option value="7" <c:if test="${adto.bigarea3 eq '7'}">selected="selected"</c:if>>충청남도</option>
								                       <option value="8" <c:if test="${adto.bigarea3 eq '8'}">selected="selected"</c:if>>충청북도</option>
								                       <option value="9" <c:if test="${adto.bigarea3 eq '9'}">selected="selected"</c:if>>부산광역시</option>
								                       <option value="10" <c:if test="${adto.bigarea3 eq '10'}">selected="selected"</c:if>>울산광역시</option>
								                       <option value="11" <c:if test="${adto.bigarea3 eq '11'}">selected="selected"</c:if>>경상남도</option>
								                       <option value="12" <c:if test="${adto.bigarea3 eq '12'}">selected="selected"</c:if>>경상북도</option>
								                       <option value="13" <c:if test="${adto.bigarea3 eq '13'}">selected="selected"</c:if>>대구광역시</option>
								                       <option value="14" <c:if test="${adto.bigarea3 eq '14'}">selected="selected"</c:if>>광주광역시</option>
								                       <option value="15" <c:if test="${adto.bigarea3 eq '15'}">selected="selected"</c:if>>전라남도</option>
								                       <option value="16" <c:if test="${adto.bigarea3 eq '16'}">selected="selected"</c:if>>전라북도</option>
								                       <option value="17" <c:if test="${adto.bigarea3 eq '17'}">selected="selected"</c:if>>제주특별자치도</option>
						                     </select></td>
						                     <td><select name="areaPP" class="form-control" size=1>
						                         <%-- <c:forEach var = "adto" items="${adto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${adto.areaPP}">${adto.areaPP}</option>					                      
							                     <%-- </c:forEach> --%>
						                     </select></td>
						
						                     <!-- <td>
						                     <button type="submit">go</button>
						                  </td> -->
						                  </tr>
						
						               </table>
						            </div>
						         </div>
						
						         <br> <br>
						         
						         <h4>모임 희망카테고리</h4>
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
						                     <td><select class="form-control" id="catTopOne" name="catTopOne" onChange="catChangeOne(this.options.selectedIndex)">
						                           <option selected value="">-선택-</option>
						                           <option value="1" <c:if test="${cadto.catTopOne eq '1'}">selected="selected"</c:if>>스터디(취업/시험 대비)</option>
						                           <option value="2" <c:if test="${cadto.catTopOne eq '2'}">selected="selected"</c:if>>동호회(취미)</option>
						                           <option value="3" <c:if test="${cadto.catTopOne eq '3'}">selected="selected"</c:if>>컨퍼런스</option>
						
						                     </select></td>
						                     <!--2차카테고리선택  -->
						                     <td><select class="form-control" id="catMidOne" name="catMidOne" size=1 onChange="catMidChangeOne(this.options.selectedIndex)">
						                     	 <%-- <c:forEach var = "cdto" items="${cdto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${cadto.catMidOne}">${cadto.catMidOne}</option>					                      
							                     <%-- </c:forEach> --%>
						                     </select></td>
						                     <!--3차카테고리선택  -->
						                     <td><select class="form-control" id="catBotOne" name="catBotOne" size=1>
							                     <%-- <c:forEach var = "cdto" items="${cdto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${cadto.catBotOne}">${cadto.catBotOne}</option>					                      
							                     <%-- </c:forEach> --%>
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
						                     <td><select class="form-control" id="catTopTwo" name="catTopTwo" onChange="catChangeTwo(this.options.selectedIndex)">
						                           <option selected value="">-선택-</option>
						                           <option value="1" <c:if test="${cadto.catTopTwo eq '1'}">selected="selected"</c:if>>스터디(취업/시험 대비)</option>
						                           <option value="2" <c:if test="${cadto.catTopTwo eq '2'}">selected="selected"</c:if>>동호회(취미)</option>
						                           <option value="3" <c:if test="${cadto.catTopTwo eq '3'}">selected="selected"</c:if>>컨퍼런스</option>
						
						                     </select></td>
						                     <!--2차카테고리선택  -->
						                      
						                     <td><select class="form-control" id="catMidTwo" name="catMidTwo" size=1 onChange="catMidChangeTwo(this.options.selectedIndex)">
						                         <%-- <c:forEach var = "cdto" items="${cdto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${cadto.catMidTwo}">${cadto.catMidTwo}</option>					                      
							                     <%-- </c:forEach> --%>				                           
						                     </select></td>
						                     
						                     <!--3차카테고리선택  -->
						                     <td><select class="form-control" id="catBotTwo" name="catBotTwo" size=1>
						                         <%-- <c:forEach var = "cdto" items="${cdto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${cadto.catBotTwo}">${cadto.catBotTwo}</option>					                      
							                     <%-- </c:forEach> --%>
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
						                     <td><select class="form-control" id="catTopThr" name="catTopThr" onChange="catChangeThr(this.options.selectedIndex)">
						                           <option selected value="">-선택-</option>
						                           <option value="1" <c:if test="${cadto.catTopThr eq '1'}">selected="selected"</c:if>>스터디(취업/시험 대비)</option>
						                           <option value="2" <c:if test="${cadto.catTopThr eq '2'}">selected="selected"</c:if>>동호회(취미)</option>
						                           <option value="3" <c:if test="${cadto.catTopThr eq '3'}">selected="selected"</c:if>>컨퍼런스</option>
						
						                     </select></td>
						                     <!--2차카테고리선택  -->
						                     <td><select class="form-control" id="catMidThr" name="catMidThr" size=1 onChange="catMidChangeThr(this.options.selectedIndex)">
						                         <%-- <c:forEach var = "cdto" items="${cdto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${cadto.catMidThr}">${cadto.catMidThr}</option>					                      
							                     <%-- </c:forEach> --%>
						                     </select></td>
						                     <!--3차카테고리선택  -->
						                     <td><select class="form-control" id="catBotThr" name="catBotThr" size=1>
						                         <%-- <c:forEach var = "cdto" items="${cdto}" varStatus="1">	 --%>					                           
							                           <option value="" >-선택-</option>
							                           <option selected value="${cadto.catBotThr}">${cadto.catBotThr}</option>					                      
							                     <%-- </c:forEach> --%>
						                     </select></td>
						                  </tr>
						                  <!-- <td>
						               <button type="submit">go</button>
						            </td> -->
						
						               </table>
						            </div>
						         </div>
								 <br>
			 
								 <!-- [hidden] 회원가입하려는 사용자 정보 (1단계에서 입력한 내용) -->
								 <input type="hidden" name="guserId" value="${pdto.guserId}">
								 <input type="hidden" name="guserPw" value="${pdto.guserPw}">
								 <input type="hidden" name="guserName" value="${pdto.guserName}">
								 <input type="hidden" name="guserGender" value="${pdto.guserGender}">
								 <input type="hidden" name="guserPhone" value="${pdto.guserPhone}">
								 <input type="hidden" name="guserEmail" value="${pdto.guserEmail}">
								 <input type="hidden" name="guserCode" value="${pdto.guserCode}">
								 
								 <!-- 2단계 > 수정완료 버튼 -->
								 <div class="clear-fix">
									<div class="pull-right">
										<button type="submit" class="btn btn-primary" onClick="mypageModify2(); return false;">2단계 수정완료</button>
									</div>
								 </div>
						      </form>
					</div>					
				</div>
			</div>		
			</div>
			 </div>
		</div>
		
		<!-- [마이페이지(개인정보수정-2단계) JS - 데이터 유효성 검사] -->
		<script src="/resources/script/js/mypagePersonDetailValidation.js"></script>
	</div>
</body>
</html>