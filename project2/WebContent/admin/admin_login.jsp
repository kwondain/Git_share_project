<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- admin_login.jsp -->
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
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
<div id="article"  style="text-align: center;">
  <div id="article_c">
    <!-- 관리자 로그인 입력화면 구성 영역-->
    <div id="aIndex_wrap">
       <h2 class="aIndex_title">관리자 로그인</h2>
       <form method="post" action="admin_login_ok.do"
             onsubmit="return adminLogin_check()">
        <table id="aIndex_t" class="table" style="width: 30%;margin-left: auto; margin-right: auto;">
          <tr> 
             <th>관리자 아이디</th>
             <td><input name="admin_id" id="admin_id"
                  class="admin_box"/>
             </td>     
          </tr>
          <tr> 
             <th>관리자 비밀번호</th>
             <td><input type="password" name="admin_pwd"
                  id="admin_pwd"
                  class="admin_box"/>
             </td>     
          </tr>        
        </table>
        <div id="aIndex_menu">
          <input type="submit" value="로그인" 
                 class="btn"/>
          <input type="reset" value="취소" 
                 class="btn"/>
        </div>
       </form>
    </div>
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