<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<!-- header 영역 추가 -->
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
<div id="article">
    <div id="article_c" style="text-align: center;">
     <!-- 여기서 부터 본문의 내용 -->
     <%
       // 컨트롤러에서 넘긴 키값을 받는다.
       BoardBean bean = 
           (BoardBean)request.getAttribute("bean");
     %>
     <script>
       function del_check(){
    	  // del_pwd 값이 공백인 경우
    	  if($.trim($("#del_pwd").val())==""){
    		  alert('삭제 비번을 입력하세요');
    		  $("#del_pwd").val("").focus(); // 커서이동
    		  return false;
    	  }   
       }
     </script>
     <h2 class="boardDel_title"style="margin-top: 30px">게시글 삭제</h2>
     <form method="post" action="board_del_ok.do">
     <!-- 게시물 번호와 DB 비번을 히든으로 넘김 -->
      <input type="hidden" name="no"
             value="<%=bean.getBoard_no() %>"/>
      <input type="hidden" name="db_pwd"
             value="<%=bean.getBoard_pwd() %>"/>
      <table id="table" style=" margin-left: auto; margin-right: auto;margin-top: 5%;margin-bottom: 5%;" >
         <tr> 
            <th>비밀번호를 입력해주세요</th>
            <td> <input type="password" name="del_pwd"
              id="del_pwd" size="14" class="form-control"/>
            </td>  
         </tr>
      </table>
      <div id="boardDel_menu">
       <input type="submit" value="삭제" id="input_b" class="btn"/>
       <input type="button" value="취소" id="input_b"
              onclick="history.back()" class="btn"/>
      </div>    
     </form>
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




