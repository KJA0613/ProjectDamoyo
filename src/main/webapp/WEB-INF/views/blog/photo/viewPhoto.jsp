<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

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
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
   src="http://scriptmoa.cafe24.com/scriptmoa/jQuery/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- <script type="text/javascript">
	$('#myModal').on('show.bs.modal', function(event) {
		var href = $(event.relatedTarget);
		var no = href.data('no');
		
		var modal = $(this);
		modal.find('#modal-body-no').text(no);
	});
</script> -->

<script type="text/javascript">
	function data_send(no) {
		var temp = document.getElementsByClassName(no);
		var title = temp[0].innerHTML;
		var imgNo = temp[1].innerHTML;
		var imgPath = temp[2].getAttribute('src');
		var imgContents = temp[3].innerHTML;
		
		var modalImg = document.getElementById('modal_img');
		modalImg.setAttribute('src', imgPath);
		var modalTitle = document.getElementById('modal-title');
		modalTitle.innerHTML = title;
		var modalTitle = document.getElementById('modal-no');
		modalTitle.innerHTML = imgNo;
		var modalContents = document.getElementById('modal-contents');
		modalContents.innerHTML = imgContents;
		var removeNo = document.getElementById('remove_no');
		removeNo.value = imgNo.split("#")[1];
	}
	
	function go_modify() {
 		var ds = document.getElementById("dataset");
		var url = "viewModifyPhoto";
		ds.action = url;
		ds.submit();
	}
</script>

</head>

<body>

	<div id="wrapper" class="toggled">

		<%@ include file="../includeSub.jspf"%>
	</div>
	<div class="container" style="margin-left: 300px;">
		<button class="btn btn-primary" onclick="location.href='viewUploadPhoto'" style="float: right; margin-top: 50px;">이미지 업로드</button>
		<h4 style="margin-top: 50px;">사진첩</h4>
		<div class="row" style="margin-top: 40px;">
			<c:forEach var="image" items="${imgList}">
				<div class="col-md-4">
					<a href="#myModal" class="thumbnail" data-toggle="modal" onclick="data_send(${image.imageNo})">
						<div id="imgTitle" class="${image.imageNo}">${image.imageTitle}</div>
						<div id="imgNo" class="${image.imageNo}">#${image.imageNo}</div>
						<img src="${image.uploadImg}" id="imgPath" style="width: 220px; height: 250px;" class="${image.imageNo}">
						<div id="imgContents" class="${image.imageNo}" style="display: none;">${image.imageContents}</div>
					</a>
				</div>
			</c:forEach>
			 
			
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title" id="modal-title"></h4>
							<h6 class="modal-title" id="modal-no"></h6>
						</div>
						<div class="modal-body">
							<img id="modal_img" style="width: 400px; height: 400px; text-align: center; margin-left: 80px;"><br>
							<h6 id="modal-contents" style="float: left;"></h6> <br><br>
						</div>
						<div class="modal-footer">
							<form action="/blog/photo/removePhoto" method="post" id="dataset">
								<input type="hidden" id=remove_no name="imgNo">
								<button type="button" class="btn btn-success" data-dismiss="modal">목록으로</button>
								<button class="btn btn-warning" type="button" style="float: left;" onclick="go_modify()" disabled="disabled">수정</button>
								<button class="btn btn-danger" type="submit" style="float: left;">삭제</button>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>



	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

</body>

</html>

