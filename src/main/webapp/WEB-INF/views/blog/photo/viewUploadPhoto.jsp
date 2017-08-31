<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
/*         $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
            }
              reader.readAsDataURL(input.files[0]);
            }
        } */
        
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                    var imgObj = document.getElementById('imgWindow');
                    imgObj.src = e.target.result;
            }
              reader.readAsDataURL(input.files[0]);
            }
        }
</script>
</head>

<body>

	<div id="wrapper" class="toggled">

		<%@ include file="../includeSub.jspf" %>
				
		<div class="container" style="margin-left: 20px;">
			<h4 style="margin-top: 50px; margin-left: 50px;">이미지 업로드</h4>
			<form action="/blog/photo/uploadPhoto?blogId=${blogId}&blogName=${blogName}" method="POST" enctype="multipart/form-data" style="width:600px; margin-top: 20px">
				<table class="table" style="width: 700px; margin-left: 50px; border: solid 1px #ccc; padding-top: 40px">
						<tr>
							<td height="80px;" style="border: solid 1px #ccc; border-right-style: none;">
									<input type="text" class="form-control" value="${pdto.guserId}" name="userId" style="height: 70px" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td width="550px" height="500px" style="border: solid 1px #ccc;">
								<div class="form-group">
								</div>
								<div class="form-group">
									 <input type="text" class="form-control" placeholder="title" name="imageTitle">
								</div>
								<div class="form-group">
									<textarea class="form-control" rows="20" placeholder="contents" name="imageContents" ></textarea>
								</div>
								<div class="form-group">
									<input type='file' id="imgInp" class="form-control" name="uploadImg" onchange="readURL(this)"/>
      							    <img id="imgWindow" src="\resources\blog\image\no_detail_img.gif" width="400" height="300" />
								</div>							
							</td>
						</tr>
				</table>
				<div style="margin-left: 50px; width: 700px;">
					<button type="button" class="btn btn-default" onclick="location.href='/blog/photo/viewPhoto?blogId=${blogId}&blogName=${blogName}'">취소</button>
					<button type="submit" class="btn btn-primary" style="float: right;">작성</button>
				</div>
				</form>
		</div>
	
	

	<!-- jQuery -->
	<script src="/resources/blog/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/blog/js/bootstrap.min.js"></script>

</body>

</html>

