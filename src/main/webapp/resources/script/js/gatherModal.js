/**
 * 모달과 관련된 작업을 하는 js
 */


/* 페이지 로드시 가장 먼저 실행되는 스크립트 */
$(function() {
	
	/* 글 클릭시 모달창 띄우기 */
	$('#GatherModalInfo').on('show.bs.modal', function(event) { /*  myModal 윈도우가 오픈할때 아래의 옵션을 적용 */
		var href = $(event.relatedTarget); /* 모달 윈도우를 오픈하는 버튼 */
		var no = href.data('no'); /*  href태그에서 data- 값을 변수에 저장 */
		var subject = href.data('subject'); /*  href태그에서 data- 값을 변수에 저장 */
		
		var categorytop = href.data('categorytop'); /*  href태그에서 data- 값을 변수에 저장 */
		var categorymid = href.data('categorymid'); /*  href태그에서 data- 값을 변수에 저장 */
		var categorybot = href.data('categorybot'); /*  href태그에서 data- 값을 변수에 저장 */
		
		var write = href.data('write');
		var sdate = href.data('sdate');
		var edate = href.data('edate');
		
		var day = href.data('day');
		
		var parti = href.data('parti'); /*  href태그에서 data- 값을 변수에 저장 */
		var partimax = href.data('partimax');

		var areatop = href.data('areatop'); /*  href태그에서 data- 값을 변수에 저장 */
		var area = href.data('area'); /*  href태그에서 data- 값을 변수에 저장 */
		
		var content = href.data('content'); /*  href태그에서 data- 값을 변수에 저장 */
		var img = href.data('img'); /*  href태그에서 data- 값을 변수에 저장 */
		var id = href.data('id'); 
		var state = href.data('state'); 
		
		var DATA = {
			"category" : categorybot,
			"area" : area,
			"no" : no,
			"id" : id,
		};
		
		// 여기서 클릭했을 때 recommend를 해주는 컨트롤러로 이동
		// 클릭한글을 디비에 저장하여 추천 값을 받음 , 아이디와, no, 코드(관심글 -- 이건 메서드안에서 하기) 보냄
		// 관심모집인지 확인하여 빈하트/하트를 뿌려주는 ajax
		var modal = $(this);
		
		 $.ajax({
			url : '/gather/gatheringRecomm',
			dataType : 'json',
			type : 'POST',
			cache : false,
			data : DATA,
			success : function(data) {
				var changeImg;
				
				if(data.result === 'yes'){
					changeImg ="/resources/image/icon/img_heart_after.png";
				}else{
					changeImg = "/resources/image/icon/img_heart_before.png";
				}

				$('#imgchange').attr('src', changeImg);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
			}
		});
		
		// 작성자와 로그인유저와 비교하여 같으면 수정하기 버튼를 생성하는 
		var loginId = $('#loginGuser').val();
		
		if(loginId.length>0){ // 값이 비어있지 않고
			if(loginId == id){
				$('#gatherModify').show();
			}else{
				$('#gatherModify').hide();
			}
		}
		
		modal.find('#modal-body-no').text(no); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-subject').text(subject); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-categorytop').text(categorytop); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-categorymid').text(categorymid); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-categorybot').text(categorybot); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-write').text(write); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-sdate').text(sdate); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-edate').text(edate); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-areatop').text(areatop); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-area').text(area); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-parti').text(parti); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-day').text(day); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-content').html(content); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		//$('#modal-body-content').attr('text', content);
		$('#modal-body-img').attr('src', img);
		modal.find('#modal-body-id').text(id); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-state').text(state); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-partimax').text(partimax); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
	});
	
	
	/* 모달이 종료될때 클릭된 관심상태(하트를 눌렀는지, 안눌렀는지)를 DB에 저장 */
	$('#GatherModalInfo').on('hidden.bs.modal', function(event) { /*  myModal 윈도우가 오픈할때 아래의 옵션을 적용 */

		var modal = $(this);
		var guserId = $('#loginGuser').val();
		
		if(guserId.length>1){ // 로그인 중일떄만 실행
		
			var img = $('#imgchange').attr('src');
			
			var no = modal.find('#modal-body-no').text();
			var writer = modal.find('#modal-body-id').text(); // 모달에 텍스트를 가져옴
			
			var state;
			
			if(img.match("heart_before")){
				state = 'delete';
			}else {
				state = 'insert';
			}
			
			var DATA = {
				"no" : no,
				"writer" : writer,
				"state" : state,
				"code" : '관심'
			};
			
			// 여기서 클릭했을 때 recommend를 해주는 컨트롤러로 이동해야함
			// 클릭한글을 디비에 저장하여 추천 값을 받음 , 아이디와, no, 코드(관심글 -- 이건 메서드안에서 하기) 보냄
			
			// + 여기다 추가로 관심글 받아오는 것도 함, 그럴려면 값을 받아올때 디비에 관심글이 있는지 없는지 확인하여 그에대한 값을 해야함
			
			var modal = $(this);
			
			$.ajax({
				url : '/gather/gatherAddons',
				dataType : 'json',
				type : 'POST',
				cache : false,
				data : DATA,
				success : function(data) {
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
				}
		 	});
		
		}
	
	});
	
	/* 수정버튼 눌렀을때 수정하는 모달 켜기 */
    //전역변수
	var obj = [];              
    //스마트에디터 프레임생성
	
    	
	
	
	/* 수정버튼 눌렀을때 수정하는 모달 켜기 */
	$('#gatherModify').click(function() {
		
		//값 받아서 저장
		var subject = $('#modal-body-subject').text();
		var sdate = $('#modal-body-sdate').text();
		var edate = $('#modal-body-edate').text();
		var day = $('#modal-body-day').text();
		var partimax = $('#modal-body-partimax').text();
		
		var content = $('#modal-body-content').html();
		
		var categorytop = $('#modal-body-categorytop').text();
		var categorymid = $('#modal-body-categorymid').text();
		var categorybot = $('#modal-body-categorybot').text();
		var areatop = $('#modal-body-areatop').text();
		var area = $('#modal-body-area').text();
		var img = $('#modal-body-img').attr('src');
		
		var id = $('#modal-body-id').text();
		var no = $('#modal-body-no').text();
		var state = $('#modal-body-state').text();
		
		var splitDay = day.split(',');
		
		$('.gatherDay').prop('checked',false);
		
		for(var i in splitDay){
			var sday = splitDay[i].trim();
			$('[value='+sday+']').prop('checked', true);
		}
		
		
		// 기존모달 종료하고 새로운 모달 키움
//		$('#gatherModify').attr('data-dismiss','modal');
		/*$('#gatherModify').attr('data-toggle','modal');
		$('#gatherModify').attr('data-target','#GatherModalModify');*/
		$('#GatherModalModify').modal('show');
//		$('#GatherModalModify').modal('data-toggle');
		
		// 키울때 기존값을 추가해줌
		$('#gatherSubject').val(subject);
		$('#gatherSdate').val(sdate);
		$('#gatherEdate').val(edate);
		$('#gatherPartiMax').val(partimax);
		$('#gatherContent').val(content);
		
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "gatherContent",
	        sSkinURI: "/resources/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : true,   
	        },
	        fOnAppLoad : function() {
	        	//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	        	oEditors.getById["gatherContent"].exec("PASTE_HTML", [content]);
	    	},
		});
		
		
		$('#guserId').val(id);
		$('#gatherNo').val(no);
		$('#gatherState').val(state);

 		$('#gatherCategoryTop').val(categorytop).trigger("change"); // ex) 스터디 태그를 선택하는 트리거 
 		$('#gatherCategoryMid').val(categorymid).trigger("change"); // ex) 영어 태그를 선택하는 트리거 
 		$('#gatherCategoryBot').val(categorybot).trigger("change"); // ex) 토익를 선택하는 트리거 
		

 		$('#gatherAreaTop').val(areatop).trigger("change"); // ex) 스터디 태그를 선택하는 트리거 
 		$('#gatherArea').val(area).trigger("change"); // ex) 스터디 태그를 선택하는 트리거 
	
	});
	

	

	
	/* 수정버튼 후 저장버튼 누르면 변경사항 업데이트하기 */
	$('#gatherModifyCommit').click(function(){

	    //id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["gatherContent"].exec("UPDATE_CONTENTS_FIELD", []);
	   		
		var no = $('#gatherNo').val();
		var subject = $('#gatherSubject').val();
		var cetegorytop = $('#gatherCategoryTop option:selected').text();
		var cetegorymid = $('#gatherCategoryMid option:selected').text();
		var cetegorybot = $('#gatherCategoryBot option:selected').text();
		var sdate = $('#gatherSdate').val();
		var edate = $('#gatherEdate').val();
		var write = $('#gatherWrite').val();
		var areatop = $('#gatherAreaTop').val();
		var area = $('#gatherArea').val();
		var partimax = $('#gatherPartiMax').val();
		var content = $('#gatherContent').val();
		var img = $('#gatherImg').val();
		var id = $('#guserId').val();
		var state = $('#gatherState').val();
		
		var day ;
		$("input[id='gatherDay']:checked").each(function(){
			day += ','+$(this).val() ;
		});
		day = day.substring(10);
		
		var DATA = {
			"gatherNo" : no,  
			"gatherSubject" : subject,
			"gatherCategoryTop" : cetegorytop,
			"gatherCategoryMid" : cetegorymid,
			"gatherCategoryBot" : cetegorybot,
			"gatherSdate" : sdate,
			"gatherEdate" : edate,
			"gatherWrite" : write,
			"gatherDay" : day,
			"gatherAreaTop" : areatop,
			"gatherArea" : area,
			"gatherPartiMax" : partimax,
			"gatherContent" : content,
			/* "gatherImg" : img, */
			"guserId" : id,
			"gatherState" : state
		}
		
		$.ajax({
			url : '/gather/gatheringModalModify',
			dataType : 'json',
			type : 'POST',
			cache : false,
			data : DATA,
			success : function(data) {
				if(data.result==='yes'){
					alert('수정되었습니다.');
					location.reload();					
				}else{
					alert('실패하였습니다.');
				}
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
			}
		});
 	});
	
	
	/* 모달수정창 - 파일업로드시 이미지만 올라가게 하기 */
	$("#gatherImg").change(function(){
		
		if($("#gatherImg").val() != ""){
			var ext = $("#gatherImg").val().split('.').pop().toLowerCase();
			
			if($.inArray(ext, ["gif","jpg","jpeg","png","bmp"]) == -1){
					alert("jpg, png, gif, bmp 만 업로드 가능합니다.");
					$("#gatherImg").val("");
					return false;
			}
		}
	});
});


/* 모달의 좋아요 버튼 눌렀을 때 그림 바꾸기 */
function imgChange(guser){
	
	if(guser===''){
		alert('로그인 후 이용 가능합니다.');
		return false;
	}
	 
	var img = document.getElementById('imgchange');
	
	if(img.src.match("heart_before")){
		img.src = "/resources/image/icon/img_heart_after.png";
	}else {
		img.src = "/resources/image/icon/img_heart_before.png";
	} 
}

/* 모달수정창 - 완료시 빈칸체크하기 */
function form_check(){
	 var content = $("#gatherContent").val();
	 
	 if(!content){ /*  !content 이뜻은 스크립트에서 값이 null 일때는 false를 반환하기 때문에 !false == true임 */
		 alert("생각 좀 하고 빈칸 채우렴.");
	 }else{
		 $("#gMake").submit();
	 }
}