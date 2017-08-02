<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>모임 모집</title>

<!-- Bootstrap core CSS -->
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- <link href="/resources/examples/offcanvas/offcanvas.css" rel="stylesheet"> -->
<script src="/resources/assets/js/ie-emulation-modes-warning.js"></script>

<style type="text/css">
.price {
	position: absolute;
	top: 0px;
	left: 15px;
	padding: 0px 0px;
	background: #ffffff;
	color: #514d4d;
	font-size: 16px;
	font-weight: bold;
	letter-spacing: 1px;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

/* 카테고리, 지역 태그 파란색 및 밑줄 없애기 */
a:link {
	color: black;
	text-decoration: none;
	display: block;
}

a:visited {
	color: black;
	text-decoration: none;
}

.li-table {
	border: solid 1px #ccc;
}

/* 카테고리의 css  */
.horizontal-style-category {
	display: table;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0px;
	table-layout: fixed;
	margin-bottom: 0px;
}

.horizontal-style-category li {
	display: table-cell;
	border: solid 1px #ccc;
	/* 	border-bottom-width: 0; */
	height: 40px;
	vertical-align: middle;
	font-size: 15px;
	/* font-weight: bold; */
}

.horizontal-style-category a {
	display: block;
	text-align: center;
	margin: 0 5px;
	line-height: 40px;
}

/*  지역의 css  */
.horizontal-style-area {
	display: table;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0px;
	table-layout: fixed;
}

.horizontal-style-area li {
	display: table-cell;
	border: solid 1px #ccc;
	/* border-bottom-width: 0; */
	height: 50px;
	vertical-align: middle;
	font-size: 12px;
}

.horizontal-style-area a {
	display: block;
	text-align: center;
	margin: 0 5px;
	line-height: 50px;
}

/* checkbox 부분 관리 */
.checkbox-style {
	margin-top: 10px;
}

.checkbox-style li {
	display: inline-block;
	/* 	border-bottom-width: 0; */
	width: 120px;
	height: 21px;
	margin-top: 10px;
	margin-left: 17px;
	font-size: 12px;
}

.checkbox-style input {
	margin-right: 5px;
}

/* 글 한칸씩 띄우는거 */
#gather {
	margin-bottom: 20px;
}
</style>

<!-- jquery를 이용하여 뿌리기 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
	src="http://scriptmoa.cafe24.com/scriptmoa/jQuery/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<!-- 쿼리스트링 분리하여 원하는값 체크하기, 갓 triger가 날 살렸다!!!! -->
