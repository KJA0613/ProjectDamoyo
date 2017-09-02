<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공통 푸터</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- top > 헤더 위치로 이동 -->
<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>
<style type="text/css">
	.material-icons{	
		/* font-Size: 35px; */
		/* background-color: #03a9f4; */	
		font-weight:bold;
		color: #03a9f4;
	}
	.bottom1 {
		margin-bottom: 20px;
		bold: 20px;
	}
</style>
</head>
<body>
	<footer>
		<address>
			<div class="form-group">
				<br><br><br>
				<div class="footer pull-left">DAMOYO</div>
				<!-- <div class="footer-right">ⓒ2017/09/01 DAMOYO </div> -->
				<div class="footer-right top pull-right"><a onclick="fnMove('2')"><i class="material-icons">arrow_upward</i>top</a></div>
			</div>
		</address>
	</footer>	
    <br><br>
</body>
</html>