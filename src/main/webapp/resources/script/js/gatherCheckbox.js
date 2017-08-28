/**
 * 체크박스와 관련된 기능을 하는 js
 */


/* 페이지 로드시 가장 먼저 실행되는 스크립트 */
$(function() {
	
	/* 체크박스의 카테고리 네모박스(외국어, 영어, .. )를 체크했을때 그에 따른 항복을 보여주는 스크립트 */
	$('[class*=cateChk]').click(function(){
		var cate = $(this).attr("class"); // 클레스
		var cateNum = cate.substring(7); // 끝숫자
		var cateId = "#"+cate.substring(0,7); // #더한 아이디
		
		for(var i=0; i<12; i++){
			if(cateNum==(i+1)){
				$(cateId+(i+1)).show();
			}else{
				$(cateId+(i+1)).hide();
			}				
		}
	});
	
	/* 체크박스의 지역 네모박스(강원, 경기, .. )를 체크했을때 그에 따른 항복을 보여주는 스크립트 */
	$('[class*=areaChk]').click(function(){
		var area = $(this).attr("class"); // 클레스
		var areaNum = area.substring(7); // 끝숫자
		var areaId = "#"+area.substring(0,7); // #더한 아이디
		
		for(var i=0; i<17; i++){
			if(areaNum==(i+1)){
				$(areaId+(i+1)).show();
			}else{
				$(areaId+(i+1)).hide();
			}				
		}
	});
	
	/* 체크박스 체크된값 가져오기, db에서 체크된조건의 모집글 가져오기 */
	$("input[name*='box']").change(
		function(){
			
			var cDATA = "";
			$("input[name*='cbox']").each(
				function() {
					if($(this).is(':checked')&& $(this).val() != "on"){
						cDATA += "," + ($(this).val());
					}
			});

			var aDATA = "";
			$("input[name*='abox']").each(
				function() {
					if ($(this).is(':checked')&& $(this).val() != "on"){
						aDATA += "," + ($(this).val());
					}
			});
				
			var tDATA = "";
			$("input[name='tbox']").each(
				function() {
					if ($(this).is(':checked')&& $(this).val() != "on"){
								tDATA += "," + ($(this).val());
					}
			});
				
			var DATA = {
				"cDATA" : cDATA,
				"aDATA" : aDATA,
				"tDATA" : tDATA
			};
				
			/* 이거는 #execute를 클릭하면 일어나는 ajax */
			$.ajax({
				url : '/gather/gatheringSearch',
				dataType : 'json',
				type : 'POST',
				cache : false,
				data : DATA,
				success : function(gath) {
			
					var count = Object.keys(gath).length
								
					$("#gatherSelect").html(""); // idv를 일단 공백으로 초기화 해줌, 매번 받아올때마다 다른것을 불러와야 하니까, 이전에 있는건 지워져야함
	
					$.each(gath.gList, function(index, gList) { // 이치를 써서 모든 데이터들을 배열에 넣음
						var subject = gList.gatherSubject;
						subject = subject.substring(0,11) +' ...';
									
						var write = gList.gatherWrite;
						write = write.substring(0,16);
									
						var sdate = gList.gatherSdate;
						if(sdate != null){
							sdate = sdate.substring(0,10);
						}else{
							sdate = '몰름';
						}
										 
						var edate = gList.gatherEdate;
						if(edate != null){
							edate = edate.substring(0,10);
						}else{
							edate = '추후 협의';
						}
									
						var day = gList.gatherDay;
						if(day===null){
							day = '추후 협의';
						}
									
						var img = gList.gatherImg;
						if(img===null){
							img = '\\resources\\image\\mozip\\damoyo_noPicture.png';
						}							
												
						var str = "";
						str += "<div class='col-xs-4 col-lg-3' id='gather'>";
						str += "<a data-toggle='modal' href='#GatherModalInfo' id='gathmodal' data-no='"+gList.gatherNo+
						"'  data-subject='"+gList.gatherSubject+
						"'  data-categorytop='"+gList.gatherCategoryTop+
						"'  data-categorymid='"+gList.gatherCategoryMid+
						"'  data-categorybot='"+gList.gatherCategoryBot+
						"'  data-parti='"+gList.gatherParti+
						"'  data-write='"+write+
						"'  data-sdate='"+sdate+
						"'  data-edate='"+edate+
						"'  data-areatop='"+gList.gatherAreaTop+
						"'  data-area='"+gList.gatherArea+
						"'  data-parti='"+gList.gatherParti+
						"'  data-partimax='"+gList.gatherPartiMax+
						"'  data-content='"+gList.gatherContent+
						"'  data-img='"+img+
						"'  data-id='"+gList.guserId+
						"'  data-day='"+day+
						"'  data-state='"+gList.gatherState+
						"' >"
						
						str += "<img class='gatherimg' width='213px' height='120px' src='" + img + "'>";
						str += "<span class='price'>"+gList.gatherState+"</span>"
						str += "<h4 align='center'>" + subject + "</h4>";
						str += "<h5>기간 : " + sdate + " ~ " + edate + "<br>";
						str += "요일 : " + day + "<br>" ;
						str += "지역 : " + gList.gatherArea + "<br>";
						str += "신청인원 : " + gList.gatherParti + "</h5>";
						str += "</a>";
						str += "</div>";
	
						$("#gatherSelect").append(str);
						
					})
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
	});
});

/* 체크박스의 전체를 선택 했을때 나머지 모두가 체크되고 변경할수 없게 disabled 하는것, 해제는 그 반대  */
function checkAllFunc(obj, box) {
	$("[name=" + box + "]").each(function() {
		if (obj.checked == true) {
			$("[name=" + box + "]").attr("disabled", true);//는 input 요소 설정 을 disabled
		} else {
			$("[name=" + box + "]").attr("disabled", false);//제거 input 요소를 disabled 속성
		}

		this.checked = obj.checked;
	})
};

/* 검색 버튼 눌렀을때 체크박스 값들 and 조건하고 검색하여 db에서 체크된조건의 모집글 가져오기 */
function search_click(){
	
	var cDATA = "";
	$("input[name*='cbox']").each(
			function() {
				if ($(this).is(':checked') && $(this).val() != "on"){
					cDATA += "," + ($(this).val());
				}
	});

	var aDATA = "";
	$("input[name*='abox']").each(
			function() {
				if ($(this).is(':checked') && $(this).val() != "on"){
					aDATA += "," + ($(this).val());
				}
	});

	var sSelect = $("#serach_garhering").val();
	var sSTR = $("#search_text").val();
				
	var DATA = {
		"cDATA" : cDATA,
		"aDATA" : aDATA,
		"sSTR" : sSTR,
		"sSelect" : sSelect
	};

	$.ajax({
		url : '/gather/gatheringSearch',
		dataType : 'json',
		type : 'POST',
		cache : false,
		data : DATA,
		success : function(gath) {

			$("#gatherSelect").html(""); // idv를 일단 공백으로 초기화 해줌, 매번 받아올때마다 다른것을 불러와야 하니까, 이전에 있는건 지워져야함

			$.each(gath.gList, function(index, gList) { // 이치를 써서 모든 데이터들을 배열에 넣음

				var subject = gList.gatherSubject;
				subject = subject.substring(0,11) +' ...';
				
				var write = gList.gatherWrite;
				write = write.substring(0,16);
				
				var sdate = gList.gatherSdate;
				if(sdate != null){
					sdate = sdate.substring(0,10);
				}else{
					sdate = '몰름';
				}
					 
				var edate = gList.gatherEdate;
				if(edate != null){
					edate = edate.substring(0,10);
				}else{
					edate = '추후 협의';
				}
				
				var day = gList.gatherDay;
				if(day===null){
					day = '추후 협의';
				}
				
				var img = gList.gatherImg;
				if(img===null){
					img = '\\resources\\image\\mozip\\damoyo_noPicture.png';
				}
									
				var str = "";
				str += "<div class='col-xs-4 col-lg-3' id='gather'>";
				str += "<a data-toggle='modal' href='#GatherModalInfo' id='gathmodal' data-no='"+gList.gatherNo+
				 									"'  data-subject='"+gList.gatherSubject+
													"'  data-categorytop='"+gList.gatherCategoryTop+
													"'  data-categorymid='"+gList.gatherCategoryMid+
													"'  data-categorybot='"+gList.gatherCategoryBot+
													"'  data-parti='"+gList.gatherParti+
													"'  data-write='"+write+
													"'  data-sdate='"+sdate+
													"'  data-edate='"+edate+
													"'  data-areatop='"+gList.gatherAreaTop+
													"'  data-area='"+gList.gatherArea+
													"'  data-parti='"+gList.gatherParti+
													"'  data-partimax='"+gList.gatherPartiMax+
													"'  data-content='"+gList.gatherContent+
													"'  data-img='"+img+
													"'  data-id='"+gList.guserId+
													"'  data-day='"+day+
													"'  data-state='"+gList.gatherState+
													"' >"
						
				str += "<img class='gatherimg' width='213px' height='120px' src='" + img + "'>";
				str += "<span class='price'>"+gList.gatherState+"</span>"
				str += "<h4 align='center'>" + subject + "</h4>";
				str += "<h5>기간 : " + sdate + " ~ " + edate + "<br>";
				str += "요일 : " + day + "<br>" ;
				str += "지역 : " + gList.gatherArea + "<br>";
				str += "신청인원 : " + gList.gatherParti + "</h5>";
				str += "</a>";
				str += "</div>";

				$("#gatherSelect").append(str);

			})
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
		} 

	});
}

$(window).load(function(){

	/* 쿼리스트링으로 넘어온 체크박스 값 분리하여 적용하여 나타내기 */
	var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제 
	
	if(_tempUrl.indexOf('=')>0){
		var _tempArray;
				
		if(_tempUrl.indexOf('&')>0){
			_tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기 
			
			for(var i = 0; i<_tempArray.length; i++) { 
								
				var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
				
				if(_keyValuePair[0] == 'type'){ // _keyValuePair[0] : 파라미터 명 
					 // _keyValuePair[1] : 파라미터 값 
					
					var box = _keyValuePair[1]; // 쿼리스트링으로 type에 값을 저장해 보내서 box 에 담고
					var boxNum = box.substring(4); // 숫자만 짤라서 필요한 것을 받음
					
					var boxAll  = '.cAll' +boxNum;
					var boxTag = '.cateChk' +boxNum
					
					$(boxTag).trigger("click"); // 위의 태그를 선택하여 보여주는 트리거
					$(boxAll).trigger("click"); // 위 태그의 전체를 클릭하는 트리거
					
				}else if(_keyValuePair[0] == 'subject'){
					$('#search_text').val(decodeURI(_keyValuePair[1]));
					$('#search_text_btn').trigger("click");
				}else if(_keyValuePair[0]=='no'){
					
					$("[data-no="+_keyValuePair[1]+"][id=gathmodal]").one('onclick', '').click();
					
					/*$("[data-no="+_keyValuePair[1]+"]").trigger("click");*/
				}
			}
		}else{
			_tempArray = _tempUrl;
			
			var _keyValuePair = _tempArray.split('=');
			
			if(_keyValuePair[0] == 'type'){ // _keyValuePair[0] : 파라미터 명 
				 // _keyValuePair[1] : 파라미터 값 
				
				var box = _keyValuePair[1]; // 쿼리스트링으로 type에 값을 저장해 보내서 box 에 담고
				var boxNum = box.substring(4); // 숫자만 짤라서 필요한 것을 받음
				
				var boxAll  = '.cAll' +boxNum;
				var boxTag = '.cateChk' +boxNum
				
				$(boxTag).trigger("click"); // 위의 태그를 선택하여 보여주는 트리거
				$(boxAll).trigger("click"); // 위 태그의 전체를 클릭하는 트리거
				
			} 
		}
		
		
	}
});