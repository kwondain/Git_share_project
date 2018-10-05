<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<%@ page import="java.util.*" %>
<!-- 외부 패키지 임포트 -->
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
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
 <div id="article" style="text-align: center;">
  
 <div id="article_c">
 <%
 	// setAttribute()메소드로 저장된 키 값을 가져온다.
 	// board 키에는 수정을 위한 레코드 정보가 들어있다.
 	BoardBean board = (BoardBean)request.getAttribute("bean");
 %> 
 <div id="boardwrite_wrap">
 <h2 class="boardwrite_title">게시물 수정 </h2>
 <form method="post" action="board_edit_ok.do"
       onsubmit="return board_check()"> 
 <!-- 히든타입으로 글번호와 비밀번호를 넘긴다.
         히든은 웹 상에서 안보이게 하는 역할을 한다. 값이 보이지 않게 넘길때 사용됨-->
 <input type="hidden" name="no" value="<%=board.getBoard_no()%>"/>
 <input type="hidden" name="db_pwd" value="<%=board.getBoard_pwd()%>"/>
 <table id="boardwrite_t" class="table" style="text-align: center; 
 		width: 40%; margin-left: auto; margin-right: auto;">
    <tr>
       <th> 글제목 </th>
       <td> <input type="text" name="board_title" id="board_title"
       		 class="form-control" size="14" value="<%=board.getBoard_title() %>" /></td>
    </tr>
    <tr>
       <th> 글내용 </th>
       <td> <textarea name="board_cont" id="board_cont" 
       	 cols="40" rows="10" class="form-control"><%=board.getBoard_cont() %>
              </textarea>
       </td>
    </tr>
    <tr>
       <th> 비밀번호 </th>
       <td> <input type="password" name="board_pwd" 
                 id="board_pwd" size="14" class="form-control"/> 
    </tr>    
 </table>
   <input type="submit" value="수정" class="btn"/>
   <input type="button" value="취소" 
              onclick="history.back()" class="btn"/>   
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