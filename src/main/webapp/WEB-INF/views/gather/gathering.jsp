<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<script type="text/javascript">
	function goBlog() {
		blogUrl = 'http://localhost:5050/blog/home?blogId=';
		blogId = document.getElementById('modal-body-no').innerHTML;
		blogName = document.getElementById('modal-body-subject').innerHTML;
		blogName = '&blogName='+blogName;
		blogUrl = blogUrl + blogId + blogName;
		window.open(blogUrl);
	}
</script>

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


<!-- 네이버 스마트  -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>


<!-- 체크박스와 관련된 스크립트를 가지고 있는 js -->
<script type="text/javascript" src="/resources/script/js/gatherCheckbox.js" charset="utf-8"></script>

<!-- 모달과 관련된 스크립트를 가지고 있는 js -->
<script type="text/javascript" src="/resources/script/js/gatherModal.js" charset="utf-8"></script>

<!-- 카테고리/지역 정보, 스크립트가 들어있는 js -->
<script type="text/javascript" src="/resources/script/js/gatherACselectBox.js" charset="utf-8"></script>


<%@include file="../header.jsp"%>

</head>

<body>
	<input type="hidden" id="loginGuser" value="${pdto.guserId}">
	<!-- 부트스트랩을 감싸는 컨테이너 -->
	<div class="container">

		<!-- row는 수평 horizen과 같음, 왼쪽부터 배치하겠다  -->
		<!-- <div class="row row-offcanvas row-offcanvas-right"> -->
		<div class="row pull-right">
		
			<%@ include file="./gathering_sidebar.jspf"%>
			
			<br><br><br>
			
			<div class="col-xs-12 col-sm-10">

				<%@ include file="./gatheringCheckBox.jspf"%>

				<br>
				<div class="center-block" style="text-align: center;">
					<input type="checkbox" id="ctop1" name="tbox" value="동호회" ><label for="ctop1">동호회&nbsp;&nbsp;&nbsp;</label>
					<input type="checkbox" id="ctop2" name="tbox" value="스터디" ><label for="ctop2">스터디&nbsp;&nbsp;&nbsp;</label>
					<input type="checkbox" id="ctop3" name="tbox" value="컨퍼런스"><label for="ctop3">컨퍼런스</label>
				</div>
				
				<br>
				
				<div class="center-block" style="text-align: center;">
					<input type="checkbox" id="rtop1" name="rbox" value="모집중" ><label for="rtop1">모집중&nbsp;&nbsp;&nbsp;</label>
					<input type="checkbox" id="rtop2" name="rbox" value="진행중" ><label for="rtop2">진행중&nbsp;&nbsp;&nbsp;</label>
				</div>
				
				<br>
				
				<div class="col-md-offset-3">
					<form class="form-inline">
						<label>상세검색&nbsp;&nbsp;</label>
						<div class="form-group">
							<select class="form-control" id="serach_garhering">
								<option id="subject">제목</option>
								<option id="subject2">지역</option>
								<option>카테고리</option>
							</select> 
							<input type="text" class="form-control" id="search_text" onkeypress="if(event.keyCode==13) {search_click(); return false;}" value="${sSTR eq '' ? '' : sSTR}">
							<button type="button" id="search_text_btn" class="btn btn-default" onclick="search_click()">검색</button>
						</div>
						
					</form>
				</div>

				<br>
				<%-- <div>
					<h3>모집중인 모임</h3>
				</div>
				
				<div class="row" id="gatherRecommed">
					<c:forEach var="recomm" items="${recomm}">
						<div class="col-lg-3" id="gather">
							<a data-toggle='modal' href='#GatherModalInfo'
								data-no='${recomm.gatherNo}'
								data-subject='${recomm.gatherSubject}'
								data-categorytop='${recomm.gatherCategoryTop}'
								data-categorymid='${recomm.gatherCategoryMid}'
								data-categorybot='${recomm.gatherCategoryBot}'
								data-write="${fn:substring(recomm.gatherWrite, 0, 16)}"
								data-sdate="${fn:substring(recomm.gatherSdate, 0, 10)}"
								data-edate="${fn:substring(recomm.gatherEdate, 0, 10)}"
								data-day='${recomm.gatherDay}'
								data-area='${recomm.gatherArea}'
								data-areatop='${recomm.gatherAreaTop}'
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
									게시글 번호 : ${recomm.gatherNo}<br>
								</h5>
							</a>
						</div>
					</c:forEach>
				</div> --%>

				<hr>

				<div>
					<h3>검색 결과</h3>
				</div>

				<!-- 여기는 자바 스크립트에서 함 -->
				<div class="row" id="gatherSelect">
					<c:forEach var="gath" items="${gath}">
						<div class="col-xs-4 col-lg-3" id="gather">
							<a 	data-toggle='modal' href='#GatherModalInfo' id='gathmodal'
								data-no='${gath.gatherNo}'
								data-subject="${gath.gatherSubject}"
								data-categorytop='${gath.gatherCategoryTop}'
								data-categorymid='${gath.gatherCategoryMid}'
								data-categorybot='${gath.gatherCategoryBot}'
								data-write="${fn:substring(gath.gatherWrite, 0, 16)}"
								data-sdate="${fn:substring(gath.gatherSdate, 0, 10)}"
								data-edate="${fn:substring(gath.gatherEdate, 0, 10)}"
								data-area='${gath.gatherArea}' 
								data-areatop='${gath.gatherAreaTop}'
								data-parti='${gath.gatherParti}'
								data-partimax='${gath.gatherPartiMax}'
								data-content='${gath.gatherContent}'
								data-day='${gath.gatherDay}'
								data-img='${gath.gatherImg}' 
								data-id='${gath.guserId}'
								data-blog='${gath.gatherBlog}'
								data-state='${gath.gatherState}'> 
								<img class='gatherimg' width="213px" height="120px" src='${gath.gatherImg}'> <span class="price">${gath.gatherState}</span>
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
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					
					<div class="modal-header">
						<div class="col-xs-2 col-md-12">
							<div class="modal-body" id="modal-body-attention">
								<img class='img-responsive' width="80px" height="80px" id="imgchange"
									onclick="imgChange('${pdto.guserId eq '' ? '' : pdto.guserId}');"
									style="margin-left: auto; margin-right: auto; display: block;">
							</div>
						</div>
					</div>
					
					<div class="modal-body">
						<form class="form-horizontal">
	 
		 					<div class="modal-body">
								<img class='img-responsive' id="modal-body-img" style="display:none;">
								<div class="modal-body" id="modal-body-categorymid" style="display:none;"></div>
								<div class="modal-body" id="modal-body-categorytop" style="display:none;"></div>
								<div class="modal-body" id="modal-body-areatop" style="display:none;"></div>
								<div class="modal-body" id="modal-body-id" style="display:none;"></div>
								<div class="modal-body" id="modal-body-no" style="display:none;"></div>
								<div class="modal-body" id="modal-body-state" style="display:none;"></div>
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
								<label for="modal-body-categorybot" class="col-sm-2 control-label">모집분류</label>
								<div class="col-sm-8">
									<div class="modal-body" id="modal-body-categorybot"></div>
								</div>
							</div>
		
							<!-- 기간 -->
							<div class="form-group">
								<label for="modal-body-date" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-8">	
								<div class="modal-body">					
									<span id="modal-body-sdate" ></span> ~ <span id="modal-body-edate"></span>
								</div>
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
		
							<!-- 인원수  -->
							<div class="form-group">
								<label for="modal-body-partimax" class="col-sm-2 control-label">인원</label>
								<div class="col-sm-8">
								<div class="modal-body" id="modalTotalParti">
									<span id="modal-body-parti" ></span> / <span id="modal-body-partimax"></span>
								</div>
								</div>
							</div>
		
							<!-- 인원이름 -->
							<div class="form-group">
								<label for="modal-body-subject" class="col-sm-2 control-label">신청아이디</label>
								<div class="col-sm-10">
									<div class="modal-body" id="modal-body-partiname"></div>
								</div>
							</div>
		
							<!-- 상세정보  -->
							<div class="form-group">
								<label for="modal-body-content" class="col-sm-2 control-label">상세정보</label>
								<div class="col-sm-8">
									<div id="modal-body-content"></div>
								</div>
							</div>
						
						</form>
					</div>					
				
					<div class="modal-footer">
						<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">닫기</button>
						<button id='gatherModify' type="button" class="btn btn-warning pull-left" style="display: none;">수정하기</button>
						<button id='gatherBlog' type="button" class="btn btn-info" data-dismiss="modal" onclick="goBlog()" style="display: none;">블로그 가기</button>
						<button id='gatherApply' type="button" class="btn btn-primary" style="display: none;">신청</button>
						<button id='gatherComplete' type="button" class="btn btn-primary" style="display: none;">완료</button>
					</div>				
										
					<!-- style="display:none;"은 히든과 같음 -->
					<div class="modal-body" id="modal-body-no" style="display:none;"></div>
					<div class="modal-body" id="modal-body-state" style="display:none;"></div>
					<div class="modal-body" id="modal-body-state" style="display:none;"></div>
					
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
							<input type="hidden" class="form-control" name="guserId" id="guserId">
							<input type="hidden" class="form-control" name="gatherState" id="gatherState">
							<input type="hidden" class="form-control" name="gatherNo" id="gatherNo">
						

						<!-- 이미지 올리기  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">썸네일 사진</label>
							<div class="col-sm-7">
								<input id="gatherImg" type="file" name="gatherImg" >
							</div>
						</div>
							
						<div class="form-group">
							<!-- 입력항목이름 -->
							<label for="ID" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="gatherSubject" id="gatherSubject" placeholder="제목를 작성해 주세영">
							</div>
						</div>

						<!-- 모집분류  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">모집분류</label>
							
							<div class="dropdown">
								<div class="col-sm-3">
									<select class="form-control" id="gatherCategoryTop" name="gatherCategoryTop" onChange="categoryTopChange(this.options.selectedIndex)">
										<option selected value="">-선택-</option>
										<option value="스터디">스터디</option>
										<option value="동호회">동호회</option>
										<option value="컨퍼런스">컨퍼런스</option>
									</select>
								</div>	
								
								<div class="col-sm-3">
									<select class="form-control" id="gatherCategoryMid" name="gatherCategoryMid" onChange="categoryMidChange(this.options.selectedIndex)">
										<option selected value="">-선택-</option>
										<option value=""></option>
									</select>
								</div>	
								
								<div class="col-sm-3">							
									<select class="form-control" id="gatherCategoryBot" name="gatherCategoryBot">
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
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="월">월&nbsp; </label> 
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="화">화&nbsp; </label> 
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="수">수&nbsp; </label> 
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="목">목&nbsp; </label> 
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="금">금&nbsp; </label> 
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="토">토&nbsp; </label> 
									<label><input type="checkbox" class="gatherDay" id="gatherDay" name="gatherDay" value="일">일&nbsp; </label>
								</div>
							</div>
						</div>

						<!-- 지역  -->
						<div class="form-group">
							<label for="Name" class="col-sm-2 control-label">지역</label>
							<div class="dropdown">
								<div class="col-sm-3">
									<select class="form-control" id="gatherAreaTop" name="areaTop" onChange="areachange(this.options.selectedIndex)"> <!-- this.options.selectedIndex 선택된 인덱스를 가져옴  -->
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
									<select class="form-control" id="gatherArea" name="areaMid">
										<option selected value="">-선택-</option>
										<option value=""></option>
									</select>
								</div>
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
							<div class="col-sm-10">
								<textarea id="gatherContent" class="form-control" rows="5" name="gatherContent" style="width: 700px; height: 300px;"></textarea>
							</div>
						</div>

						<br>
						
						</form>
					</div>
					
					<div class="modal-footer">
						<button type="button" id="gatherModifyClose" class="btn btn-danger pull-left" data-dismiss="modal">취소</button>
						<button type="button" id="gatherModifyCommit" class="btn btn-primary" data-dismiss="modal">저장</button>
					</div>
					
					
					<!-- style="display:none;"은 히든과 같음 -->
					<div class="modal-body" id="modal-body-no" style="display:none;"></div>
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