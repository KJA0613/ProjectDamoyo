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

<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/dist/css/simple-sidebar.css" rel="stylesheet">
<!-- 돋보기 -->
<link rel="stylesheet" href="/resources/dist/css/font-awesome.min.css">

<%@include file="../../header.jsp"%>

</head>

<body>
	
	<!-- 부트스트랩을 감싸는 컨테이너 -->
	<div class="container">

		<!-- row는 수평 horizen과 같음, 왼쪽부터 배치하겠다  -->
		<div class="row row-offcanvas row-offcanvas-right">

			<%@ include file="../../gather/gathering_sidebar.jspf"%>

			<!--/.sidebar-offcanvas-->

			<div class="col-xs-12 col-sm-10">

				<!-- Page Content -->
				<div class="container" >
					<form action="/board/modify" method="POST"
						style="width: 600px; margin-top: 50px">
						<table class="table"
							style="width: 700px; margin-left: 20px; border: solid 1px #ccc; padding-top: 100px">
							<tr>
								<td height="60px;"
									style="border: solid 1px #ccc; border-right-style: none; padding-left: 15px;">
									<div>#${post.postNo}</div>
									<div>${post.userId}</div> <%-- <input type="text" class="form-control" name="userId" value="${post.userId}" style="height: 70px; border: none;"> --%>
								</td>
							</tr>
							<tr>
								<td width="550px" height="500px"
									style="border: solid 1px #ccc; padding: 50px;">
									<div class="form-group">
										<input type="text" class="form-control" name="postTitle"
											value="${post.postTitle}">
									</div>
									<div class="form-group">
										<textarea class="form-control" rows="15" name="postContents">${post.postContents}</textarea>
									</div> 
									<input type="hidden" name="postNo" value="${post.postNo}" />
									<input type="hidden" name="page" value="${page}" /> 
									<input type="hidden" name="boardName" value="${post.boardName}" />
									<input type="hidden" name="query" value="${query}" />
									<div style="width: 600px;">
										<a href="javascript:history.back()">
											<button type="button" class="btn btn-default">취소</button>
										</a>
										<button type="submit" class="btn btn-warning"
											style="float: right;">저장</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>


		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

</body>

</html>

