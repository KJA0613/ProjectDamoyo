<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/admin/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="/resources/admin/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>관리자페이지 메인 대쉬보드</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="/resources/admin/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="/resources/admin/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/admin/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>

	<div class="wrapper">

	    <%@ include file="./admin_sidebar.jspf"%>

	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">DAMOYO 관리자 페이지</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">notifications</i>
									<span class="notification">N</span>
									<p class="hidden-lg hidden-md">Notifications</p>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Mike John responded to your email</a></li>
									<li><a href="#">You have 5 new tasks</a></li>
									<li><a href="#">You're now friend with Andrew</a></li>
									<li><a href="#">Another Notification</a></li>
									<li><a href="#">Another One</a></li>
								</ul>
							</li>
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
	 							   <i class="material-icons">person</i>
	 							   <p class="hidden-lg hidden-md">Profile</p>
		 						</a>
							</li>
						</ul>

						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
								<input type="text" class="form-control" placeholder="Search">
								<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i><div class="ripple-container"></div>
							</button>
						</form>
					</div>
				</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange">
									<i class="material-icons">content_copy</i>
								</div>
								<div class="card-content">
									<p class="category">총 모임 수</p>
									<h3 class="title">
									<c:out value="${gpCnt['GATHERCNTALL']}"/>
									<small>모임</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons text-danger">warning</i> <a href="#pablo">Get More Space...</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<i class="material-icons">store</i>
								</div>
								<div class="card-content">
									<p class="category">총 광고 수</p>
									<h3 class="title">
									<c:out value="${gpCnt['PLACECNTALL']}"/>
									<small>장소</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">date_range</i> Last 24 Hours
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="red">
									<i class="material-icons">info_outline</i>
								</div>
								<div class="card-content">
									<p class="category">신고 모임 수</p>
									<h3 class="title">0</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">local_offer</i> Tracked from Github
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="blue">
									<i class="fa fa-twitter"></i>
								</div>
								<div class="card-content">
									<p class="category">생성 모임 요청 수</p>
									<h3 class="title">
									<c:out value="${gpCnt['GATHERREQUEST']}"/>									
									<small>모임</small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header card-chart" data-background-color="orange">
									<div class="ct-chart" id="dailySalesChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">요일별 접속자</h4>
									<p class="category"><span class="text-success"><i class="fa fa-long-arrow-up"></i> 55%  </span> increase in today sales.</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> updated 4 minutes ago
									</div>
								</div>
							</div>
						</div>

						<!-- <div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart" data-background-color="orange">
									<div class="ct-chart" id="emailsSubscriptionChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">월별 접속자 / 모집글 / 광고글</h4>
									<p class="category">Last Campaign Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days ago
									</div>
								</div>

							</div>
						</div> -->

						<div class="col-md-6">
							<div class="card">
								<div class="card-header card-chart" data-background-color="red">
									<div class="ct-chart" id="completedTasksChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">시간별 접속자</h4>
									<p class="category">Last Campaign Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days ago
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
							<div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">모임 분야별 많은 순</h4>
	                                <p class="category">New employees on 15th September, 2016</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead class="text-warning">
	                                        <th>순위</th>
	                                    	<th>분야명</th>
	                                    	<th>모임수</th>
	                                    </thead>
	                                    <c:forEach var="type" items="${typeRank}" varStatus="rank">
		                                    <tbody>
		                                        <tr>
		                                        	<td>${rank.count}</td>
		                                        	<td>${type.gatherType}</td>
		                                        	<td>${type.typeCnt}</td>
		                                        </tr>
		                                    </tbody>
	                                    </c:forEach>
	                                </table>
	                            </div>
	                        </div>
						</div>

					
						<div class="col-md-4">
							<div class="card">
	                            <div class="card-header" data-background-color="green">
	                                <h4 class="title">모임 카테고리별 많은순</h4>
	                                <p class="category">New employees on 15th September, 2016</p>
	                            </div>
	                            
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead class="text-warning">
	                                        <th>순위</th>
	                                    	<th>카테고리명</th>
	                                    	<th>모임수</th>
	                                    </thead>
	                                    <c:forEach var="category" items="${categoryRank}" varStatus="rank">
		                                    <tbody>
		                                        <tr>
		                                        	<td>${rank.count}</td>
		                                        	<td>${category.gatherType}</td>
		                                        	<td>${category.typeCnt}</td>
		                                        </tr>
		                                    </tbody>
	                                    </c:forEach>
	                                </table>
	                            </div>
	                        </div>
						</div>
						
						
						<div class="col-md-4">
							<div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">모임 지역별 많은 순</h4>
	                                <p class="category">New employees on 15th September, 2016</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead class="text-warning">
	                                        <th>순위</th>
	                                    	<th>지역명</th>
	                                    	<th>모임수</th>
	                                    </thead>
	                                    <c:forEach var="area" items="${areaRank}" varStatus="rank">
		                                    <tbody>
		                                        <tr>
		                                        	<td>${rank.count}</td>
		                                        	<td>${area.gatherType}</td>
		                                        	<td>${area.typeCnt}</td>
		                                        </tr>
		                                    </tbody>
	                                    </c:forEach>
	                                </table>
	                            </div>
	                        </div>
						</div>
					
				</div>
			</div>

			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li>
								<a href="#">
									Home
								</a>
							</li>
							<li>
								<a href="#">
									Company
								</a>
							</li>
							<li>
								<a href="#">
									Portfolio
								</a>
							</li>
							<li>
								<a href="#">
								   Blog
								</a>
							</li>
						</ul>
					</nav>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> <a href="">Creative Tim</a>, made with love for a better web
					</p>
				</div>
			</footer>
		</div>
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="/resources/admin/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="/resources/admin/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/resources/admin/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="/resources/admin/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="/resources/admin/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="/resources/admin/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="/resources/admin/js/demo.js"></script>

	<script type="text/javascript">
    	$(document).ready(function(){

			// Javascript method's body can be found in assets/js/demos.js
        	demo.initDashboardPageCharts();

    	});
	</script>
	
	<input type="hidden" id="week1" value="<c:out value="${week['월요일']}"/>">
	<input type="hidden" id="week2" value="<c:out value="${week['화요일']}"/>">
	<input type="hidden" id="week3" value="<c:out value="${week['수요일']}"/>">
	<input type="hidden" id="week4" value="<c:out value="${week['목요일']}"/>">
	<input type="hidden" id="week5" value="<c:out value="${week['금요일']}"/>">
	<input type="hidden" id="week6" value="<c:out value="${week['토요일']}"/>">
	<input type="hidden" id="week7" value="<c:out value="${week['일요일']}"/>">
	
	<input type="hidden" id="time00" value="<c:out value="${time['00']+time['01']}"/>">
	<input type="hidden" id="time02" value="<c:out value="${time['02']+time['03']}"/>">
	<input type="hidden" id="time04" value="<c:out value="${time['04']+time['05']}"/>">
	<input type="hidden" id="time06" value="<c:out value="${time['06']+time['07']}"/>">
	<input type="hidden" id="time08" value="<c:out value="${time['08']+time['09']}"/>">
	<input type="hidden" id="time10" value="<c:out value="${time['10']+time['11']}"/>">
	<input type="hidden" id="time12" value="<c:out value="${time['12']+time['13']}"/>">
	<input type="hidden" id="time14" value="<c:out value="${time['14']+time['15']}"/>">
	<input type="hidden" id="time16" value="<c:out value="${time['16']+time['17']}"/>">
	<input type="hidden" id="time18" value="<c:out value="${time['18']+time['19']}"/>">
	<input type="hidden" id="time20" value="<c:out value="${time['20']+time['21']}"/>">
	<input type="hidden" id="time22" value="<c:out value="${time['22']+time['23']}"/>">
	
</html>