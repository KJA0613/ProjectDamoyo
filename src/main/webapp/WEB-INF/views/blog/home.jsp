<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Damoyo Blog</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/blog/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/blog/css/simple-sidebar.css" rel="stylesheet">

</head>
<body>
	<div id="wrapper" class="toggled">

		<%@ include file="./includeSub.jspf" %>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>비트교육센터</h1>
						<p>2조 스터디</p>
						<p>
							블로그 메인
						</p>
						<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
<!-- 	<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script> -->

</body>

</html>

