<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>풀캘린더</title>
<style type="text/css">
body {
	margin: 10px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 18px;
}

#calendar {
	max-width: 900px;
	margin: 0px 280px;
	overflow: hidden;
	height: auto;
}

.fc-day-number.fc-sat.fc-past {
	color: #0000FF;
} /* 토요일 */
.fc-day-number.fc-sun.fc-past {
	color: #FF0000;
} /* 일요일 */
</style>
<link href="/resources/blog/fullcalendar-3.4.0/fullcalendar.css"
	rel="stylesheet" />
<link href="/resources/blog/fullcalendar-3.4.0/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<script type="text/javascript"
	src="/resources/blog/fullcalendar-3.4.0/lib/moment.min.js"></script>
<script type="text/javascript"
	src="/resources/blog/fullcalendar-3.4.0/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/blog/fullcalendar-3.4.0/fullcalendar.js"></script>
<script type="text/javascript"
	src="/resources/blog/fullcalendar-3.4.0/locale-all.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		$.ajax({
            type: "POST",
            contentType: "application/json",
            data: "{}",
            url: "recevieData",
            dataType: "json",
            success: function(data) {
		jQuery("#calendar").fullCalendar({
			editable : false,
			eventLimit : true,
			dayClick : function(date) {
				var openWin;
				var fDate = date.format();
			    var popupOption = 'directories=no, toolbar=no, location=no, menubar=no, status=no, scrollbars=no, resizable=no, left=1230, top=130, width=440, height=600';
			    window.open("viewRegistSchedule?fDate="+fDate, "childForm", popupOption);
			},
			eventClick: function(event) { 
			    var popupOption = 'directories=no, toolbar=no, location=no, menubar=no, status=no, scrollbars=no, resizable=no, left=1230, top=130, width=440, height=600';
			    window.open("viewDetailSchedule?sid="+event.id, "childForm", popupOption);
				//event.backgroundColor = 'yellow';
				//$('#mycalendar').fullCalendar('rerenderEvents');
			},

			events : data
		});
            }
		});
	});
</script>
<script type="text/javascript">
	function closeWindow() {
		window.close();
	}
</script>
<body>
	<div id=wrapper class="toggled">
		<%@ include file="../includeSub.jspf"%>
	</div>
	<div id="calendar">
		<h4>일정을 추가하고 싶다면 <strong>날짜</strong>를 클릭</h4>
		<h4>상세 일정을 보고 싶거나 일정을 수정,삭제 하고 싶다면 <strong>일정</strong>을 클릭</h4>
<!--  		<button class="btn btn-success" onclick="reLoad()" style="float: right; margin-top: 20px; height: 30px;">전달</button>
		<button class="btn btn-danger" onclick="" style="float: right; margin-top: 20px; height: 30px;">일정 삭제</button> -->
	</div>

</body>
</html>