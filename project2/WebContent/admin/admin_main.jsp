<%@ page contentType="text/html; charset=UTF-8"%>
    <!-- html  주석문기호. 위 부분은 jsp(java server pages) 에서
    지시자라고 한다. 즉   jsp 정의문 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 관리자 메인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/agongji.css" />
<script src="./js/jquery.js"></script>
<script src="./js/admin.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body> 
<div id=wrapper>
		<header>
		<div class="title">
			<a href="./main.jsp"><img src="images/lovingpet.png"></a>
		</div>
		<div class="loginmenu">
 			<jsp:include page="/member/member_login.jsp" />
<!-- 			<br><br>
			<a href="./member_Login.do"><input type="button" value="로그인"></a> -->
		</div>

		<nav class="mainmenu">
		<ul>
			<li><a href="#">펫시터 지원하기</a>
				<ul>
					<li><a href="./leavepet.do">펫시터란</a></li>
					<li><a href="./leavejoin.do">펫시터 지원하기</a></li>
				</ul></li>
			<li><a href="./leavelist_Action.do">펫 맡기기</a></li>
			<li><a href="#">공지사항&#38;게시판</a>
				<ul>
					<li><a href="gongji_list.do">공지사항</a></li>
					<li><a href="./board_list.do">자유게시판</a></li>
				</ul></li>
			<li><a href="#">내 페이지</a>
				<ul>
					<li><a href="member_edit.do">회원정보 수정</a></li>
					<li><a href="#">내가 찜한 펫시터 리스트</a></li>
				</ul></li>
		</ul>
		</nav>
<%
	if(session.getAttribute("admin_id")==null)
		response.sendRedirect("../main.jsp");
%>
<div id="site">  
  <h3 align="center">관리자 페이지 영역 </h3>   
</div>
  <!-- 상단 header -->
  <div id="header">
    
    <div id="top_menu">
     <ul class="list-unstyled" style="text-align: center;">
      <li class="btn"><a href="admin_gongji_list.do" onfocus="this.blur()"><font color="green">공지사항</font></a></li><p>
      <li class="btn"><a href="admin_member_list.do" onfocus="this.blur()"><font color="green">회원관리</font></a></li><p>
      <li class="btn"><a href="admin_reservationAction.do" onfocus="this.blur()"><font color="green">예약 리스트</font></a></li><p>
     </ul>
    </div>
    
    <div id="top_login">
     <ul class="list-unstyled" style="text-align: center;">
      <li class="btn"><a href="./admin_logout_ok.do" onfocus="this.blur()">
      <font color="green">로그아웃</font></a></li>
      
     </ul>
    </div>
  </div>
  </body>
  <footer style=" position:absolute;bottom:0;width:105%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>