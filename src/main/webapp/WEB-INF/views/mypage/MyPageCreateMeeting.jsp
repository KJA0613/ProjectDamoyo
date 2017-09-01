<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>마이페이지</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
	.table {
		margin-left: 10px;
		text-align: center;
	}
	
	th {
		text-align: center;
	}
	
	.pagination {
		display: block;
		text-align: center;
	}
	
	.pagination > li > a{
		float: none;
	}
</style>

<script type="text/javascript">
	function goBlog(num) {
  		Url = '/blog/home?blogId=';
  		
  		gatherNoId = 'gatherNo'+num;
  		gatherNameId = 'gatherName'+num;
  		gatherBlog = 'gatherBlog'+num;
  		gatherRecognition = 'gatherRecognition'+num;
  		
		blogId = document.getElementById(gatherNoId).value; /* 모집글 번호==블로그 번호 */
		blogName = document.getElementById(gatherNameId).value; /* 블로그 번호 */
		
		blogState = document.getElementById(gatherBlog).value; /* 블로그 유무 상태, Yes or No */
		blogRecognition = document.getElementById(gatherRecognition).value;
		
		/* alert("블로그개설?"+blogState+", 진행중?"+blogRecognition); */
		
		if(blogState=='Yes'&&blogRecognition=='Yes'){
			blogName = '&blogName='+blogName;
			Url = Url + blogId + blogName;
		}else {
			Url = "/gather/gathering?no="+blogId;
		}
		window.open(Url);
	}
</script>

<!-- [Header] 공통 헤더 -->
<%@include file = "../header.jsp"%>
</head>

<body>
	
	 <div class="container">
      <!-- 타이틀 -->
      <div class="page-header clearfix">
         <h1>마이페이지</h1>      
      </div>
      
      <div id="myPageSetting" class="row">
	         <!--/// [왼쪽/리스트 목록]: 12칸 중 "3칸" 크기 확보 ///-->
	         <div class="col-md-3">         
	         	<%@include file = "MyPageSidebar.jsp"%>
	         </div>
        
        	 <!--/// [오른쪽/해당되는 내용]: 12칸 중 "9칸" 크기 확보 ///-->
			 <div class="col-md-9">
				  <div class="tab-content">	 
					<!-- 검색 -->
				    <div class="col-md-4 col-md-offset-8">
						<form action="#" method="POST" class="search-form">
							<!-- <div class="form-group has-feedback">
				           		<label for="search" class="sr-only">search</label>
				           		<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력해주세요.">
				             		돋보기 모양
				            	<span class="glyphicon glyphicon-search form-control-feedback"></span>
				           	</div> -->
						</form>
					</div>					

					
					<!-- 개인 > 개설한 모임 목록  -->					
					<div class="row">
						<c:forEach var="make" items="${mlist}">
							<div class="col-xs-6 col-lg-6" id="gather">
								<a href="javascript:goBlog(${make.gatherNo});"> <img width="408px" height="300px" src='${make.gatherImg}'>
									<h3 align="center">${make.gatherSubject}</h3>
									<h4>
										기간 : ${fn:substring(make.gatherSdate, 0, 10)} ~ ${fn:substring(make.gatherEdate, 0, 10)}<br> 
										최근 글 : 12 <br>
										오늘 방문자수 : 3
										<%-- 요일 : ${make.gatherDay}<br> 
										지역 : ${make.gatherArea}<br>
										인원 : ${make.gatherParti} --%>
										<input type="hidden" value="${make.gatherNo}" id="gatherNo${make.gatherNo}">
										<input type="hidden" value="${make.gatherSubject}" id="gatherName${make.gatherNo}">
										<input type="hidden" value="${make.gatherBlog}" id="gatherBlog${make.gatherNo}">
										<input type="hidden" value="${make.gatherRecognition}" id="gatherRecognition${make.gatherNo}">
									</h4>
								</a>
							</div>
						</c:forEach>
					</div>
					
					
					<!-- 광고주 > 개설한 모임 장소 -->
					<div class="wrapper">
					<c:choose>
						<c:when test="${empty plList}">							
							<div class="alert alert-info">
								<div class="form-group" style="margin-top: 13px; margin-bottom: 5px;">
									<h4>개설한 모임 장소가 없습니다.
									<a href="/place/PlaceRegistForm" class="pull-right" style = "font-weight : bold;">모임 장소 개설하기 ></a></h4>
								</div>
							</div>							
						</c:when>
						<c:otherwise>
			   	   			<%@include file="../place/PlaceAll.jsp"%>
			   	   		</c:otherwise>	
			   	   	</c:choose>		
			   	    </div>
			   	    			
				</div>
			</div>
		</div>
	
	<!-- [Footer] 페이지 하단 (고정화면) -->
	<hr>
	<%@include file = "../footer.jsp"%>
	</div>		
	
</body>
</html>