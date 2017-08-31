<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function save() {
 		var ds = document.getElementById("dataset");
		var url = "modifySchedule";
		ds.action = url;
		ds.submit();
		window.opener.location.reload();
		//window.close();
		//window.opener.location.reload();
		//setTimeout("closeWindow()", 5000);
	}

	function closeWindow() {
		window.close();
	}
	
	function back() {
		var mc = document.getElementById("markedContents");
		var sd = document.getElementById("startDate");
		var ed = document.getElementById("endDate");
		var dc = document.getElementById("detailedContents");
		var area1 = document.getElementById("firstArea");
		var area2 = document.getElementById("secondArea");
		
		mc.setAttribute("readonly", "readonly");
		sd.setAttribute("readonly", "readonly");
		ed.setAttribute("readonly", "readonly");
		dc.setAttribute("readonly", "readonly");
		
		area1.removeAttribute("style");
		area2.setAttribute("style", "display: none;");
	}
	
	function modify() {
		var mc = document.getElementById("markedContents");
		var sd = document.getElementById("startDate");
		var ed = document.getElementById("endDate");
		var dc = document.getElementById("detailedContents");
		var area1 = document.getElementById("firstArea");
		var area2 = document.getElementById("secondArea");
		
		mc.removeAttribute("readonly");
		sd.removeAttribute("readonly");
		ed.removeAttribute("readonly");
		dc.removeAttribute("readonly");
		
		area1.setAttribute("style", "display: none;");
		area2.removeAttribute("style");
	}
	
	function remove() {
		var ds = document.getElementById("dataset");
		var url = "removeSchedule";
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
				상세 일정
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" action="" method="POST" id="dataset">
				<div class="form-group">
					<label>표시 내용</label> 
					<input type="text" class="form-control" id="markedContents" name="markedContents" value="${schedule.markedContents}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>일정 시작 날짜</label> 
					<input type="date" class="form-control" id="startDate" name="startDate" value="${schedule.startDate}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>일정 마감 날짜</label> 
					<input type="date" class="form-control" id="endDate" name="endDate" value="${schedule.endDate}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>상세 내용</label> 
					<textarea class="form-control" rows="7" id="detailedContents" name="detailedContents" readonly="readonly">${schedule.detailedContents}</textarea>
				</div>
				<input type="hidden" name="sid" value="${sid}">
				<input type="hidden" name="blogId" value="${blogId}">				
			</form>
			<div id="firstArea">
				<button class="btn btn-warning" onclick="closeWindow()">취소</button>
				<c:choose>
				<c:when test = "${null ne pdto.guserId}">
				<button class="btn btn-info" type="button" id="btnModify" onclick="modify()" style="float: right;">수정</button>
				</c:when>
				</c:choose>
			</div>
			<div id="secondArea" style="display: none;">
				<button class="btn btn-warning" onclick="back()">돌아가기</button>
				<button class="btn btn-danger" onclick="remove()">삭제</button>
				<button class="btn btn-primary" type="button" id="btnModify" onclick="save()" style="float: right;">저장</button>
			</div>
		</div>
	</article>
	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

</body>

</html>

