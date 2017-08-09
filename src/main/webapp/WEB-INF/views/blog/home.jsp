<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
		<div style="margin-left: 300px;">
			<c:forEach var="gathering" items="${list2}">
				<li>${gathering.name}</li><br/>
			</c:forEach>
		</div>

		<!-- Page Content -->
		<div id="page-content-wrapper" style="background: #f1f1f1; padding-left: 100px; height: 1040px; border-style: solid;">
			<c:forEach var="dto" items="${list}">
				<li>${dto.gatherSubject}</li>><br/>
			</c:forEach>
		</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

</body>

</html>

