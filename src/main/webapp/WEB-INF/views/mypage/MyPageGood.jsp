<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>내가 찜한 모임 페이지</title>

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

	.glyphicon-heart {
		color: blue;
	}
</style>

<!-- JavaScript -->
<script type="text/javascript">
	function btn_heart() {
		alert('해당 스크랩을 취소하시겠습니까?');
		
		// 확인 버튼 클릭 > 리스트 목록에서 삭제 
		
	}	
</script>


</head>
<body>
	
	<!-- 2. [Content] 내용 가져오기 -->
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
	
				
			<!-- [오른쪽/리스트에 해당되는 내용]: 12칸 중 "9칸" 크기 확보 -->
			<!-- 테이블 마우스 갖다대면 활성화 표시됨 -->
			<table class="table table-hover">
				<!-- 리스트 > 타이틀 -->
				
				<!-- 테이블 값 > 가져와서 뿌리기 -->
				<!--  -->
			    <thead>
			      <tr>
			        <th>순번</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>참여인원 현황</th>
			        <th>모집마감일</th>
			        <th>조회수</th>
			        <th>스크랩</th>			        
			      </tr>
			    </thead>
			    
				<tbody>
					<tr>
				        <td>1</td>
				        <!-- 모임명 클릭 > 해당 모임 블로그로 이동 -->
				        <td>자바 모임</td>
				        <td>가나다</td>
				        <td>3/4</td>
				        <td>2017/06/20</td>
				        <td>20</td>
				        <td><span class="glyphicon glyphicon-heart" onclick="btn_heart()"></span></td>
					</tr>
					<tr>
				        <td>2</td>
				        <!-- 모임명 클릭 > 해당 모임 블로그로 이동 -->
				        <td>스프링 모임</td>
				        <td>라마바</td>
				        <td>3/4</td>
				        <td>2017/06/20</td>
				        <td>20</td>
				        <td><span class="glyphicon glyphicon-heart" onclick="btn_heart()"></span></td>
					</tr>
				</tbody>
			</table>	
		</div>

		
		<!-- 페이징하기 (프리뷰, 넥스트 적용시키기) -->
		<!-- 프리뷰, 넥스트 > 참고 할 사이트
			 : https://www.w3schools.com/bootstrap/bootstrap_pager.asp
			 : http://getbootstrap.com/components/#pagination -->
		<ul class="pagination">
		    <li><a href="#">1</a></li>
	  	</ul>
			
	
</body>
</html>