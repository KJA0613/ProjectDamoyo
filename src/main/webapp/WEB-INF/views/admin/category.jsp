<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="apple-touch-icon" sizes="76x76" href="/resources/admin/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="/resources/admin/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Material Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="/resources/admin/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="/resources/admin/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/admin/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
  
<script type="text/javascript">

var catMidOne0 = new Array("-선택-",""); 
var catMidOne1 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidOne2 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");
var catMidOne3 = new Array("외국어","영어","음악/공연","라이프","취업","게임","스포츠","뷰티/미용","컴퓨터","국가고시/공무원","디자인/미술");


/* <!-- 카테고리 그룹 1차 소분류 선택 배열 --> */
var catBotOne0 = new Array("중국어","일본어","독일어","아랍어","태국어","스페인어","러시아어","프랑스어","베트남어","외국어 기타");
var catBotOne1 = new Array("토익","토플","텝스","토스","영어회화","작문/독해","번역","미드","영어 기타");
var catBotOne2 = new Array("기타/우쿠렐라","피아노/키보드","보컬/음악이론","작사/작곡","밴드","국악","연기/연극/뮤지컬","댄스무용","진행/행사","마술/음악공연 기타");
var catBotOne3 = new Array("육아","반려동물","금융/재테크","상담/컨설팅","건강/웰빙","사주/타로","독서/글쓰기","사진/영상","키덜트","생활공예","요리/베이킹","인테리어");
var catBotOne4 = new Array("자소서/면접","인적성","스피치","자격증","기업공채","공모전/대외활동","창업/스타트업","취업 기타");
var catBotOne5 = new Array("리그오브레전드","도타","피파온라인","오버워치","서든어택","온라인게임","PC게임","모바일게임","보드게임","게임 기타");
var catBotOne6 = new Array("축구","야구","농구","테니스","배드민턴","골프","등산","수영","자전거","스케이트/보드","요가/에어로빅","헬스/다이어트","무예/무술","시즌스포츠","스포츠 기타");
var catBotOne7 = new Array("헤어","네일아트","피부관리","메이크업","반영구 메이크업","스타일/코디","뷰티/미용 기타");
var catBotOne8 = new Array("알고리즘","응용프로그래밍","웹프로그래밍","모바일프로그래밍","데이터베이스/서버","게임프로그래밍","문서작성/편집","컴퓨터자격증","사물인터넷","하드웨어","컴퓨터 기타");
var catBotOne9 = new Array("행정","교육","경찰","소방","의료/보건","사법","기술","회계","국방","공무원 기타");
var catBotOne10 = new Array("웹/모바일 디자인","일러스트/삽화","광고/영상","만화/웹툰","편집디자인","패션디자인","3D/VFX","도예/세라믹","캘러리그라피","회화","디자인/미술 기타");

   
/*카테고리 그룹 선택 1-1  */
function catChangeOne(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.catMidOne;
    

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catMidOne' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catMidOne' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    
    temp.options[0].selected=true;
    return true;
}

/*카테고리 그룹 선택 1-2  */
function catMidChangeOne(item){
    var temp, i=0, j=0;
    var ccount, cselect;

  
    temp = document.signform.catBotOne;

    for (i=(temp.options.length-1) ; i>0 ; i--){
       temp.options[i] = null; 
    }
    eval('ccount = catBotOne' + item + '.length');
   
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = catBotOne' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
        
    temp.options[0].selected=true;
    return true;
}


</script>
   </head>

<body>

	<div class="wrapper">
	    
	    <%@ include file="./admin_sidebar.jspf"%>

	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">DAMOYO 관리자 페이지</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="hidden-lg hidden-md">Notifications</p>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Mike John responded to your email</a></li>
									<li><a href="#">You have 5 new tasks</a></li>
									<li><a href="#">You're now friend with Andrew</a></li>
									<li><a href="#">Another Notification</a></li>
									<li><a href="#">Another One</a></li>
								</ul>
							</li>
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
	 							   <i class="material-icons">person</i>
	 							   <p class="hidden-lg hidden-md">Profile</p>
	 						   </a>
							</li>
						</ul>

						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
	                        	<input type="text" class="form-control" placeholder="Search">
	                        	<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i><div class="ripple-container"></div>
							</button>
	                    </form>
					</div>
				</div>
			</nav>
			
	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">카테고리 수정</h4>
	                                <p class="category">지역,관심사 카테고리 수정</p>
	                            </div>
	                            <h4><strong>희망 카테고리</strong></h4>										
			         <!-- 카테고리 선택 -->
			         <form action="" method="post" name="signform" id="per">
			         <div id=list2>
			            <div class="dropdown">
			               <!-- 카테고리 그룹 선택 3-1 -->
			               <table cellpadding=1>
			                  <tr>
			                     <td>1차</td>
			                     <td>2차</td>
			                     <td>3차</td>
			                  </tr>
			                  <tr>
			                     <!--1차카테고리선택  -->
			                     <td><select name="catTopOne" class="form-control" onChange="catChangeOne(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=1>스터디(취업/시험 대비)</option>
			                           <option value=2>동호회(취미)</option>
			                           <option value=3>컨퍼런스</option>
			
			                     </select></td>
			                     <!--2차카테고리선택  -->
			                     <td><select name="catMidOne" size=1 class="form-control" onChange="catMidChangeOne(this.options.selectedIndex)">
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                     <!--3차카테고리선택  -->
			                     <td><select name="catBotOne" class="form-control" size=1>
			                           <option selected value="">-선택-</option>
			                           <option value=""></option>
			                     </select></td>
			                  </tr>
			               </table>
			               </div>
			               </div>
			               </form>
	                    	</div>
	                	</div>
	            	</div>
	        	</div>
	    	</div>

			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li>
								<a href="#">
									Home
								</a>
							</li>
							<li>
								<a href="#">
									Company
								</a>
							</li>
							<li>
								<a href="#">
									Portfolio
								</a>
							</li>
							<li>
								<a href="#">
								   Blog
								</a>
							</li>
						</ul>
					</nav>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
					</p>
				</div>
			</footer>
		</div>
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="/resources/admin/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="/resources/admin/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/resources/admin/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="/resources/admin/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="/resources/admin/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="/resources/admin/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="/resources/admin/js/demo.js"></script>

</html>
