<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<!-- dao 패키지의 모든 클래스를 사용하기 위해서 임포트 시킴 -->
<%@ page import="java.util.*" %>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->
<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->
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
<div id="boardwrite_wrap">
<h2 class="boardwrite_title">게시물 글쓰기</h2>
<form method="post" action="board_write_ok.do"
      onsubmit="return board_check()">
 <table id="boardwrite_t" class="table" style="text-align: center; 
 		width: 40%; margin-left: auto; margin-right: auto;">
    <tr>
      <th> 글쓴이 </th>
      <td>
        <input name="board_name" id="board_name" 
        class="form-control" size="14"/></td>
    </tr>   
    <tr>
      <th> 제목 </th>
      <td>
        <input name="board_title" id="board_title"
        class="form-control" size="30"/></td>
    </tr>
    <tr>
      <th> 글내용 </th>
      <td> <textarea name="board_cont" id="board_cont"
           rows="8" cols="40" class="form-control"style="height: 30%"></textarea> </td>
       <!-- textarea 태그는 2줄 이상의 문단을 입력할 수 있는 텍스트 필드 양식 -->
    </tr>
    <tr>
      <th> 비밀번호</th>
      <td> <input type="password" name="board_pwd" 
           id="board_pwd" class="form-control" size="14"/> 
      </td>
    </tr>
 </table>
   <input type="submit" value="입력" class="btn"/>
   <input type="reset" value="취소" 
              onclick="history.back()" class="btn"/>
   <!--  입력 내용을 초기화 하면서 글쓴이 입력창으로 포커스를 이동시킨다. -->
</form>
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