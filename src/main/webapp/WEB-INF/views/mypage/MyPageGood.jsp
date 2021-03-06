<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery CDN -->	
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

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
	function btn_attend(writer, no) {
		var res = confirm('해당 스크랩을 취소하시겠습니까?');
						
		if(res===true){ // 확인 == 삭제
			var writer = $('#writer').text();
			var no = $('#no').text();
			
			location.href="/mypage/attendDelete?writer="+writer+"&no="+no+"&code=관심";
		}else{ // 취소 == 그냥
			location.href="/mypage/MyPageGood";
		}
		
		/* 거만하게 ajax로 할려다가 아니다 싶어서 바꿈 
		// 확인 버튼 클릭 > 리스트 목록에서 삭제 
		var DATA = {
				"no" : no,
				"writer" : writer,
				"state" : 'delete',
				"code" : '관심'
			};
			
			// 여기서 클릭했을 때 recommend를 해주는 컨트롤러로 이동해야함
			// 클릭한글을 디비에 저장하여 추천 값을 받음 , 아이디와, no, 코드(관심글 -- 이건 메서드안에서 하기) 보냄
			
			// + 여기다 추가로 관심글 받아오는 것도 함, 그럴려면 값을 받아올때 디비에 관심글이 있는지 없는지 확인하여 그에대한 값을 해야함
			
			var modal = $(this);
			
			$.ajax({
				url : '/gather/gatherAddons',
				dataType : 'json',
				type : 'POST',
				cache : false,
				data : DATA,
				success : function(data) {
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
				}
		 	});
		 */
	}	
</script>

<!-- 왼쪽 메뉴바 클릭시, 해당 페이지 보이게하기 -->
<script>
   $('.nav-pills').scrollingTabs(); 
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
					       <!--  <th>조회수</th> -->
					        <th>스크랩</th>			        
					      </tr>
					    </thead>
					    
						<tbody>
							<!-- <tr>
						        <td>1</td>
						        모임명 클릭 > 해당 모임 블로그로 이동
						        <td><a href='#'>자바 모임</a></td>
						        <td>가나다</td>
						        <td>3/4</td>
						        <td>2017-06-20</td>
						        <td>20</td>
						        <td><span class="glyphicon glyphicon-heart" onclick="btn_heart()"></span></td>
							</tr> -->
								
							<c:forEach var="attend" items="${attendList}">
								<tr>
							        <td id="no">${attend.gatherNo}</td>
							        <!-- 모임명 클릭 > 해당 모임 블로그로 이동 -->
							        <td><a href="/gather/gathering?subject=${attend.gatherSubject}&no=${attend.gatherNo}">${attend.gatherSubject}</a></td>
							        <td id="writer">${attend.guserId}</td>
							        <td>${attend.gatherParti} / ${attend.gatherPartiMax}</td>
							        <td>${fn:substring(attend.gatherEdate, 0, 10)}</td>
							        <td><span class="glyphicon glyphicon-heart" onclick="btn_attend()"></span></td>
							        <%-- <td><span class="glyphicon glyphicon-heart" onclick="btn_attend('${attend.guserId}','${attend.gatherNo}')"></span></td> --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>	
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