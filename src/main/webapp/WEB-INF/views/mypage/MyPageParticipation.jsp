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
	
	.gathering_title {
   text-align: left;
   font-weight: bold;
   color: #767676;
  }
#s1 {
   margin-left: 0px;
   color: #484848;
   font-weight: bold;
   font-size: 15px;
   vertical-align: middle;
  
   /* display: inline-block; */
   /* padding: 0px 5px 0; */
 }

#s2 {
   margin-left: 0px;
   color: #777;
   font-size: 15px;
   font-weight: normal;
   vertical-align: middle;
   
}
</style>

<!-- 왼쪽 메뉴바 클릭시, 해당 페이지 보이게하기 -->
<!-- <script>
   $('.nav-pills').scrollingTabs(); 
</script> -->

<script type="text/javascript">
	function goBlog(num) {
  		Url = '/blog/home?blogId=';
  		
  		gatherNoId = 'partiNo'+num;
  		gatherNameId = 'partiName'+num;
  		gatherBlog = 'partiBlog'+num;
  		gatherRecognition = 'partiRecognition'+num;
  		
		blogId = document.getElementById(gatherNoId).value; /* 모집글 번호==블로그 번호 */
		blogName = document.getElementById(gatherNameId).value; /* 블로그 번호 */
		
		blogState = document.getElementById(gatherBlog).value; /* 블로그 유무 상태, Yes or No */
		blogRecognition = document.getElementById(gatherRecognition).value;
				
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
							<div class="col-md-4" style="border: 1px solid #e8e5e5; height: auto; padding:10px; margin-right:5px;">
								<a href="javascript:goBlog(${parti.gatherNo});"> <img width="100%" height="180px" src='${parti.gatherImg}'>
									<h4 class="gathering_title">${parti.gatherSubject}</h4>
									
										
										<span id="s1">기간 :</span>&nbsp;<span id="s2"> ${fn:substring(parti.gatherSdate, 0, 10)} ~ ${fn:substring(parti.gatherEdate, 0, 10)}<br></span> 	
										<span id="s1">지역 : </span>&nbsp;<span id="s2">${parti.gatherArea}<br></span> 
                         				<span id="s1">참여인원 : </span>&nbsp;<span id="s2">${parti.gatherParti}<br></span> 
                          									
										<input type="hidden" value="${parti.gatherNo}" id="partiNo${parti.gatherNo}">
										<input type="hidden" value="${parti.gatherSubject}" id="partiName${parti.gatherNo}">
										<input type="hidden" value="${parti.gatherBlog}" id="partiBlog${parti.gatherNo}">
										<input type="hidden" value="${parti.gatherRecognition}" id="partiRecognition${parti.gatherNo}">
									
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