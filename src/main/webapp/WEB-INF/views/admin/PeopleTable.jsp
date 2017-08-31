<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/admin/img/apple-icon.png" />
<link rel="icon" type="image/png"
	href="/resources/admin/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Material Dashboard by Creative Tim</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="/resources/admin/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="/resources/admin/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="/resources/admin/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
$(function() {
	
	var tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제 
	
	if(tempUrl.length>0){
		
		var person = tempUrl.split('='); // '=' 을 기준으로 분리하기
		
		if(person[0] == 'guserNo'){ // person[0] : 파라미터 명 
			$('#guserInfo').show();
		}else if(person[0] == 'comNo'){
			$('#comInfo').show();
		}
	}
	
	
	
});
</script>


</head>

<body>

	<div class="wrapper">
		
	    <%@ include file="./admin_sidebar.jspf"%>

		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">DAMOYO 관리자 페이지</a>

				</div>


				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#pablo" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">dashboard</i>
								<p class="hidden-lg hidden-md">Dashboard</p>
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">notifications</i>
								<span class="notification">5</span>
								<p class="hidden-lg hidden-md">Notifications</p>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">Mike John responded to your email</a></li>
								<li><a href="#">You have 5 new tasks</a></li>
								<li><a href="#">You're now friend with Andrew</a></li>
								<li><a href="#">Another Notification</a></li>
								<li><a href="#">Another One</a></li>
							</ul></li>
						<li><a href="#pablo" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">person</i>
								<p class="hidden-lg hidden-md">Profile</p>
						</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group  is-empty">
							<input type="text" class="form-control" placeholder="Search">
							<span class="material-input"></span>
						</div>
						<button type="submit"
							class="btn btn-white btn-round btn-just-icon">
							<i class="material-icons">search</i>
							<div class="ripple-container"></div>
						</button>
					</form>

				</div>
			</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h4 class="title">개인회원</h4>
									<p class="category">전체개인회원정보</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table">

										<thead class="text-primary-none" style="color: #00bcd4">
											<th>회원번호</th>
											<th>아이디</th>
											<th>이름</th>
										</thead>
										<c:forEach var="pdto" items="${pdtoGuserList}">
											<tbody>
												<tr>
													<td id="guserNo"><a
														href="/admin/PeopleTable?guserNo=${pdto.guserNo}"
														style="color: #00bcd4">${pdto.guserNo}</a></td>
													<td>${pdto.guserId}</td>
													<td>${pdto.guserName}</td>
												</tr>

											</tbody>
										</c:forEach>
									</table>

								</div>

							</div>
						</div>

						<div class="col-md-6">
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h4 class="title">기업회원</h4>
									<p class="category">전체기업회원정보</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table table-hover">

										<thead class="text-primary-none" style="color: #00bcd4">
											<th>기업번호</th>
											<th>기업아이디</th>
											<th>기업명</th>
											<th>담당자명</th>
										</thead>
										<c:forEach var="cdto" items="${cdtoCompanyList}">
											<tbody>
												<tr>
													<td><a href="/admin/PeopleTable?comNo=${cdto.comNo}" style="color: #00bcd4">${cdto.comNo}</a></td>
													<td>${cdto.comId}</td>
													<td>${cdto.comName}</td>
													<td>${cdto.comManager}</td>
												</tr>

											</tbody>
										</c:forEach>

									</table>
								</div>
							</div>
						</div>


						<div class="col-md-12" id="guserInfo" style="display: none">						
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h4 class="title">상세정보</h4>
									<p class="category">선택회원상세정보</p>
								</div>
								<div class="card-content table-responsive">
									<!-- <table class="comDetail" style="display:none"> -->
									<table class="comDetail">

										<thead class="text-primary-none" style="color: #00bcd4">
											<th width="40px">번호</th>
											<th width="80px">아이디</th>											
											<th width="100px">이름</th>
											<th width="80px">성별</th>
											<th width="150px">핸드폰</th>
											<th width="200px">이메일</th>
											<th width="200px">가입일</th>
										</thead>
										
										

										<tbody>
											<tr>
												<td width="40px">${guserDetail.guserNo}</td>
												<td width="80px">${guserDetail.guserId}</td>												
												<td width="100px">${guserDetail.guserName}</td>
												<td width="80px">${guserDetail.guserGender}</td>
												<td width="150px">${guserDetail.guserPhone}</td>
												<td width="200px">${guserDetail.guserEmail}</td>
												<td width="200px"><fmt:formatDate value="${guserDetail.guserDate}" pattern="yyyy-MM-dd"/></td>
												
											</tr>
										</tbody>
										
										<thead class="text-primary-none" style="color: #00bcd4">
											<th width="40px">모임번호</th>
											<th width="150px">모임이름</th>											
											<th width="100px">모임생성날짜</th>						
											<th width="100px">회원이름</th>
											<th width="100px">카테고리Top</th>
											<th width="100px">카테고리Bot</th>
											<th width="100px">모임지역</th>
											
										</thead>
										<c:forEach var="gather" items="${gather}">
										<tbody>
											<tr>
												<td width="40px">${gather.gatherNo}</td>
												<td width="150px">${gather.gatherSubject}</td>												
												<td width="100px">${gather.gatherWrite}</td>
												<td width="100px">${guserDetail.guserId}</td>
												<td width="100px">${gather.gatherCategoryTop}</td>
												<td width="100px">${gather.gatherCategoryBot}</td>
												<td width="100px">${gather.gatherArea}</td>
												
											</tr>
										</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						
					<div class="col-md-12" id="comInfo" style="display: none">						
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h4 class="title">상세정보</h4>
									<p class="category">선택기업회원상세정보</p>
								</div>
								<div class="card-content table-responsive">
									<!-- <table class="comDetail" style="display:none"> -->
									<table class="comDetail">

										<thead class="text-primary-none" style="color: #00bcd4">
											<th width="40px">번호</th>
											<th width="80px">아이디</th>											
											<th width="100px">기업명</th>
											<th width="80px">담당자명</th>
											<th width="150px">핸드폰</th>
											<th width="200px">이메일</th>
											<th width="80px">사업자번호</th>
											<th width="80px">우편번호</th>
											<th width="230px">주소</th>
											<th width="230px">상세주소</th>
											<th width="80px">사업주명</th>
											<th width="200px">가입일</th>
										</thead>

										<tbody>
											<tr>
												<td width="40px">${companyDetail.comNo}</td>
												<td width="80px">${companyDetail.comId}</td>												
												<td width="100px">${companyDetail.comName}</td>
												<td width="80px">${companyDetail.comManager}</td>
												<td width="150px">${companyDetail.comPhone}</td>
												<td width="200px">${companyDetail.comEmail}</td>
												<td width="80px">${companyDetail.comSaNo}</td>
												<td width="80px">${companyDetail.comZoneCode}</td>
												<td width="230px">${companyDetail.comRoadAddress}</td>
												<td width="230px">${companyDetail.comDetailAddress}</td>												
												<td width="80px">${companyDetail.comCeoName}</td>
												<td width="200px"><fmt:formatDate value="${companyDetail.comDate}" pattern="yyyy-MM-dd"/></td>
												
											</tr>
										</tbody>

									</table>
								</div>
							</div>
						</div>
							
						
					</div>
				</div>
			</div>

			<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
				<ul>
					<li><a href="#"> Home </a></li>
					<li><a href="#"> Company </a></li>
					<li><a href="#"> Portfolio </a></li>
					<li><a href="#"> Blog </a></li>
				</ul>
				</nav>
				<p class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					<a href="http://www.creative-tim.com">Creative Tim</a>, made with
					love for a better web
				</p>
			</div>
			</footer>
		</div>
	</div>

</body>

<!--   Core JS Files   -->
<script src="/resources/admin/js/jquery-3.1.0.min.js"
	type="text/javascript"></script>
<script src="/resources/admin/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="/resources/admin/js/material.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="/resources/admin/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/resources/admin/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Material Dashboard javascript methods -->
<script src="/resources/admin/js/material-dashboard.js"></script>

<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/admin/js/demo.js"></script>

</html>
