<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
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
	MemberBean mb = (MemberBean)request.getAttribute("m");
%>
 <div id="article" style="text-align: center;">
  <div id="article_c">
  <!-- 본문 내용 --> 
   <div id="aMain_cont">
     <div id="meminfo_wrap">
       <h2 class="meminfo_title">회원정보</h2>
       <table id="meminfo_t"class="table table-hover"style="width: 60%;margin-left: auto;margin-right: auto;">
        <tr>
         <th>아이디</th> <td><%= mb.getMember_id() %></td>
        </tr>
        <tr>
         <th>비밀번호</th> <td><%= mb.getMember_pass() %></td>
        </tr>
        <tr>
         <th>회원이름</th> <td><%= mb.getMember_name() %></td>
        </tr>
        <tr>
         <th>닉네임</th> <td><%= mb.getMember_nickname() %></td>
        </tr>
        <tr>
         <th>성별</th> <td><%= mb.getMember_gender() %></td>
        </tr>
        <tr>
         <th>이메일</th> <td><%= mb.getMember_email() %></td>
        </tr>
        <tr>
         <th>집주소</th>
         <td>
          <%= mb.getMember_zip() %><br/>
          <%= mb.getMember_addr1() %>&nbsp; <%= mb.getMember_addr2() %>
         </td>
        </tr>

       </table>
       <div id="meminfo_menu">
        <input type="button" value="회원목록" class="btn"
        onclick="location='admin_member_list.do?page=${page}'" />        
       </div>
     </div>
   </div>
  </div>
  </div>
</body>
<footer style=" bottom:0;width:105%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>