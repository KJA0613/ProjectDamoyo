<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>마이페이지</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
	.table {
		margin-left: 10px;
		text-align: center;
	}
	
	th {
		text-align: center;
	}
	
	.pagination {
		display: block;
		text-align: center;
	}
	
	.pagination > li > a{
		float: none;
	}
</style>

<!-- JavaScript -->
<script>
	function meeting_delete() {
		alert('해당 모임을 삭제하시겠습니까?');
		
		// 확인 버튼 클릭 > 해당 자료 삭제 코드 작성하기
	}
</script>


<!-- [Header] 공통 헤더 -->
<%@include file = "../header.jsp"%>
</head>
<body>
	
	 <div class="container">
      <!-- 타이틀 -->
      <div class="page-header clearfix">
         <h1>마이페이지</h1>      
      </div>
      
      <div id="myPageSetting" class="row">
	         <!--/// [왼쪽/리스트 목록]: 12칸 중 "3칸" 크기 확보 ///-->
	         <div class="col-md-3">         
	         	<%@include file = "MyPageSidebar.jsp"%>
	         </div>
        
        	 <!--/// [오른쪽/해당되는 내용]: 12칸 중 "9칸" 크기 확보 ///-->
			 <div class="col-md-9">
				  <div class="tab-content">	 
					<!-- 검색 -->
				    <div class="col-md-4 col-md-offset-8">
						<form action="#" method="POST" class="search-form">
							<div class="form-group has-feedback">
				           		<label for="search" class="sr-only">search</label>
				           		<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력해주세요.">
				             		<!-- 돋보기 모양 -->
				            	<span class="glyphicon glyphicon-search form-control-feedback"></span>
				           	</div>
						</form>
					</div>
					<!-- 내용 -->
								
					<!-- 
						순번
						모임명
						작성자
						참여인원 현황
						등록일
						조회수
						삭제
					-->
					
					<!-- 삭제 체크 클릭시 JS -->
					<!-- <input type="checkbox" name="chk_delete" value="delete" onclick="meeting_delete()"> -->
	
				</div>
		
				<!-- 페이징하기 (프리뷰, 넥스트 적용시키기) -->
				<!-- 프리뷰, 넥스트 > 참고 할 사이트
					 : https://www.w3schools.com/bootstrap/bootstrap_pager.asp
					 : http://getbootstrap.com/components/#pagination -->
				<!-- <ul class="pagination">
				    <li><a href="#">1</a></li>
			  	</ul> -->
			</div>
		</div>
	
	<!-- [Footer] 페이지 하단 (고정화면) -->
	<hr>
	<%@include file = "../footer.jsp"%>
	</div>		
	
</body>
</html>