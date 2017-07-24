<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>회원가입 저장한 내용 수정</title>

<!-- [TEST] CSS (나중에 resource에서 스타일시트  따로 관리 할 예정) -->
<style type="text/css">
   .navbar-inverse {
       background-color: #2bb7d5;
       border-color: #00a3cc;
   }
   
   .navbar {
       margin: 0;
       border: none;
       border-bottom: 2px solid #95daea;
       border-radius: 0;
   }
   
   .navbar .navbar-brand{
       color: #fff;
       font-size: 28px;
       font-weight: bold;
   }   
   
   .navbar-inverse .navbar-nav > li > a {
       color: white;
   }   
   
   .h4 {
         font-size: 18px;
         margin-top: 10px;
         margin-bottom: 10px;
         color: inherit;
   }
      
   .li {
        font-color: black;
   }
   
</style>
<!-- JavaScript -->
<!-- 왼쪽 메뉴바 클릭시, 해당 페이지 보이게하기 -->
<script>
   $('.nav-pills').scrollingTabs(); 
</script>

<script>
	 $(document).ready(function(){
	    var link = document.location.href;//현재접속url
	    var tab = link.split('/').pop(); // 배열의 맨 마지막 요소를 삭제하고 삭제된 해당 값을 반환함
	    $('a[href$='+tab+']').trigger("click");//해당 앵커트리거를 이용 클릭 이벤트
	 });
</script>



<!-- [Header] 공통 헤더 -->
<%@include file = "../header.jsp"%>
</head>
<body>
          
   <!-- [Content] 1단계 > 개인 회원가입 폼 내용부분 -->
   <div class="container">
      <!-- 타이틀 -->
      <div class="page-header clearfix">
         <h1>마이페이지</h1>      
      </div>
         <!-- <div class="col-8 col-md-offset-2"> -->
         <div id="changeMyInfo" class="tab-pane fade active in">
         
            <!-- 참고 사이트: https://www.w3schools.com/bootstrap/bootstrap_panels.asp -->
            <!-- panel: 콘텐츠가 있는 박스 형태의 구성요소를 만들 때 사용 -->
            <div id="myPageSetting" class="row">
      
         <!--/// [왼쪽/리스트 목록]: 12칸 중 "3칸" 크기 확보 ///-->
         <div class="col-md-3">         
            <!-- 메뉴 리스트 -->
            <ul class="nav nav-pills nav-stacked" role="tablist">
               <!-- active: selected 의미 (미리 선택되어 있음) -->
               <!-- data-toggle="tab": 탭 활성화 -->
               <!-- 1. 회원정보관리 -->
               <li id="link_myInfoModify" class="active"><a href="/mypage/CreateMeeting">회원정보관리</a></li>
               <!-- 2. 내가 개설한 모임 -->
               <li id="link_myCreateMeeting"><a href="/mypage/CreateMeeting">내가 개설한 모임</a></li>
               <!-- 3. 내가 참여중인 모임 -->
               <li id="link_myEnterMeeting"><a href="/mypage/Participation">내가 참여중인 모임</a></li>
               <!-- 4. 내가 찜한 모임 -->
               <li id="link_myGoodMeeting"><a href="/mypage/Good">내가 찜한 모임</a></li>
               <!-- 5. 내가 올린 자료 -->
               <li id="link_myUploadFile"><a href="/mypage/UploadFile">내가 올린 자료</a></li>
            </ul>            
         </div>
      
         <div class="col-md-9">                     
            <!-- 각 탭에 해당되는 내용 -->   
            <div class="tab-content">   
            <div class="panel panel-default"> 
               <!--/// 제목 ///-->
               <div class="panel-heading">
                  <h4><strong>회원정보수정 : 1단계</strong></h4>               
               </div>
               <!--/// 내용 ///-->
               <div class="panel-body">
                  <!-- 도움말 -->
                  <p class="help-block">
                     &nbsp;<small>* 회원님의 인적사항을 수정 및 확인하실 수 있습니다.</small>   
                  </p>
                  <br>
                  

                  <!-- [1] 개인정보 수정할 수 있는 폼 -->
                  <form action="/mypage/PersonSecondModify" class="form-horizontal" method="post">               
                     <!-- 아이디(비활성화) -->
                     <div class="form-group">
                        <!-- 입력항목이름 -->
                        <label for="Id" class="col-md-2 control-label">아이디</label>
               
                        <div class="col-md-10">
                           <!-- 입력칸크기 -->
                           <input type="text" class="form-control" name="guserId" value="${pdto.guserId}" required disabled>
                        </div>
                     </div>
                                          
                     <!-- 이름 -->
                     <div class="form-group">
                        <label for="Name" class="col-md-2 control-label">이름</label>
                        <div class="col-md-10">
                           <input type="text" class="form-control" name="guserName" value="${pdto.guserName}" required>
                        </div>
                     </div>
                     
                     <!-- 이메일 -->
                     <div class="form-group">
                        <label for="Email" class="col-md-2 control-label">이메일</label>
                        <div class="col-md-10">
                           <input type="email" class="form-control" name="guserEmail" value="${pdto.guserEmail}" required>
                        </div>
                     </div>
                     
                     <!-- 전화번호 -->
                     <div class="form-group">
                        <label for="Phone" class="col-md-2 control-label">휴대폰 번호</label>
                        <div class="col-md-10">
                           <input type="text" class="form-control" name="guserPhone" value="${pdto.guserPhone}" required>
                        </div>
                     </div>
                     
                     <!-- 성별 (라디오 버튼) -->
                     <div class="form-group">
                        <label for="Gender" class="col-md-2 control-label">성별</label>
                        <div class="col-md-10">
                            <c:choose>
                              <c:when test="${pdto.guserGender eq 'W'}">
                                 <div class="radio">
                                    <label><input type="radio" name="guserGender" value="W" checked>여 </label>
                                    &nbsp;&nbsp;<label><input type="radio" name="guserGender" value="M"> 남 </label>                        
                                 </div>
                              </c:when>
                              <c:otherwise>
                                 <div class="radio">
                                    <label><input type="radio" name="guserGender" value="W">여 </label>
                                    &nbsp;&nbsp;<label><input type="radio" name="guserGender" value="M" checked> 남 </label>                        
                                 </div>
                                 </c:otherwise>
                           </c:choose> 
                        </div>
                     </div>                    
      
                     <!-- hidden -->
                     <input type="hidden" name="guserId" value="${pdto.guserId}">
                     <input type="hidden" name="guserPw" value="${pdto.guserPw}">
                     <input type="hidden" name="guserCode" value="${pdto.guserCode}">
      
                     <!-- 1단계 확인 버튼 -->
                     <div class="clear-fix">
                        <div class="pull-right">
                           <button type="submit" class="btn btn-primary">수정완료</button>
                        </div>
                     </div>
                  </form>
                  
               </div>               
            </div>
         </div>      
         </div>
      </div>
      </div>
   
      
   <!-- [Footer] 페이지 하단 (고정화면) -->
   <hr>
   <%@include file = "../footer.jsp"%>

   </div>   
   
</body>
</html>