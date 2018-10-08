<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 작성</title>
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
<div id="article" style="text-align: center;">
  
  <div id="article_c">
   <!-- 본문 내용 -->
   <div id="aMain_cont">
    <div id="aGongji_write">
     <h2 class="aGongjiw_title">관리자 공지사항</h2>
     <form method="post" action="admin_gongji_write_ok.do"
     onsubmit="return aGongji_write();">
       <table id="aGongjiw_t" class="table" style="text-align: center; 
 		width: 40%; margin-left: auto; margin-right: auto;">
        <tr>
         <th>작성자</th>
         <td>
          <input name="gongji_name" id="gongji_name" 
          size="14" class="form-control" />
         </td>
        </tr>
        
        <tr>
         <th>공지제목</th>
         <td>
          <input name="gongji_title" id="gongji_title" size="40"
          class="form-control" />
         </td>
        </tr>
        
        <tr>
         <th>공지내용</th>
         <td>
          <textarea name="gongji_cont" id="gongji_cont" rows="5" class="form-control"
          cols="40"></textarea>
         </td>        
        </tr>
        
        <tr>
         <th>비밀번호</th>
         <td>
         <input type="password" name="gongji_pwd" id="gongji_pwd"
         size="14" class="form-control" />
         </td>
        </tr>
       </table>
       
       <div id="aGongjiw_menu">
        <input type="submit" value="저장" class="btn" />
        <input type="reset" value="취소" class="btn"
        onclick="$('#gongji_name').focus();" />
       </div>
     </form>  
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