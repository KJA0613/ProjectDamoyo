<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<style type="text/css">
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/blog/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/blog/css/simple-sidebar.css" rel="stylesheet">
</head>

<body>
	<div id=wrapper class="toggled">
	</div>
	<%@ include file="../includeSub.jspf"%>
		
	<%
		int num = (int)request.getAttribute("num");
	%>
	<div id=table_section style="margin-left: 280px; padding-top: 30px;" >
		<!-- Page Content -->

		<table class="table" style="width: 900px; border-top: 1px solid #383838; margin-left: 25px; background-color: #ffffff;">
			<tr>
				<td colspan="2" style="border-style: hidden;"><h4>자유게시판</h4></td>
				<td colspan="3" style="border-style: hidden;">
					<c:choose>
					<c:when test = "${null ne pdto.guserId}">
						<button class="btn btn-primary" onclick="location.href='/blog/board/viewRegist?blogId=${blogId}&blogName=${blogName}'" style="float: right;">새 글 쓰기</button>
					</c:when>				
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<div class="category-filter-wrapper" style="width: 300px; float: right;">
						<form action="/blog/board/search?blogId=${blogId}&blogName=${blogName}" method="post">
							<div class="input-group input-group-sm">
								<input type="search" name="query" class="form-control" placeholder="검색어" value=""/> <span class="input-group-btn">
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
					<%-- <td style="text-align: center;"><%=num</td> --%>
					<td style="text-align: center;">${post.postNo}</td>
					<td><a href="/blog/board/read?postNo=${post.postNo}&page=${page}&blogId=${blogId}&blogName=${blogName}">${post.postTitle}</a></td>
					<td style="text-align: center">${post.userId}</td>
					<td style="text-align: center"><fmt:formatDate
							value="${post.postDate}" pattern="YYYY-MM-dd" /></td>
					<td style="text-align: center">${post.postCount}</td>
				</tr>
			</c:forEach>
<%-- 			<tr>
				<td colspan="5" class="text-center">
				<c:forEach var="number" items="${pList}"> ${number} </c:forEach>
				</td>
			</tr> --%>
			
		</table>
		<div style="text-align: center; margin-right: 850px">
			<ul class="pagination" style="margin-top: 0px; padding: 0px;" >
				<c:forEach var="number" items="${pList}">
					<li>${number}</li>
				</c:forEach>
			</ul>
		</div>

		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->


	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>


</body>

</html>

