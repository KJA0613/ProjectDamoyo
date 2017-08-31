<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function go_url(type) {
		var ds = document.getElementById("dataset");
		var page = document.getElementById("page");
		var query = document.getElementById("query");
		if(query.value === "") {
			var url = "/blog/board/listAll?page=" + page.value;
		} else {
			var url = "/blog/board/search?page=" + page.value;
		}
		if (type == 2) {
			url = "/blog/board/viewModify";
		} else if (type == 3) {
			url = "/blog/board/remove";
		}
		ds.action = url;
		ds.submit();
	}
	
	function modifyReply(type) {
		var replyCon = document.getElementById("replyCon");
		replyCon.removeAttribute("readonly");
/* 		var ds = document.getElementById(type);
		ds.action = "/blog/board/modifyReply";
		ds.submit(); */
	}
	
	function removeReply(type) {
		var retVal = confirm("댓글을 삭제하시겠습니까?");
		var blogId = document.getElementById('blogId').value;
		var blogName = document.getElementById('blogName').value
		if(retVal == true) {
			var ds = document.getElementById(type);
			ds.action = "/blog/board/removeReply?blogId=" + blogId + "&blogName=" + blogName;
			ds.submit();
		} else {
		}
	}
</script>
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
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div id=wrapper class="toggled">
		<%@ include file="../includeSub.jspf"%>
	</div>

	<div id=table_section style="margin-left: 270px; padding-top: 20px;">

		<!-- Page Content -->
		<form action="" method="POST" id="dataset">
			<table class="table" style="width: 700px; margin-left: 50px; border: solid 1px #ccc; background-color: #ffffff">
				<tr>
					<td style="border-left-style: hidden; border-top-style: hidden;"><h4>자유게시판</h4></td>
					<td style="border-right-style: hidden; border-top-style: hidden; padding-right: 0px;">
						<c:choose>
							<c:when test = "${null ne pdto.guserId}">
								<a href="/blog/board/viewRegist"><button type="button" class="btn btn-primary" style="float: right;">새 글 쓰기</button></a>								
							</c:when>				
						</c:choose>
					</td>
				</tr>
				<tr>
					<td style="height: 50px; border: solid 1px #ccc; border-right-style: none;">
						<i class="fa fa-user-circle-o fa-2x" aria-hidden="true"></i>
						${post.userId}
					</td>
					<td style="border: solid 1px #ccc; text-align: right; border-left-style: none;">
						<i class="fa fa-eye fa-lg" aria-hidden="true"></i>   ${post.postCount}
					</td>
				</tr>
				<tr>
					<td width="600px" style="border: solid 1px #ccc;">
					#${post.postNo}
					<h3>${post.postTitle}</h3></td>
					<td style="border: solid 1px #ccc; text-align: right; border-bottom-style: none;">
					<i class="fa fa-thumbs-o-up fa-lg" aria-hidden="true"></i>   ${post.postRecommend}</td>
				</tr>
				<tr>
					<td style="height: 400px; border: solid 1px #ccc; border-bottom-style: none;">${post.postContents}</td>
					<td style="border: solid 1px #ccc; border-top-style: none;"></td>
				</tr>

			</table>
			<input type="hidden" name="page" id="page" value="${page}">
			<input type="hidden" name=postNo value="${post.postNo}">
			<input type="hidden" name="userId" value="${post.userId}"/>
			<input type="hidden" name="postTitle" value="${post.postTitle}"/> 
			<input type="hidden" name="postContents" value="${post.postContents}"/> 
			<input type="hidden" name="query" id="query" value="${query}">
			<input type="hidden" name="blogId" id="blogId" value="${blogId}">
			<input type="hidden" name="blogName" id="blogName" value="${blogName}">
			
			<div style="padding-left: 19px; margin-left: 30px">
				<button class="btn btn-success" onclick="go_url(1)">목록</button>
					<c:choose>
					<c:when test = "${authFlag == true}">
						<button class="btn btn-warning" onclick="go_url(2)">수정</button>
						<button class="btn btn-danger" onclick="go_url(3)">삭제</button>				
					</c:when>				
					</c:choose>
			</div>
		</form>
		
		<br/><br/>
		
		<table class="table" style="width: 700px; margin-left: 50px; border: solid 1px #ccc; background-color: #ffffff">
			<tr>
				<td style="border: solid 2px #ccc; border-right-style: none;">답변</td>
				<td style="border: solid 2px #ccc; border-left-style: none;"></td>
			</tr>
			<c:forEach var="reply" items="${list}">
			<tr style="height: 40px;">
				<td>
					<i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
					${reply.replyUserId}
				</td>
				<form action="" method="POST" id="${reply.replyNo}">
					<input type="hidden" name="replyNo" value="${reply.replyNo}"/>
					<input type="hidden" name="boardName" value="free"/>
					<input type="hidden" name="postNo" value="${post.postNo}"/>
					<input type="hidden" name="page" id="page" value="${page}">
				</form>
				<td>
					<c:choose>
					<c:when test = "${pdto.guserId == reply.replyUserId}">
					<a href="javascript:modifyReply(${reply.replyNo});" style="float: right; margin-left: 20px;">수정</a>
					<a href="javascript:removeReply(${reply.replyNo});" style="float: right;">삭제</a>
					</c:when>
					</c:choose>
				</td>
			</tr>
			<tr style="height: 120px;">
				<td>
					<input type="text" id="replyCon" value="${reply.replyContents}" style="border-style: none;" readonly="readonly" />
				</td>
				<td></td>
			</tr>
			</c:forEach>
		</table>
		
		<c:choose>
		<c:when test = "${null ne pdto.guserId}">
		<form action="/blog/board/reply?blogId=${blogId}&blogName=${blogName}" method="POST" style="margin-top: 70px">
			<table class="table" style="width: 700px; margin-left: 50px; border: solid 1px #ccc;">
				<tr>
					<td style="border: solid 1px #ccc; width: 600px;">
						<input type="text" name="replyUserId" value="${pdto.guserId}" style="margin-bottom: 10px; border-style: none;" readonly="readonly">
						<textarea class="form-control" rows="5" placeholder="comment" name="replyContents" ></textarea>
					</td>
					<td style="float: right; padding-top: 130px;">
						<button class="btn btn-success" style="margin-left: 0px">작성</button>											
						<input type="hidden" name="replyNo" value="${post.replyCounts+1}">
						<input type="hidden" name="postNo" value="${post.postNo}">
						<input type="hidden" name="page" id="page" value="${page}">						
					</td>
			</tr>
		</table>
	</form>
	</c:when>
	</c:choose>
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

