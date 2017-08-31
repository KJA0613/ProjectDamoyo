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

		if (tempUrl.length > 0) {
			var person = tempUrl.split('='); // '=' 을 기준으로 분리하기

			if (person[0] == 'guserNo') { // person[0] : 파라미터 명 
				$('#guserInfo').show();
			} else if (person[0] == 'comNo') {
				$('#comInfo').show();
			}
		}
	});
</script>
<script type="text/javascript">
	function gatherYes(gatherNo) {
		var no = gatherNo;
		var info = {"no" : no};
		$.ajax({
			url : '/admin/gatherYes',
			dataType : 'json',
			typoe : 'POST',
			cache : false,
			data : info,
			success : function(data){
				alert('승인 완료되었습니다');
			},
			error : function(request, status, error){
				alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
			}
		});
	}
	
	function gatherNo(gatherNo) {
		var no = gatherNo;
		var info = {"no" : no};
		$.ajax({
			url : '/admin/gatherNo',
			dataType : 'json',
			typoe : 'POST',
			cache : false,
			data : info,
			success : function(data){
				alert('승인 거절되었습니다');
			},
			error : function(request, status, error){
				alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
			}
		});
	}
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
						<div class="col-md-12">
							<div class="card">
								<div class="card-header" data-background-color="green">
									<h4 class="title">모임 생성 요청</h4>
									<p class="category">생성될 수 있는 모임인지..</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table">
										<thead class="text-primary-none" style="color: #00bcd4">
											<th>모임 번호</th>
											<th>모임 명</th>
											<th>모임 생성자</th>
											<th>모임 지역</th>
											<th>모임 분류</th>
											<th>모임 카테고리</th>
											<th>블로그 생성 유무</th>
											<th>생성 승인/거절</th>
										</thead>
										<tbody>
										<c:forEach var="waitdto" items="${waitdto}">
										<a href="#" style="color: #00bcd4">
											<tr>
												
													<td>${waitdto.gatherNo}</td>
													<td>${waitdto.gatherSubject}</td>
													<td>${waitdto.guserId}</td>
													<td>${waitdto.gatherArea}</td>
													<td>${waitdto.gatherCategoryTop}</td>
													<td>${waitdto.gatherCategoryBot}</td>
													<td>
													<c:if test="${waitdto.gatherBlog eq 'Yes'}">O</c:if>
													<c:if test="${waitdto.gatherBlog eq 'No'}">X</c:if>
													</td>
												
												<td>
													<form action="" id="recogData">
														<button type="submit" onclick='gatherYes(${waitdto.gatherNo})'>승인</button>
														<button type="submit" onclick='gatherNo(${waitdto.gatherNo})'>거절</button>
														<!-- <input type="button" id="yesBtn" value="승인"> -->
														<!-- <input type="button" id="noBtn" value="거절"> -->
													</form>
												</td>
											</tr>
										</a>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h4 class="title">승인된 모임</h4>
									<p class="category">승인된 모임인지..</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table">
										<thead class="text-primary-none" style="color: #00bcd4">
											<th>모임 번호</th>
											<th>모임 명</th>
											<th>모임 생성자</th>
											<th>모임 지역</th>
											<th>모임 분류</th>
											<th>모임 카테고리</th>
											<th>블로그 생성 유무</th>
										</thead>
										<tbody>
										<c:forEach var="yesdto" items="${yesdto}">
										<a href="#" style="color: #00bcd4">
											<tr>
												<td>${yesdto.gatherNo}</td>
												<td>${yesdto.gatherSubject}</td>
												<td>${yesdto.guserId}</td>
												<td>${yesdto.gatherArea}</td>
												<td>${yesdto.gatherCategoryTop}</td>
												<td>${yesdto.gatherCategoryBot}</td>
												<td>
													<c:if test="${yesdto.gatherBlog eq 'Yes'}">O</c:if>
													<c:if test="${yesdto.gatherBlog eq 'No'}">X</c:if>
												</td>
											</tr>
										</a>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>


						<div class="col-md-6">
							<div class="card">
								<div class="card-header" data-background-color="red">
									<h4 class="title">거절된 모임</h4>
									<p class="category">거절된 모임인지</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table">
										<thead class="text-primary-none" style="color: #00bcd4">
											<th>모임 번호</th>
											<th>모임 명</th>
											<th>모임 생성자</th>
											<th>모임 지역</th>
											<th>모임 분류</th>
											<th>모임 카테고리</th>
											<th>블로그 생성 유무</th>
										</thead>
										<tbody>
										<c:forEach var="nodto" items="${nodto}">
										<a href="#" style="color: #00bcd4">
											<tr>
												<td>${nodto.gatherNo}</td>
												<td>${nodto.gatherSubject}</td>
												<td>${nodto.guserId}</td>
												<td>${nodto.gatherArea}</td>
												<td>${nodto.gatherCategoryTop}</td>
												<td>${nodto.gatherCategoryBot}</td>
												<td>
													<c:if test="${nodto.gatherBlog eq 'Yes'}">O</c:if>
													<c:if test="${nodto.gatherBlog eq 'No'}">X</c:if>
												</td>
											</tr>
										</a>
										</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>

						<div class="col-md-12">
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title">모집중인 모임</h4>
									<p class="category">모집중인 모임인지..</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table">
										<thead class="text-primary-none" style="color: #00bcd4">
											<th>모임 번호</th>
											<th>모임 명</th>
											<th>모임 생성자</th>
											<th>모임 지역</th>
											<th>모임 분류</th>
											<th>모임 카테고리</th>
											<th>블로그 생성 유무</th>
										</thead>
										<tbody>
										<c:forEach var="yetdto" items="${yetdto}">
										<a href="#" style="color: #00bcd4">
											<tr>
												<td>${yetdto.gatherNo}</td>
												<td>${yetdto.gatherSubject}</td>
												<td>${yetdto.guserId}</td>
												<td>${yetdto.gatherArea}</td>
												<td>${yetdto.gatherCategoryTop}</td>
												<td>${yetdto.gatherCategoryBot}</td>
												<td>
													<c:if test="${yetdto.gatherBlog eq 'Yes'}">O</c:if>
													<c:if test="${yetdto.gatherBlog eq 'No'}">X</c:if>
												</td>
											</tr>
										</a>
										</c:forEach>
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
