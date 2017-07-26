<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<style type="text/css">

</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/blog/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/blog/css/simple-sidebar.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper" class="toggled">

		<%@ include file="../includeSub.jspf" %>

		<!-- Page Content -->
		<div class="container" style="margin-left: 20px;">
			<form action="/blog/board/modify" method="POST" style="width:600px; margin-top: 70px">
				<table class="table" style="width: 700px; margin-left: 20px; border: solid 1px #ccc; padding-top: 100px">
						<tr>
							<td height="60px;" style="border: solid 1px #ccc; border-right-style: none; padding-left: 15px;">
								<div>#${post.postNo}</div>
								<div>${post.userId}</div>
									<%-- <input type="text" class="form-control" name="userId" value="${post.userId}" style="height: 70px; border: none;"> --%>
							</td>
						</tr>
						<tr>
							<td width="550px" height="500px" style="border: solid 1px #ccc; padding: 50px;" >
								<div class="form-group">
									 <input type="text" class="form-control" name="postTitle" value="${post.postTitle}">
								</div>
								<div class="form-group">
									<textarea class="form-control" rows="15" name="postContents">${post.postContents}</textarea>
								</div>
								<input type="hidden" name="postNo" value="${post.postNo}" />
								<input type="hidden" name="page" value="${page}">
								<div style="width: 600px;">
									<a href="javascript:history.back()"><button type="button" class="btn btn-default">취소</button></a>
									<button type="submit" class="btn btn-warning" style="float: right;">저장</button>
								</div>							
							</td>
						</tr>
				</table>
			</form>
		</div>


		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>

