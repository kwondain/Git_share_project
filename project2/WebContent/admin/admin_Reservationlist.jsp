<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
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
		
	<div id="article_c">
		 <h2 class="Glist_title" style="text-align:center;">예약 목록</h2>
		<div id="Gongji_list">
		<table id="Glist_t"
		style="text-align: center; width: 60%; margin-left: auto; margin-right: auto; border:1px solid #ccc;">
			<tr>
				<th> 요청한 ID </th>
				<th> 요청 받은 펫시터 ID </th>
				<th> 맡기는 Pet 숫자 </th>
				<th> 맡기는 날짜 </th>
				<th> 돌봄 끝나는 날짜 </th>
				<th> 주문한 시각 </th>
			</tr>
			<c:forEach var="list" items="${list}">
			<tr align="center" valign="middle">
				<td> ${list.id} </td>
				<td> ${list.leave_id} </td>
				<td> ${list.pet_number} </td>
				<td> ${list.startDate}</td>
				<td> ${list.endDate}</td>
				<td> ${list.regDate}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>