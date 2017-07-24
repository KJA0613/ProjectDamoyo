<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>자유게시판</title>

<!-- Bootstrap Core CSS -->
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

			<br><br><br>
			<div class="col-xs-12 col-sm-10">

				<div id=table_section style="height: 600px;">
					<!-- Page Content -->

					<table class="table" style="width: 800px;  margin-left: 20px; border-top: 1px solid #383838;">
						<tr>
							<td colspan="2" style="border-style: hidden;">
								<h4>
									<c:if test="${boardName eq 'free'}">자유게시판</c:if>
									<c:if test="${boardName eq 'review'}">후기게시판</c:if>								
								</h4>
							</td>
							<td colspan="3" style="border-style: hidden;">
								<button class="btn btn-primary"
									onclick="location.href='/board/viewRegist?boardName=${boardName}'"
									style="float: right;">새 글 쓰기</button>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<div class="category-filter-wrapper" style="width: 300px; float: right;">
									<form action="/board/listAll" method="get">
										<div class="input-group input-group-sm">
											<input type="hidden" name="boardName" value="${boardName}" />
											<input type="search" name="query" class="form-control" placeholder="검색어" value="${query}" />
											<span class="input-group-btn">
												<button type="submit" class="btn btn-default">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
									</form>
								</div>
							</td>
						</tr>
						<tr>
							<th style="text-align: center; width: 8%">No</th>
							<th style="width: 44%">제목</th>
							<th style="text-align: center; width: 20%">작성자</th>
							<th style="text-align: center; width: 20%">작성날짜</th>
							<th style="text-align: center; width: 8%">조회수</th>
						</tr>
						<c:forEach var="post" items="${list}">
							<tr>
								<td style="text-align: center">${post.postNo}</td>
								<td>
									<a href="/board/read?postNo=${post.postNo}&page=${page}&boardName=${boardName}&query=${query}">${post.postTitle}</a>
								</td>
								<td style="text-align:center">${post.userId}</td>
								<td style="text-align:center"><fmt:formatDate value="${post.postDate}" pattern="YYYY-MM-dd" /></td>
								<td style="text-align:center">${post.postCount}</td>
							</tr>
						</c:forEach>
						<%-- 			<tr>
				<td colspan="5" class="text-center">
				<c:forEach var="number" items="${pList}"> ${number} </c:forEach>
				</td>
			</tr> --%>

					</table>
					<div style="text-align: center; margin-right: 700px; margin-left: 20px;">
						<ul class="pagination" style="margin-top: 0px; padding: 0px;">
							<c:forEach var="number" items="${pList}">
								<li>${number}</li>
							</c:forEach>
						</ul>
					</div>

					<!-- /#page-content-wrapper -->

				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script src="/resources/dist/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/dist/js/bootstrap.min.js"></script>
</body>

</html>

