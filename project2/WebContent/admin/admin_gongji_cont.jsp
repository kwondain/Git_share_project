<%@page import="com.gongji.model.GongjiBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 목록</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
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
	GongjiBean m = (GongjiBean)request.getAttribute("g");
%>

 <div id="article">
  
  <div id="article_c">
 <!-- 본문 내용 -->
 <div id="aGongji_cont" style="text-align: center;">
  <h2 class="aGongji_title">관리자 공지 내용</h2>
  <table id="aGongji_t" class="table" style="text-align: center; 
 		width: 40%; margin-left: auto; margin-right: auto;">
       <tr>
        <th colspan="2" style=" text-align: center;"> <%= m.getGongji_title() %></th>
       </tr>
       
       <tr>
        <td colspan="2">
         <%= m.getGongji_cont() %>
        </td>
       </tr>  
       
      </table>
      <div id="aGcont_menu" style="text-align: center;">
       <input type="button" value="목록" class="btn"
       onclick="location='admin_gongji_list.do?page=${page}'" />
      </div>
    </div>
   </div>
 </div>
</body>
<footer style=" position:absolute;bottom:0;width:100%;width:105%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>