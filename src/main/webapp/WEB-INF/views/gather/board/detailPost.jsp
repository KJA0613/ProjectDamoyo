<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function go_url(type) {
		var ds = document.getElementById("dataset");
		var page = document.getElementById("page");
		var boardName = document.getElementById("boardName");
		var query = document.getElementById("query");
		
		var url = "/board/listAll?page=" + page.value + "&boardName=" + boardName.value + "&query=" + query.value; /*  히든태그로 boardName이 가기 때문에  여기서 "&boardName="+boardName.value 를 하면 boardName이 2개가서 에러임*/
		if (type == 2) {
			url = "/board/viewModify?boardName=" + boardName.value + "&query=" + query.value;
		} else if (type == 3) {
			url = "/board/remove?boardName=" + boardName.value + "&query=" + query.value;
		}
		ds.action = url;
		ds.submit();
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

				<div id=table_section style="padding-top: 20px; margin-left: 20px; ">

					<%-- <%@ include file="./includeSub.jspf"%> --%>
					<!-- Page Content -->
					<form action="" method="POST" id="dataset">
						<table class="table"
							style="width: 700px; margin-left: 20px; border: solid 1px #ccc;">
							<tr>
								<td style="border-left-style: hidden; border-top-style: hidden;">
								<h4>
									<c:if test="${post.boardName eq 'free'}">자유게시판</c:if>
									<c:if test="${post.boardName eq 'review'}">후기게시판</c:if>	
								</h4>
								</td>
								<td
									style="border-right-style: hidden; border-top-style: hidden; padding-right: 0px;">
									<a href="/board/viewRegist?boardName=${post.boardName}"><button
											type="button" class="btn btn-primary" style="float: right;">새
											글 쓰기</button></a>
								</td>
							</tr>
							<tr>
								<td
									style="height: 50px; border: solid 1px #ccc; border-right-style: none;">
									<i class="fa fa-user-circle-o fa-2x" aria-hidden="true"></i>
									${post.userId}
								</td>
								<td
									style="border: solid 1px #ccc; text-align: right; border-left-style: none;">
									<i class="fa fa-eye fa-lg" aria-hidden="true"></i>
									${post.postCount}
								</td>
							</tr>
							<tr>
								<td width="600px" style="border: solid 1px #ccc;">
									#${post.postNo}
									<h3>${post.postTitle}</h3>
								</td>
								<td
									style="border: solid 1px #ccc; text-align: right; border-bottom-style: none;">
									<i class="fa fa-thumbs-o-up fa-lg" aria-hidden="true"></i>
									${post.postRecommend}
								</td>
							</tr>
							<tr>
								<td
									style="height: 400px; border: solid 1px #ccc; border-bottom-style: none;">${post.postContents}</td>
								<td style="border: solid 1px #ccc; border-top-style: none;"></td>
							</tr>

						</table>
						<input type="hidden" name="page" id="page" value="${page}">
						<input type="hidden" name=postNo value="${post.postNo}"> <input
							type="hidden" name="userId" value="${post.userId}" /> <input
							type="hidden" name="postTitle" value="${post.postTitle}" /> <input
							type="hidden" name="postContents" value="${post.postContents}" />
						<%-- <input type="hidden" name="boardName" value="${post.boardName}">  --%>
						<div style="padding-left: 19px">
							<button type="button" class="btn btn-success" onclick="go_url(1)">목록</button>
							<c:if test="${post.userId eq pdto.guserId}">
								<button type="button" class="btn btn-warning" onclick="go_url(2)">수정</button>
								<button type="button" class="btn btn-danger" onclick="go_url(3)">삭제</button>
							</c:if>
						</div>
					</form>

					<br />
					<br />

					<table class="table"
						style="width: 700px; margin-left: 20px; border: solid 1px #ccc;">
						<tr>
							<td style="border: solid 2px #ccc; border-right-style: none;">답변</td>
							<td style="border: solid 2px #ccc; border-left-style: none;"></td>
						</tr>
						<c:forEach var="reply" items="${list}">
							<tr style="height: 40px;">
								<td><i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
									${reply.replyUserId}</td>
								<td></td>
							</tr>
							<tr style="height: 120px;">
								<td>${reply.replyContents}</td>
								<td></td>
							</tr>
						</c:forEach>
					</table>

					<form action="/board/reply" method="POST" style="margin-top: 70px">
						<table class="table"
							style="width: 700px; margin-left: 20px; border: solid 1px #ccc;">
							<tr>
								<td style="border: solid 1px #ccc; width: 600px;">
									<input type="text" name="disreplyUserId" style="margin-bottom: 10px" value="${pdto.guserId}" disabled="disabled">
									<!-- 아이디 --> <textarea class="form-control" rows="5"
										placeholder="comment" name="replyContents"></textarea> <!-- 내용 -->
								</td>
								<td style="float: right; padding-top: 130px;">
									<button class="btn btn-success" style="margin-left: 0px">작성</button>
									<input type="hidden" name="replyNo" value="${post.replyCounts+1}"> <!-- replyCounts는 현재 댓글의 no를 뜻함, 보낼떄 replyNo를 replyCount+1를 하여 replyNo를 1씩 올려줌  -->
									<input type="hidden" name="postNo" value="${post.postNo}"> <!-- 현재 게시글의 no --> 
									<input type="hidden" name="page" id="page" value="${page}"> 
									<input type="hidden" id="boardName" name="boardName" value="${post.boardName}">
									<input type="hidden" id="query" name="query" value="${query}">
									<input type="hidden" name="replyUserId" value="${pdto.guserId}">
								</td>
							</tr>
						</table>
					</form>
				</div>
				<!-- /#wrapper -->
			</div>
		</div>
	</div>
	<br><br>

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

