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

	        <div class="content">
	            <div class="container-fluid">
                    <div class="row">
    					<div class="col-md-8 col-md-offset-2">
                            <div class="card">
                                <div class="card-header text-center" data-background-color="purple">
                                    <h4 class="title">Material Dashboard PRO</h3>
                                    <p class="category">Are you looking for more components? Please check our Premium Version of Material Dashboard.</p>
                                </div>
                                <div class="card-content">
                                    <div class="table-responsive table-upgrade">
                                        <table class="table">
                                            <thead>
                                                <th></th>
                                            	<th class="text-center">Free</th>
                                            	<th class="text-center">PRO</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                	<td>Components</td>
                                                	<td class="text-center">60</td>
                                                	<td class="text-center">200</td>
                                                </tr>
                                                <tr>
                                                	<td>Plugins</td>
                                                	<td class="text-center">2</td>
                                                	<td class="text-center">15</td>
                                                </tr>
                                                <tr>
                                                	<td>Example Pages</td>
                                                	<td class="text-center">3</td>
                                                	<td class="text-center">27</td>
                                                </tr>
												<tr>
                                                	<td>Login, Register, Pricing, Lock Pages</td>
        											<td class="text-center"><i class="fa fa-times text-danger"></i></td>
                                                	<td class="text-center"><i class="fa fa-check text-success"></td>
                                                </tr>
												<tr>
                                                	<td>DataTables, VectorMap, SweetAlert, Wizard, jQueryValidation, FullCalendar etc...</td>
        											<td class="text-center"><i class="fa fa-times text-danger"></i></td>
                                                	<td class="text-center"><i class="fa fa-check text-success"></td>
                                                </tr>
												<tr>
                                                	<td>Mini Sidebar</td>
        											<td class="text-center"><i class="fa fa-times text-danger"></i></td>
                                                	<td class="text-center"><i class="fa fa-check text-success"></td>
                                                </tr>
        										<tr>
                                                	<td>Premium Support</td>
        											<td class="text-center"><i class="fa fa-times text-danger"></i></td>
                                                	<td class="text-center"><i class="fa fa-check text-success"></td>
                                                </tr>
        										<tr>
                                                	<td></td>
        											<td class="text-center">Free</td>
                                                	<td class="text-center">Just $49</td>
                                                </tr>
        										<tr>
        											<td class="text-center"></td>
        											<td class="text-center">
        												<a href="#" class="btn btn-round btn-fill btn-default disabled">Current Version</a>
        											</td>
        											<td class="text-center">
        												<a target="_blank" href="http://www.creative-tim.com/product/material-dashboard-pro/?ref=md-free-upgrade-archive" class="btn btn-round btn-fill btn-info">Upgrade to PRO</a>
        											</td>
        										</tr>
                                            </tbody>
                                        </table>
                                    </div>
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
	                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
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

</html>
