<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="apple-touch-icon" sizes="76x76" href="/resources/admin/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="/resources/admin/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Material Dashboard by Creative Tim</title>

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
	    <div class="sidebar" data-color="purple" data-image="/resources/admin/img/sidebar-1.jpg">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a href="" class="simple-text">
					DAMOYO 관리자
				</a>
			</div>

	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	                <li class="active">
	                    <a href="dashboard.jsp">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="user.jsp">
	                        <i class="material-icons">person</i>
	                        <p>회원관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="table.jsp">
	                        <i class="material-icons">content_paste</i>
	                        <p>게시판관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="typography.jsp">
	                        <i class="material-icons">library_books</i>
	                        <p>카테고리관리</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="icons.jsp">
	                        <i class="material-icons">bubble_chart</i>
	                        <p>통계보기</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="maps.jsp">
	                        <i class="material-icons">location_on</i>
	                        <p>지도</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="notifications.jsp">
	                        <i class="material-icons text-gray">notifications</i>
	                        <p>배너보기</p>
	                    </a>
	                </li>
					<li class="active-pro">
	                    <a href="upgrade.jsp">
	                        <i class="material-icons">unarchive</i>
	                        <p>Upgrade to PRO</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
		</div>

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
						<a class="navbar-brand" href="#">Google Maps</a>
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
									<span class="notification">5</span>
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

			<div id="map"></div>

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

    <script>
        $().ready(function(){
            demo.initGoogleMaps();
        });
    </script>

</html>
