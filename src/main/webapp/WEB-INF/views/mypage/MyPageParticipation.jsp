<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery CDN -->	
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->

<title>내가 참여중인 모임 페이지</title>

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

<!-- 왼쪽 메뉴바 클릭시, 해당 페이지 보이게하기 -->
<script>
   $('.nav-pills').scrollingTabs(); 
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
							<div class="form-group has-feedback">
				           		<label for="search" class="sr-only">search</label>
				           		<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력해주세요.">
				             		<!-- 돋보기 모양 -->
				            	<span class="glyphicon glyphicon-search form-control-feedback"></span>
				           	</div>
						</form>
					</div>	

					<div class="row">			
						<c:forEach var="parti" items="${plist}">
							<div class="col-xs-6 col-lg-6" id="gather">
								<a href=""> <img width="408px" height="300px" src='${parti.gatherImg}'>
									<h3 align="center">${parti.gatherSubject}</h3>
									<h4>
										기간 : ${fn:substring(parti.gatherSdate, 0, 10)} ~ ${fn:substring(parti.gatherEdate, 0, 10)}<br> 
										최근 글 : 12<br>
										오늘 방문자수 : 3
										<%-- 요일 : ${parti.gatherDay}<br> 
										지역 : ${parti.gatherArea}<br>
										신청인원 : ${parti.gatherParti} --%>
									</h4>
								</a>
							</div>
						</c:forEach>
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