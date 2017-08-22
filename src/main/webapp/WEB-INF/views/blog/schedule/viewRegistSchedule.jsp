<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function closeWindow() {
		window.close();
	}
	
	function sendData() {
 		var ds = document.getElementById("dataset");
		var url = "registSchedule";
		ds.action = url;
		ds.submit();
		window.opener.location.reload();
	}
	
</script>

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
<link rel="stylesheet" href="/resources/blog/css/font-awesome.min.css">

</head>

<body>
	<article class="container">
		<div class="page-header" align="center">
			<h1>
				일정 등록
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" action="" method="POST" id="dataset">
				<div class="form-group">
					<label>표시 내용</label> 
					<input type="text" class="form-control" id="markedContents" name="markedContents" placeholder="자바 스터디 2주차">
				</div>
				<div class="form-group">
					<label>일정 시작 날짜</label> 
					<input type="date" class="form-control" id="startDate" name="startDate" placeholder="2017-07-04" value="${startDate}">
				</div>
				<div class="form-group">
					<label>일정 마감 날짜</label> 
					<input type="date" class="form-control" id="endDate" name="endDate" placeholder="2017-07-08">
				</div>
				<div class="form-group">
					<label>상세 내용</label> 
					<textarea class="form-control" rows="7" id="detailedContents" name="detailedContents" placeholder="스터디 장소 / 스터디 시각 / 스터디 내용 등"></textarea>
				</div>
			</form>
			<button class="btn btn-danger" onclick="closeWindow()">취소</button>
			<c:choose>
				<c:when test = "${null ne pdto.guserId}">
				<button class="btn btn-success" type="button" onclick="sendData()" style="float: right;">추가</button>					
				</c:when>				
			</c:choose>
		</div>
	</article>
	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

</body>

</html>

