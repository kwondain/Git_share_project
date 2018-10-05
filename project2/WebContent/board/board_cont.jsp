<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<%@ page import="java.util.*" %>
<!-- 외부 패키지 임포트 -->
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
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
		<hr>
	</div>
<div id="article" style="text-align: center;">
 <div id="article_c">
 <%
 	// getAttribute()메소드로 board 키 값을 받는다.
 	// 리턴 타입이 Object 형이기 때문에 BoardBean 타입으로 다운캐스팅한다.
 	BoardBean board = (BoardBean)request.getAttribute("bean");
 %>
 <h2 class="boardcont_title"><%=board.getBoard_title() %></h2>
 <table id="boardcont_t" class="table" style="text-align: center; 
 		width: 40%; margin-left: auto; margin-right: auto;">
    <tr >
       <th width="10%"style="text-align: center;"> 작성자 </th>
       <td width="10%"style="text-align: center;"> <%=board.getBoard_name() %></td>
       <th width="20%"style="text-align: center;">날짜</th>
    <td width="30%"style="text-align: center;"><%=board.getBoard_regdate() %></td>
    <th width="10%"style="text-align: center;"> 조회수 </th>
       <td width="10%"style="text-align: center;"> <%=board.getBoard_hit()%></td>
    </tr>
    <tr style="height: 30%">
       <td colspan="6"> <%=board.getBoard_cont() %> 
    </tr>    
 </table>
	<div id="boardcont_menu">
		<input type="button" value="수정" class="btn" 
			onclick="location='board_edit.do?no=<%=board.getBoard_no()%>'" />
		<input type="button" value="삭제" class="btn" 
			onclick="location='board_del.do?no=<%=board.getBoard_no()%>'" />
		<input type="button" value="목록" class="btn"
			onclick="location='board_list.do'"/>
	</div> 
 </div>
</div>
</body>
  <footer style=" position:absolute;bottom:0;width:100%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>