<script type="text/javascript">
$(window).load(function(){
	
	var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제 
	
	if(_tempUrl.indexOf('=')>0){
		var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기 
		
				for(var i = 0; _tempArray.length; i++) { 
			var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
			
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
</script>

<!-- 체크박스 전체체크-락, 체크해제-언락 -->
<script type="text/javascript">

	function checkAllFunc(obj, box) {
		
		$("[name=" + box + "]").each(function() {
			if (obj.checked == true) {
				$("[name=" + box + "]").attr("disabled", true)//는 input 요소 설정 을 disabled
			} else {
				$("[name=" + box + "]").attr("disabled", false)//제거 input 요소를 disabled 속성
			}

			this.checked = obj.checked;
		})
	};
	
	
</script>

<!-- 검색 버튼 눌렀을때 체크박스 값들 and 조건하고 검색하여 db에서 체크된조건의 모집글 가져오기 -->
<script type="text/javascript">
	function search_click(){
		
		var cDATA = "";
		$("input[name*='cbox']").each(
				function() {
					if ($(this).is(':checked')
							&& $(this).val() != "on")
						cDATA += "," + ($(this).val());
		});

		var aDATA = "";
		$("input[name*='abox']").each(
				function() {
					if ($(this).is(':checked')
							&& $(this).val() != "on")
						aDATA += "," + ($(this).val());
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
				console.log(gath.gList);

				$("#gatherSelect").html(""); // idv를 일단 공백으로 초기화 해줌, 매번 받아올때마다 다른것을 불러와야 하니까, 이전에 있는건 지워져야함

				$.each(gath.gList, function(index, gList) { // 이치를 써서 모든 데이터들을 배열에 넣음

					var subject = gList.gatherSubject;
					subject = subject.substring(0,11) +' ...';
					
					var write = gList.gatherWrite;
					write = write.substring(0,16);
					
					var sdate = gList.gatherSdate;
					sdate = sdate.substring(0,10);
						 
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
					str += "<a data-toggle='modal' href='#GatherModalInfo' data-no='"+gList.gatherNo+
					 									"'  data-subject='"+gList.gatherSubject+
														"'  data-category='"+gList.gatherCategory+
														"'  data-parti='"+gList.gatherParti+
														"'  data-write='"+write+
														"'  data-sdate='"+sdate+
														"'  data-edate='"+edate+
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
				alert("code:" + request.status
						+ "\n" + "message:"
						+ request.responseText
						+ "\n" + "error:" + error);
			} 

		});
	}
</script>

<!-- 카테고리 선택 -->
<script type="text/javascript">
	$(function() {
		$('.cateChk1').click(function() {
			$('#cateChk1').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk2').click(function() {
			$('#cateChk2').show();
			$('#cateChk1').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk3').click(function() {
			$('#cateChk3').show();
			$('#cateChk2').hide();
			$('#cateChk1').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk4').click(function() {
			$('#cateChk4').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk1').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk5').click(function() {
			$('#cateChk5').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk1').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk6').click(function() {
			$('#cateChk6').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk1').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk7').click(function() {
			$('#cateChk7').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk1').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk8').click(function() {
			$('#cateChk8').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk1').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk9').click(function() {
			$('#cateChk9').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk1').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk10').click(function() {
			$('#cateChk10').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk1').hide();
			$('#cateChk11').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk11').click(function() {
			$('#cateChk11').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk1').hide();
			$('#cateChk12').hide();
		});

		$('.cateChk12').click(function() {
			$('#cateChk12').show();
			$('#cateChk2').hide();
			$('#cateChk3').hide();
			$('#cateChk4').hide();
			$('#cateChk5').hide();
			$('#cateChk6').hide();
			$('#cateChk7').hide();
			$('#cateChk8').hide();
			$('#cateChk9').hide();
			$('#cateChk10').hide();
			$('#cateChk11').hide();
			$('#cateChk1').hide();
		});

		/* 지역 선택 */
		$('.areaChk1').click(function() {
			$('#areaChk1').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk2').click(function() {
			$('#areaChk2').show();
			$('#areaChk1').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk3').click(function() {
			$('#areaChk3').show();
			$('#areaChk2').hide();
			$('#areaChk1').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk4').click(function() {
			$('#areaChk4').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk1').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk5').click(function() {
			$('#areaChk5').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk1').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk6').click(function() {
			$('#areaChk6').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk1').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk7').click(function() {
			$('#areaChk7').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk1').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk8').click(function() {
			$('#areaChk8').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk1').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk9').click(function() {
			$('#areaChk9').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk1').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk10').click(function() {
			$('#areaChk10').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk1').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk11').click(function() {
			$('#areaChk11').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk1').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk12').click(function() {
			$('#areaChk12').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk1').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk13').click(function() {
			$('#areaChk13').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk1').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk14').click(function() {
			$('#areaChk14').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk1').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk15').click(function() {
			$('#areaChk15').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk1').hide();
			$('#areaChk16').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk16').click(function() {
			$('#areaChk16').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk1').hide();
			$('#areaChk17').hide();
		});

		$('.areaChk17').click(function() {
			$('#areaChk17').show();
			$('#areaChk2').hide();
			$('#areaChk3').hide();
			$('#areaChk4').hide();
			$('#areaChk5').hide();
			$('#areaChk6').hide();
			$('#areaChk7').hide();
			$('#areaChk8').hide();
			$('#areaChk9').hide();
			$('#areaChk10').hide();
			$('#areaChk11').hide();
			$('#areaChk12').hide();
			$('#areaChk13').hide();
			$('#areaChk14').hide();
			$('#areaChk15').hide();
			$('#areaChk16').hide();
			$('#areaChk1').hide();
		});
		
	});
</script>

<!-- 체크박스 체크된값 가져오기, db에서 체크된조건의 모집글 가져오기 -->
<script type="text/javascript">
$(function() {
	
	/* $("input[name*='box']");  ->  우선 모든 input 테그를 검색하고 속성 name 중에 ‘box’ 라는 문자열이 포함 되어 있다면 무조건 반환 하라. */
	
	$("input[name*='box']").change(
		function(){

			var cDATA = "";
			$("input[name*='cbox']").each(
					function() {
						if ($(this).is(':checked')
								&& $(this).val() != "on")
							cDATA += "," + ($(this).val());
					});

			var aDATA = "";
			$("input[name*='abox']").each(
					function() {
						if ($(this).is(':checked')
								&& $(this).val() != "on")
							aDATA += "," + ($(this).val());
					});

			var DATA = {
				"cDATA" : cDATA,
				"aDATA" : aDATA
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
							sdate = sdate.substring(0,10);
								 
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
							str += "<a data-toggle='modal' href='#GatherModalInfo' data-no='"+gList.gatherNo+
							"'  data-subject='"+gList.gatherSubject+
							"'  data-category='"+gList.gatherCategory+
							"'  data-parti='"+gList.gatherParti+
							"'  data-write='"+write+
							"'  data-sdate='"+sdate+
							"'  data-edate='"+edate+
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
</script>

<!-- 글 클릭시 모달창 띄우기 -->
<script type="text/javascript">

$(function() {
	$('#GatherModalInfo').on('show.bs.modal', function(event) { /*  myModal 윈도우가 오픈할때 아래의 옵션을 적용 */
		var href = $(event.relatedTarget); /* 모달 윈도우를 오픈하는 버튼 */
		var no = href.data('no'); /*  href태그에서 data- 값을 변수에 저장 */
		var subject = href.data('subject'); /*  href태그에서 data- 값을 변수에 저장 */
		var category = href.data('category'); /*  href태그에서 data- 값을 변수에 저장 */
		var write = href.data('write');
		var sdate = href.data('sdate');
		var edate = href.data('edate');

		var day = href.data('day');
		var partimax = href.data('partimax');
		
		var area = href.data('area'); /*  href태그에서 data- 값을 변수에 저장 */
		var parti = href.data('parti'); /*  href태그에서 data- 값을 변수에 저장 */
		var content = href.data('content'); /*  href태그에서 data- 값을 변수에 저장 */
		var img = href.data('img'); /*  href태그에서 data- 값을 변수에 저장 */
		var id = href.data('id'); 
		var state = href.data('state'); 
		
		var DATA = {
			"category" : category,
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
		var loginId = '${pdto.guserId}';
				
		if('${!empty pdto.guserId}'){ // 값이 비어있지 않고
			if('${pdto.guserId}' == id){
				$('#gatherModify').show();
			}else{
				$('#gatherModify').hide();
			}
		}
		
		modal.find('#modal-body-no').text(no); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-subject').text(subject); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-category').text(category); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-write').text(write); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-date').text(sdate + " ~ " + edate); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-area').text(area); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-parti').text(parti); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-day').text(day); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-content').text(content); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		$('#modalImg').attr('src', img);
		modal.find('#modal-body-id').text(id); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-state').text(state); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
		modal.find('#modal-body-partimax').text(partimax); /*  모달위도우에서 .modal-body-을 찾아 값을 치환  */
	});
});

</script>

<!-- 모달이 종료될때 클릭된 상태를 DB에 저장 -->
<script type="text/javascript">

$(function() {
	$('#GatherModalInfo').on('hidden.bs.modal', function(event) { /*  myModal 윈도우가 오픈할때 아래의 옵션을 적용 */
		
		/* var img = document.getElementById('imgchange'); */
	
		var modal = $(this);
		
		var guserId = modal.find('#modal-body-guser').text();
		
		if(guserId != ''){ // 로그인 중일떄만 실행
		
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
});

</script>

<!-- 모달의 좋아요 버튼 눌렀을 때 그림 바꾸기 -->
<script type="text/javascript">
	
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

</script>

<!-- 수정버튼 눌렀을때 수정하는 모달 켜기 -->
<script type="text/javascript">
$(function(){
	$('#gatherModify').click(function() {
		
		//값 받아서 저장
		var subject = $('#modal-body-subject').text();
		var date = $('#modal-body-date').text();
		var day = $('#modal-body-day').text();
		var date = $('#modal-body-day').text();
		var partimax = $('#modal-body-partimax').text();
		
		
		
		// 기존모달 종료하고 새로운 모달 키움
		$('#gatherModify').attr('data-dismiss','modal');
		$('#gatherModify').attr('data-toggle','modal');
		$('#gatherModify').attr('data-target','#GatherModalModify');
		
		$('#gatherSubject').val(subject);
		
	});
});
</script>	

<!-- ==================================================================================================== -->

<script type="text/javascript">
 	$(function() {
		$("#fileName").change(function(){
					
			if($("#fileName").val() != ""){
				var ext = $("#fileName").val().split('.').pop().toLowerCase();
				
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
	 var content = $("#gatherContent").val();
	 
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
    var temp, i=0, j=0;
    var ccount, cselect;
    
    temp = document.makeGathering.areaMid; 
    
    for (i=(temp.options.length-1) ; i>0 ; i--){ /* 전에 설정되있던 옵션을을 초기화 시킴 */
		temp.options[i] = null; 
    }
    eval('ccount = areaMid' + item + '.length'); // ccount = areaMid14.length 이게됨, areaMid선택한익덱스.length임
   
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = areaMid' + item + '[' + j + '];'); // cselect = areaMid14[0] ~ cselect = areaMid14[4]; 까지 반복, areaMid14 배열에는 5개의 값이 있음
        temp.options[j]= new Option(cselect,cselect);  
     
    }
    
    temp.options[0].selected=true;
    return true;
}
</script>

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

<%@include file="../header.jsp"%>

</head>

<body>

	<!-- 부트스트랩을 감싸는 컨테이너 -->
	<div class="container">

		<!-- row는 수평 horizen과 같음, 왼쪽부터 배치하겠다  -->
		<!-- <div class="row row-offcanvas row-offcanvas-right"> -->
		<div class="row pull-right">
		
			<%@ include file="./gathering_sidebar.jspf"%>
			
			<br><br><br>
			
			<div class="col-xs-12 col-sm-10">

				<div class="li-table">
					<ul class="horizontal-style-category" id="box-style">
						<li class="cateChk1" id="1" style="width: 100px"><a href="#">외국어</a></li>
						<li class="cateChk2" id="2" style="width: 100px"><a href="#">영어</a></li>
						<li class="cateChk3" id="3" style="width: 100px"><a href="#">음악/공연</a></li>
						<li class="cateChk4" id="4" style="width: 100px"><a href="#">라이프</a></li>
						<li class="cateChk5" id="5" style="width: 100px"><a href="#">취업</a></li>
						<li class="cateChk6" id="6" style="width: 100px"><a href="#">게임</a></li>
					</ul>
					<ul class="horizontal-style-category" id="box-style">
						<li class="cateChk7" id="7" style="width: 100px"><a href="#">스포츠</a></li>
						<li class="cateChk8" id="8" style="width: 100px"><a href="#">뷰티/미용</a></li>
						<li class="cateChk9" id="9" style="width: 100px"><a href="#">컴퓨터</a></li>
						<li class="cateChk10" id="10" style="width: 100px"><a
							href="#">국가고시/공무원</a></li>
						<li class="cateChk11" id="11" style="width: 100px"><a
							href="#">디자인/미술</a></li>
						<li class="cateChk12" id="12" style="width: 100px"><a
							href="#">기타</a></li>
					</ul>

					<ul class="checkbox-style" id="cateChk1">
						<li><span class="chkbox"><label class="chkbox-btn">
									<input type="checkbox" name="cbox" class="cAll1"
									onclick="checkAllFunc(this, 'cbox1')">전체
							</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn">
									<input type="checkbox" value="중국어" name="cbox1">중국어
							</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="일본어" name="cbox1">일본어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="독일어" name="cbox1">독일어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="아랍어" name="cbox1">아랍어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="태국어" name="cbox1">태국어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="스페인어" name="cbox1">스페인어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="러시아어" name="cbox1">러시아어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="프랑스어" name="cbox1">프랑스어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="베트남어" name="cbox1">베트남어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="베트남어" name="cbox1">외국어 기타</label></span></li>
					</ul>

					<ul class="checkbox-style" id="cateChk2" style="display: none;">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll2" name="cbox"
									onclick="checkAllFunc(this, 'cbox2')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="토익" name="cbox2">토익</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="토플" name="cbox2">토플</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="텝스" name="cbox2">텝스</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="토스" name="cbox2">토스</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영어회화" name="cbox2">영어회화</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="작문/독해" name="cbox2">작문/독해</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="번역" name="cbox2">번역</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="미드" name="cbox2">미드</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영어기타" name="cbox2">영어 기타</label></span></li>
					</ul>

					<ul class="checkbox-style" style="display: none;" id="cateChk3">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll3" name="cbox"
									onclick="checkAllFunc(this, 'cbox3')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="기타/우크렐라" name="cbox3">기타/우크렐라</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="피아노/키보드" name="cbox3">피아노/키보드</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="보컬/음악이론" name="cbox3">보컬/음악이론</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="작사/작곡" name="cbox3">작사/작곡</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="밴드" name="cbox3">밴드</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="국악" name="cbox3">국악</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="연기/연극/뮤지컬" name="cbox3">연기/연극/뮤지컬</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="회댄스무용계" name="cbox3">댄스무용</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="진행/행사" name="cbox3">진행/행사</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="음악/공연 기타" name="cbox3">음악/공연 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk4">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll4" name="cbox"
									onclick="checkAllFunc(this, 'cbox4')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="육아" name="cbox4">육아</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="반려동물" name="cbox4">반려동물</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="금융/제테크" name="cbox4">금융/제테크</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="상담/컨설팅" name="cbox4">상담/컨설팅</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="건강/웰빙" name="cbox4">건강/웰빙</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사주/타로" name="cbox4">사주/타로</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="독서/글쓰기" name="cbox4">독서/글쓰기</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사진/영상" name="cbox4">사진/영상</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="키덜트" name="cbox4">키덜트</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="생활공예" name="cbox4">생활공예</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="요리/베이킹" name="cbox4">요리/베이킹</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="인테리어" name="cbox4">인테리어</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk5">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll5" name="cbox"
									onclick="checkAllFunc(this, 'cbox5')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="자소서/면접" name="cbox5">자소서/면접</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="인적성" name="cbox5">인적성</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="스피치" name="cbox5">스피치</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="자격증" name="cbox5">자격증</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="기업공채" name="cbox5">기업공채</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="공모전/대외활동" name="cbox5">공모전/대외활동</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창업/스타트업" name="cbox5">창업/스타트업</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="취업 기타" name="cbox5">취업 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk6">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll6" name="cbox"
									onclick="checkAllFunc(this, 'cbox6')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="리그오브레전드" name="cbox6">리그오브레전드</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="도타" name="cbox6">도타</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="피파온라인" name="cbox6">피파온라인</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="오버워치" name="cbox6">오버워치</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서든어택" name="cbox6">서든어택</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="온라인게임" name="cbox6">온라인게임</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="PC게임" name="cbox6">PC게임</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="모바일게임" name="cbox6">모바일게임</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="보드게임" name="cbox6">보드게임</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="게임 기타" name="cbox6">게임 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk7">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll7" name="cbox"
									onclick="checkAllFunc(this, 'cbox7')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="축구" name="cbox7">축구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="야구" name="cbox7">야구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="농구" name="cbox7">농구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="테니스" name="cbox7">테니스</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="배드민턴" name="cbox7">배드민턴</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="골프" name="cbox7">골프</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="등산" name="cbox7">등산</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수영" name="cbox7">수영</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="자전거" name="cbox7">자전거</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="스케이트/보드" name="cbox7">스케이트/보드</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="요가/에어로빅" name="cbox7">요가/에어로빅</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="헬스/다이어트" name="cbox7">헬스/다이어트</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="무예/무술" name="cbox7">무예/무술</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="시즌스포츠" name="cbox7">시즌스포츠</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="스포츠 기타" name="cbox7">스포츠 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk8">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll8" name="cbox"
									onclick="checkAllFunc(this, 'cbox8')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="헤어" name="cbox8">헤어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="네일아트" name="cbox8">네일아트</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="피부관리" name="cbox8">피부관리</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="메이크업" name="cbox8">메이크업</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="반영구 메이크업" name="cbox8">반영구 메이크업</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="스타일/코디" name="cbox8">스타일/코디</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="뷰티/미용 기타" name="cbox8">뷰티/미용 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk9">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll9" name="cbox"
									onclick="checkAllFunc(this, 'cbox9')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="알고리즘" name="cbox9">알고리즘</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="응용프로그래밍" name="cbox9">응용프로그래밍</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="웹프로그래밍" name="cbox9">웹프로그래밍</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="모바일프로그래밍" name="cbox9">모바일프로그래밍</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="데이터베이스/서버" name="cbox9">데이터베이스/서버</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="게임프로그래밍" name="cbox9">게임프로그래밍</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="문서작성/편집" name="cbox9">문서작성/편집</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="컴퓨터자격증" name="cbox9">컴퓨터자격증</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사물인터넷" name="cbox9">사물인터넷</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="하드웨어" name="cbox9">하드웨어</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="컴퓨터 기타" name="cbox9">컴퓨터 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk10">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll10" name="cbox"
									onclick="checkAllFunc(this, 'cbox10')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="행정" name="cbox10">행정</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="교육" name="cbox10">교육</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="경찰" name="cbox10">경찰</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="소방" name="cbox10">소방</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="의료/보건" name="cbox10">의료/보건</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사법" name="cbox10">사법</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="기술" name="cbox10">기술</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="회계" name="cbox10">회계</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="국방" name="cbox10">국방</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="공무원 기타" name="cbox10">공무원 기타</label></span></li>
					</ul>
					<ul class="checkbox-style" style="display: none;" id="cateChk11">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="cAll11" name="cbox"
									onclick="checkAllFunc(this, 'cbox11')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="웹/모바일 디자인" name="cbox11">웹/모바일
									디자인</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="일러스트/삽화" name="cbox11">일러스트/삽화</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="광고/영상" name="cbox11">광고/영상</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="만화/웹툰" name="cbox11">만화/웹툰</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="편집디자인" name="cbox11">편집디자인</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="패션디자인" name="cbox11">패션디자인</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="3D/VFX" name="cbox11">3D/VFX</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="도예/세라믹" name="cbox11">도예/세라믹</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="캘러리그라피" name="cbox11">캘러리그라피</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="회화" name="cbox11">회화</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="디자인/미술 기타" name="cbox11">디자인/미술
									기타</label></span></li>
					</ul>
					<ul class="checkbox-style" id="cateChk12" style="display: none;">
						<li><span class="chkbox"><label class="chkbox-btn">
									<input type="checkbox" class="cAll12" name="cbox"
									onclick="checkAllFunc(this, 'cbox12')">전체
							</label> </span></li>
					</ul>
					<br>
				</div>

				<br><br>
				<div class="li-table">
					<ul class="horizontal-style-area" id="box-style">
						<li class="areaChk1" id="1" style="width: 40px"><a href="#">강원</a></li>
						<li class="areaChk2" id="2" style="width: 40px"><a href="#">경기</a></li>
						<li class="areaChk3" id="3" style="width: 40px"><a href="#">경남</a></li>
						<li class="areaChk4" id="4" style="width: 40px"><a href="#">경북</a></li>
						<li class="areaChk5" id="5" style="width: 40px"><a href="#">광주</a></li>
						<li class="areaChk6" id="6" style="width: 40px"><a href="#">대구</a></li>
						<li class="areaChk7" id="7" style="width: 40px"><a href="#">대전</a></li>
						<li class="areaChk8" id="8" style="width: 40px"><a href="#">부산</a></li>
						<li class="areaChk9" id="9" style="width: 40px"><a href="#">서울</a></li>
						<li class="areaChk10" id="10" style="width: 40px"><a href="#">세종</a></li>
						<li class="areaChk11" id="11" style="width: 40px"><a href="#">울산</a></li>
						<li class="areaChk12" id="12" style="width: 40px"><a href="#">연천</a></li>
						<li class="areaChk13" id="13" style="width: 40px"><a href="#">전남</a></li>
						<li class="areaChk14" id="14" style="width: 40px"><a href="#">전북</a></li>
						<li class="areaChk15" id="15" style="width: 40px"><a href="#">제주</a></li>
						<li class="areaChk16" id="16" style="width: 40px"><a href="#">충남</a></li>
						<li class="areaChk17" id="17" style="width: 40px"><a href="#">충북</a></li>
					</ul>

					<ul class="checkbox-style" id="areaChk1">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox1')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고성군" name="abox1">고성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동해시" name="abox1">동해시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="삼척시" name="abox1">삼척시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="속초시" name="abox1">속초시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="양구군" name="abox1">양구군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="양양군" name="abox1">양양군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영월군" name="abox1">영월군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="원주시" name="abox1">원주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="인제군" name="abox1">인제군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="정성군" name="abox1">정선군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="철원군" name="abox1">철원군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="춘천시" name="abox1">춘천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="태백시" name="abox1">태백시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="평창군" name="abox1">평창군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="홍천군" name="abox1">홍천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="화천군" name="abox1">화천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="횡성군" name="abox1">횡성군</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk2" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox2')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="가평군" name="abox2">가평군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고양시 덕양구" name="abox2">고양시 덕양구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고양시 일산동구" name="abox2">고양시 일산동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고양시 일산서구" name="abox2">고양시 일산서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="과천시" name="abox2">과천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="광명시" name="abox2">광명시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="광주시" name="abox2">광주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="구리시" name="abox2">구리시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="군포시" name="abox2">군포시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="김포시" name="abox2">김포시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남양주시" name="abox2">남양주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동두천시" name="abox2">동두천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부천시 소사구" name="abox2">부천시 소사구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부천시 오정구" name="abox2">부천시 오정구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부천시 원미구" name="abox2">부천시 원미구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="성남시 분당구" name="abox2">성남시 분당구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="성남시 수정구" name="abox2">성남시 수정구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="성남시 중원구" name="abox2">성남시 중원구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수원시 권선구" name="abox2">수원시 권선구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수원시 영통구" name="abox2">수원시 영통구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수원시 장안구" name="abox2">수원시 장안구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수원시 팔달구" name="abox2">수원시 팔달구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="시흥시" name="abox2">시흥시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="안산시 단원구" name="abox2">안산시 단원구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="안산시 상록구" name="abox2">안산시 상록구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="안성시" name="abox2">안성시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="안양시 동안구" name="abox2">안양시 동안구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="안양시 만안구" name="abox2">안양시 만안구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="양주시" name="abox2">양주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="양평군" name="abox2">양평군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="여주군" name="abox2">여주군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="연천군" name="abox2">연천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="오산시" name="abox2">오산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="용인시 기흥구" name="abox2">용인시 기흥구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="용인시 수지구" name="abox2">용인시 수지구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="용인시 처인구" name="abox2">용인시 처인구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="의왕시" name="abox2">의왕시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="의정부시" name="abox2">의정부시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="이천시" name="abox2">이천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="파주시" name="abox2">파주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="평택시" name="abox2">평택시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="포천시" name="abox2">포천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="하남시" name="abox2">하남시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="화성시" name="abox2">화성시</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk3" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox3')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="거제시" name="abox3">거제시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="거창군" name="abox3">거창군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고성군" name="abox3">고성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="김해시" name="abox3">김해시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남해군" name="abox3">남해군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="밀양시" name="abox3">밀양시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사천시" name="abox3">사천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="산청군" name="abox3">산청군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="양산시" name="abox3">양산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="의령군" name="abox3">의령군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="진주시" name="abox3">진주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창녕군" name="abox3">창녕군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창원시 마산합포구" name="abox3">창원시
									마산합포구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창원시 마산회원구" name="abox3">창원시
									마산회원구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창원시 성산구" name="abox3">창원시 성산구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창원시 의창구" name="abox3">창원시 의창구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="창원시 진해구" name="abox3">창원시 진해구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="통영시" name="abox3">통영시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="하동군" name="abox3">하동군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="함안군" name="abox3">함안군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="함양군" name="abox3">함양군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="합천군" name="abox3">합천군</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk4" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox4')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="경산시" name="abox4">경산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="경주시" name="abox4">경주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고령군" name="abox4">고령군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="구미시" name="abox4">구미시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="군위군" name="abox4">군위군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="김천시" name="abox4">김천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="문경시" name="abox4">문경시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="봉화군" name="abox4">봉화군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="상주시" name="abox4">상주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="성주군" name="abox4">성주군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="안동시" name="abox4">안동시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영덕군" name="abox4">영덕군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영양군" name="abox4">영양군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영주시" name="abox4">영주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영천시" name="abox4">영천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="예천군" name="abox4">예천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="울릉군" name="abox4">울릉군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="울진군" name="abox4">울진군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="의성군" name="abox4">의성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="청도군" name="abox4">청도군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="청송군" name="abox4">청송군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="칠곡군" name="abox4">칠곡군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="포항시 남구" name="abox4">포항시 남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="포항시 북구" name="abox4">포항시 북구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk5" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox5')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="광산구" name="abox5">광산구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남구" name="abox5">남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동구" name="abox5">동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="북구" name="abox5">북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서구" name="abox5">서구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk6" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox6')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남구" name="abox6">남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="달서구" name="abox6">달서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="달성군" name="abox6">달성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동구" name="abox6">동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="북구" name="abox6">북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서구" name="abox6">서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수성구" name="abox6">수성구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중구" name="abox6">중구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk7" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox7')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="대덕구" name="abox7">대덕구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동구" name="abox7">동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서구" name="abox7">서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="유성구" name="abox7">유성구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중구" name="abox7">중구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk8" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox8')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강서구" name="abox8">강서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="금정구" name="abox8">금정구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="기장군" name="abox8">기장군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남구" name="abox8">남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동구" name="abox8">동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동래구" name="abox8">동래구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부산진구" name="abox8">부산진구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="북구" name="abox8">북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사상구" name="abox8">사상구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="사하구" name="abox8">사하구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서구" name="abox8">서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="수영구" name="abox8">수영구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="연제구" name="abox8">연제구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영도구" name="abox8">영도구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중구" name="abox8">중구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="해운대구" name="abox8">해운대구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk9" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox9')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강남구" name="abox9">강남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강동구" name="abox9">강동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강북구" name="abox9">강북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강서구" name="abox9">강서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="관악구" name="abox9">관악구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="광진구" name="abox9">광진구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="구로구" name="abox9">구로구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="금천구" name="abox9">금천구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="노원구" name="abox9">노원구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="도봉구" name="abox9">도봉구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동대문구" name="abox9">동대문구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동작구" name="abox9">동작구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="마포구" name="abox9">마포구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서대문구" name="abox9">서대문구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서초구" name="abox9">서초구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="성동구" name="abox9">성동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="성북구" name="abox9">성북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="송파구" name="abox9">송파구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="양천구" name="abox9">양천구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영등포구" name="abox9">영등포구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="용산구" name="abox9">용산구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="은평구" name="abox9">은평구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="종로구" name="abox9">종로구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중구" name="abox9">중구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중랑구" name="abox9">중랑구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk10" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox10')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="세종시" name="abox10">세종시</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk11" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox11')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남구" name="abox11">남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동구" name="abox11">동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="북구" name="abox11">북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="울주군" name="abox11">울주군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중구" name="abox11">중구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk12" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox12')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강화군" name="abox12">강화군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="계양구" name="abox12">계양구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남구" name="abox12">남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남동구" name="abox12">남동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="동구" name="abox12">동구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부평구" name="abox12">부평구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서구" name="abox12">서구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="연수구" name="abox12">연수구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="옹진군" name="abox12">옹진군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="중구" name="abox12">중구</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk13" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox13')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="강진군" name="abox13">강진군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고흥군" name="abox13">고흥군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="곡성군" name="abox13">곡성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="광양시" name="abox13">광양시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="구례군" name="abox13">구례군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="나주시" name="abox13">나주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="담양군" name="abox13">담양군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="목포시" name="abox13">목포시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="무안군" name="abox13">무안군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="보성군" name="abox13">보성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="순천시" name="abox13">순천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="신안군" name="abox13">신안군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="여수시" name="abox13">여수시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영광군" name="abox13">영광군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영암군" name="abox13">영암군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="완도군" name="abox13">완도군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="장성군" name="abox13">장성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="장흥군" name="abox13">장흥군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="진도군" name="abox13">진도군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="함평군" name="abox13">함평군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="해남군" name="abox13">해남군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="화순군" name="abox13">화순군</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk14" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox14')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="고창군" name="abox14">고창군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="군산시" name="abox14">군산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="김제시" name="abox14">김제시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="남원시" name="abox14">남원시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="무주군" name="abox14">무주군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부안군" name="abox14">부안군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="순창군" name="abox14">순창군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="완주군" name="abox14">완주군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="익산시" name="abox14">익산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="임실군" name="abox14">임실군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="장수군" name="abox14">장수군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="전주시 덕진구" name="abox14">전주시 덕진구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="전주시 완산구" name="abox14">전주시 완산구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="정읍시" name="abox14">정읍시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="진안군" name="abox14">진안군</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk15" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox15')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서귀포시" name="abox15">서귀포시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="제주시" name="abox15">제주시</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk16" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox16')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="계룡시" name="abox16">계룡시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="공주시" name="abox16">공주시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="금산군" name="abox16">금산군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="논산시" name="abox16">논산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="당진시" name="abox16">당진시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="보령시" name="abox16">보령시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="부여군" name="abox16">부여군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서산시" name="abox16">서산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="서천군" name="abox16">서천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="아산시" name="abox16">아산시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="예산군" name="abox16">예산군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="천안시 동남구" name="abox16">천안시 동남구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="천안시 서북구" name="abox16">천안시 서북구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="청양군" name="abox16">청양군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="태안군" name="abox16">태안군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="홍성군" name="abox16">홍성군</label></span></li>
					</ul>

					<ul class="checkbox-style" id="areaChk17" style="display: none">
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" class="all" name="abox"
									onclick="checkAllFunc(this, 'abox17')">전체</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="괴산군" name="abox17">괴산군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="단양군" name="abox17">단양군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="보은군" name="abox17">보은군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="영동군" name="abox17">영동군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="옥천군" name="abox17">옥천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="음성군" name="abox17">음성군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="제천시" name="abox17">제천시</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="증평군" name="abox17">증평군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="진천군" name="abox17">진천군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="청원군" name="abox17">청원군</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="청주시 상당구" name="abox17">청주시 상당구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="청주시 흥덕구" name="abox17">청주시 흥덕구</label></span></li>
						<li><span class="chkbox"><label class="chkbox-btn"><input
									type="checkbox" value="충주시" name="abox17">충주시</label></span></li>
					</ul>
					<br>
				</div>

				<br><br>
				<div class="col-md-offset-3">
					<form class="form-inline">
						<label>상세검색&nbsp;&nbsp;</label>
						<div class="form-group">
							<select class="form-control" id="serach_garhering">
								<option id="subject">제목</option>
								<option id="subject2">지역</option>
								<option>카테고리</option>
							</select> <input type="text" class="form-control" id="search_text"
								value="${sSTR eq '' ? '' : sSTR}">
							<button type="button" class="btn btn-default"
								onclick="search_click()">검색</button>
						</div>
					</form>
				</div>

				<br>
				<div>
					<h3>추천 모임</h3>
				</div>
				
				<div class="row" id="gatherRecommed">
					<c:forEach var="recomm" items="${recomm}">
						<div class="col-lg-3" id="gather">
							<a data-toggle='modal' href='#GatherModalInfo'
								data-no='${recomm.gatherNo}'
								data-subject='${recomm.gatherSubject}'
								data-category='${recomm.gatherCategory}'
								data-write="${fn:substring(recomm.gatherWrite, 0, 16)}"
								data-sdate="${fn:substring(recomm.gatherSdate, 0, 10)}"
								data-edate="${fn:substring(recomm.gatherEdate, 0, 10)}"
								data-day='${recomm.gatherDay}'
								data-area='${recomm.gatherArea}'
								data-parti='${recomm.gatherParti}'
								data-partimax='${recomm.gatherPartiMax}'
								data-content='${recomm.gatherContent}'
								data-img='${recomm.gatherImg}' data-id='${recomm.guserId}'
								data-state='${recomm.gatherState}'> 
								<img class='gatherimg' width="213px" height="120px" src='${recomm.gatherImg}'> <span class="price">${recomm.gatherState}</span>
								<h4 align="center">
									<c:choose>
										<c:when test="${fn:length(recomm.gatherSubject) > 9}">
									        ${fn:substring(recomm.gatherSubject, 0, 11)} ...
									    </c:when>
										<c:otherwise>
									        ${recomm.gatherSubject}
									    </c:otherwise>
									</c:choose>
								</h4>
								<h5>
									기간 : ${fn:substring(recomm.gatherSdate, 0, 10)} ~ ${fn:substring(recomm.gatherEdate, 0, 10)}<br> 
									요일 : ${recomm.gatherDay}<br> 
									지역 : ${recomm.gatherArea}<br>
									신청인원 : ${recomm.gatherParti}<br>
								</h5>
							</a>
						</div>
					</c:forEach>
				</div>

				<hr>

				<div>
					<h3>검색 결과</h3>
				</div>

				<!-- 여기는 자바 스크립트에서 함 -->
				<div class="row" id="gatherSelect">
					<c:forEach var="gath" items="${gath}">
						<div class="col-xs-4 col-lg-3" id="gather">
							<a data-toggle='modal' href='#GatherModalInfo' data-no='${gath.gatherNo}'
								data-subject="${gath.gatherSubject}"
								data-category='${gath.gatherCategory}'
								data-write="${fn:substring(gath.gatherWrite, 0, 16)}"
								data-sdate="${fn:substring(gath.gatherSdate, 0, 10)}"
								data-edate="${fn:substring(gath.gatherEdate, 0, 10)}"
								data-area='${gath.gatherArea}' 
								data-parti='${gath.gatherParti}'
								data-partimax='${gath.gatherPartiMax}'
								data-content='${gath.gatherContent}'
								data-day='${gath.gatherDay}'
								data-img='${gath.gatherImg}' 
								data-id='${gath.guserId}'
								data-state='${gath.gatherState}'> <img
								class='gatherimg' width="213px" height="120px"
								src='${gath.gatherImg}'> <span class="price">${gath.gatherState}</span>
								<h4 align="center">
									<c:choose>
										<c:when test="${fn:length(gath.gatherSubject) > 9}">
									        ${fn:substring(gath.gatherSubject, 0, 11)} ...
									    </c:when>
										<c:otherwise>
									        ${gath.gatherSubject}
									    </c:otherwise>
									</c:choose>
								</h4>
								<h5>
									기간 : ${fn:substring(gath.gatherSdate, 0, 10)} ~
									${fn:substring(gath.gatherEdate, 0, 10)}<br> 요일 :
									${gath.gatherDay}<br> 지역 : ${gath.gatherArea}<br>
									신청인원 : ${gath.gatherParti}<br>
								</h5>
							</a>
						</div>
					</c:forEach>
					<!--/.col-xs-6.col-lg-4-->
				</div>
				<!--/row-->
			</div>
			<!--/.col-xs-12.col-sm-9-->
		</div>
		<!--/row-->
		<br><br><br>
		<hr>

<!-- ************************************** 모달  -->
		<div class="modal fade" id="GatherModalInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<div class="modal-header">
						<div class="col-xs-2 col-md-12">
							<div class="modal-body" id="modal-body-attention">
								<img class='img-responsive' width="80px" height="80px" id="imgchange"
									onclick="imgChange('${pdto.guserId eq '' ? '' : pdto.guserId}')"
									style="margin-left: auto; margin-right: auto; display: block;">
							</div>
						</div>
					</div>
					
					<div class="modal-body">
						<form class="form-horizontal">
	
							<div class="form-group">
								<label for="modal-body-state" class="col-sm-2 control-label">모임 현황</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-state"></div>
								</div>
							</div>
		
							<div class="form-group">
								<label for="modal-body-id" class="col-sm-2 control-label">작성자</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-id"></div>
								</div>
							</div>
		
		
							<!-- 입력항목이름 -->
							<div class="form-group">
								<label for="modal-body-subject" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-subject"></div>
								</div>
							</div>
		
							<!-- 모집분류  -->
							<div class="form-group">
								<label for="modal-body-category" class="col-sm-2 control-label">모집분류</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-category"></div>
								</div>
							</div>
		
							<!-- 기간 -->
							<div class="form-group">
								<label for="modal-body-date" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-date"></div>
								</div>
							</div>
		
							<!-- 요일 -->
							<div class="form-group">
								<label for="modal-body-day" class="col-sm-2 control-label">요일</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-day"></div>
								</div>
							</div>
		
							<!-- 지역  -->
							<div class="form-group">
								<label for="modal-body-area" class="col-sm-2 control-label">지역</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-area"></div>
								</div>
		
							</div>
		
							<!-- 장소  -->
							<div class="form-group">
								<label for="modal-body-place" class="col-sm-2 control-label">장소</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-place"></div>
								</div>
		
							</div>
		
							<!-- 인원  -->
							<div class="form-group">
								<label for="modal-body-partimax" class="col-sm-2 control-label">인원</label>
								<div class="col-sm-8">
								<div class="modal-body">
									<span id="modal-body-parti" ></span> / <span id="modal-body-partimax"></span>
								</div>
								</div>
							</div>
		
							<!-- 상세정보  -->
							<div class="form-group">
								<label for="modal-body-content" class="col-sm-2 control-label">상세정보</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-content"></div>
								</div>
							</div>
						
						</form>
					</div>
					<!-- 모임상태  -->
					
				
					<div class="modal-footer">
						<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">닫기</button>
						<button id='gatherModify' type="button" class="btn btn-warning pull-left" style="display: none;">수정하기</button>
						<button type="button" class="btn btn-info" data-dismiss="modal">블로그 가기</button>
						<button type="button" class="btn btn-primary">신청</button>
					</div>				
										
					<!-- style="display:none;"은 히든과 같음 -->
					<div class="modal-body" id="modal-body-no" style="display:none;"></div>
					<!-- 로그인 중인 사용자  == guser-->
					<div class="modal-body" id="modal-body-guser" style="display:none;">${empty pdto.guserId ? '' : pdto.guserId}</div>
				</div>
			</div>
		</div>


<!-- 모달 수정창 ******************************************************  -->

		<div class="modal fade" id="GatherModalModify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					
					<div class="modal-header">
						<div class="col-xs-2 col-md-12">
							<h1>수정</h1>
						</div>
					</div>
					
					<div class="modal-body">
						<form id="gMake" name="makeGathering" class="form-horizontal" action="/gather/gatheringModify" method="post" enctype="multipart/form-data">
							
						<div class="form-group">
							<!-- 입력항목이름 -->
							<label for="ID" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="gatherSubject" id="gatherSubject"placeholder="제목를 작성해 주세영">
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
								<input type="date" class="form-control" id="gatherSdate" name="gatherSdate">
							</div>
							<div class="col-sm-1">부터</div>
							
							<div class="col-sm-3">
								<input type="date" class="form-control" id="gatherEdate" name="gatherEdate">
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
								<input type="text" id="gatherPlace" class="form-control" name="gatherPlace" placeholder="지역을 입력해주세영? 뭔지 잘 몰것음">
							</div>
							<div class="col-sm-2">
								<input type="button" class="btn btn-default" value="장소추천">
							</div>

						</div>

						<!-- 인원  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">인원</label>
							<div class="col-sm-1">
								<input type="text" id="gatherPartiMax" class="form-control"  name="gatherPartiMax" placeholder="인원수">
							</div>명
						</div>

						<!-- 모집분류  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">상세정보</label>
							<div class="col-sm-7">
								<textarea id="gatherContent" class="form-control" rows="5" name="gatherContent"
									placeholder="상세내용을 입력해 주세영"></textarea>
							</div>
						</div>

						<!-- 이미지 올리기  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">썸네일 사진</label>
							<div class="col-sm-7">
								<input id="fileName" type="file" name="gatherImg" >
							</div>
						</div>

						<br>
						
						</form>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">수정</button>
					</div>
					
					
					<!-- style="display:none;"은 히든과 같음 -->
					<div class="modal-body" id="modal-body-no" style="display:none;"></div>
					<!-- 로그인 중인 사용자  == guser-->
					<div class="modal-body" id="modal-body-guser" style="display:none;">${empty pdto.guserId ? '' : pdto.guserId}</div>
				</div>
			</div>
		</div>

	<!-- [Footer] 페이지 하단 -->
	<hr>
	<%@include file="../footer.jsp"%>
	<!--/.container-->
	</div>
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