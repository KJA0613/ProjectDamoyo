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

			<br>
			<div class="col-xs-12 col-sm-10">

				<!-- Page Content -->
				<div class="container" >
					<form action="/board/boardRegist" method="POST"
						style="width: 600px; margin-top: 50px">
						<table class="table" style="margin-left: 20px; border: solid 1px #ccc; padding-top: 100px">
							<tr>
								<td height="80px;" style="border: solid 1px #ccc; border-right-style: none;">
									<input type="text" class="form-control" placeholder="writer" name="disuserId" value="${pdto.guserId}" disabled="disabled" style="height: 70px">
								</td>
							</tr>
							<tr>
								<td width="550px" height="500px" style="border: solid 1px #ccc;">
									<div class="form-group"></div>
									<div class="form-group">
										<input type="text" class="form-control" placeholder="title"
											name="postTitle">
									</div>
									<div class="form-group">
										<textarea class="form-control" rows="20"
											placeholder="contents" name="postContents"></textarea>
									</div> <input type="hidden" name="boardName" value="${boardName}">
								</td>
							</tr>
						</table>
						<div style="margin-left: 20px;">
							<button type="button" class="btn btn-default" onclick="location.href='/board/listAll/boardName=${boardName}'">취소</button>
							<button type="submit" class="btn btn-primary" style="float: right;">작성</button>
						</div>
						<input type="hidden" name="userId" value="${pdto.guserId}">	
					</form>
				</div>


				<!-- /#page-content-wrapper -->

			</div>
			<!-- /#wrapper -->
		</div>

	</div>

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

