<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" href="../../favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="/resources/examples/offcanvas/offcanvas.css"
	rel="stylesheet"> -->

<script src="/resources/assets/js/ie-emulation-modes-warning.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
	src="http://scriptmoa.cafe24.com/scriptmoa/jQuery/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">
	function goBlog(num, code) {
  		Url = '/blog/home?blogId=';
  		
  		if(code=='1'){
	  		gatherNoId = 'partiNo'+num;
	  		gatherNameId = 'partiName'+num;
	  		gatherBlog = 'partiBlog'+num;
	  		gatherRecognition = 'partiRecognition'+num;
  		}else if(code=='2'){
  			gatherNoId = 'makeNo'+num;
	  		gatherNameId = 'makeName'+num;
	  		gatherBlog = 'makeBlog'+num;
	  		gatherRecognition = 'makeRecognition'+num;
  		}
  			
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


<!-- 공통 헤더 -->
<%@include file = "../header.jsp"%>

</head>
<body>
	<!-- 부트스트랩을 감싸는 컨테이너 -->
	<div class="container">

		<!-- row는 수평 horizen과 같음, 왼쪽부터 배치하겠다  -->
		<div class="row row-offcanvas row-offcanvas-right">

			<%@ include file="./gathering_sidebar.jspf"%>
			<!--/.sidebar-offcanvas-->

			
			<div class="col-xs-12 col-sm-10">

				<br><br><br>
				<div>
				<!-- <div style="height: 600px;"> -->
					<div>
						<h3>참여 모임</h3>
					</div>
					<div class="row">
						<c:forEach var="parti" items="${plist}">
							<div class="col-xs-7 col-lg-5" id="gather">
								<a href="javascript:goBlog(${parti.gatherNo},'1');"> <img width="376px" height="250px" src='${parti.gatherImg}'>
									<h3 align="center">${parti.gatherSubject}</h4>
									<h4>
										기간 : ${fn:substring(parti.gatherSdate, 0, 10)} ~ ${fn:substring(parti.gatherEdate, 0, 10)}<br> 
										최근 글 : 12<br>
										오늘 방문자수 : 3
										<%-- 요일 : ${parti.gatherDay}<br> 
										지역 : ${parti.gatherArea}<br>
										신청인원 : ${parti.gatherParti} --%>
										<input type="hidden" value="${parti.gatherNo}" id="partiNo${parti.gatherNo}">
										<input type="hidden" value="${parti.gatherSubject}" id="partiName${parti.gatherNo}">
										<input type="hidden" value="${parti.gatherBlog}" id="partiBlog${parti.gatherNo}">
										<input type="hidden" value="${parti.gatherRecognition}" id="partiRecognition${parti.gatherNo}">
									</h4>
								</a>
								</div>
						</c:forEach>

					</div>
					<!--/row-->

					<hr>

					<div>
						<h3>개설 모임</h3>
					</div>
					<div class="row">
						<c:forEach var="make" items="${mlist}">
							<div class="col-xs-7 col-lg-5" id="gather">
								<a href="javascript:goBlog(${make.gatherNo},'2');"> <img width="376px" height="250px" src='${make.gatherImg}'>
									<h3 align="center">${make.gatherSubject}</h4>
									<h4>
										기간 : ${fn:substring(make.gatherSdate, 0, 10)} ~ ${fn:substring(make.gatherEdate, 0, 10)}<br> 
										최근 글 : 12<br>
										오늘 방문자수 : 3
										<%-- 요일 : ${make.gatherDay}<br> 
										지역 : ${make.gatherArea}<br>
										신청인원 : ${make.gatherParti} --%>
										<input type="hidden" value="${make.gatherNo}" id="makeNo${make.gatherNo}">
										<input type="hidden" value="${make.gatherSubject}" id="makeName${make.gatherNo}">
										<input type="hidden" value="${make.gatherBlog}" id="makeBlog${make.gatherNo}">
										<input type="hidden" value="${make.gatherRecognition}" id="makeRecognition${make.gatherNo}">
									</h4>
								</a>
							</div>
						</c:forEach>

					</div>
					<br>
					<br>
					<br>
				</div>

			</div>
		</div>
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