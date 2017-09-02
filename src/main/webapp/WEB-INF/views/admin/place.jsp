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
						<div class="col-md-6">
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h4 class="title">가장 많은 동네</h4>
									<p class="category">높은 순서대로</p>
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
									<h4 class="title">가장 많은 카테고리</h4>
									<p class="category">높은 순서대로</p>
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
									<h4 class="title">영업중인 장소</h4>
									<p class="category">영업중인 모임인지..</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table">
										<thead class="text-primary-none" style="color: #00bcd4">
											<th>장소 번호</th>
											<th>장소 명</th>
											<th>장소 생성자</th>
											<th>장소 지역</th>
											<th>장소 분류</th>
											<th>장소 번호</th>
											<th>장소 홈페이지</th>
											<th>장소 가격</th>
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
