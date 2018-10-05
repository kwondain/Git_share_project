<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_del.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" 
            href="./css/member.css">
<script src="./js/jquery-3.js"></script>
<script>
   function check(){ // 회원탈퇴 data 검증
	   if($.trim($("#pwd").val())==""){
		   alert('비밀번호를 입력하세요!');
		   $("#pwd").val("").focus(); // 커서 이동
		   return false; // false값 리턴
	   }
   }
</script>
<link href="css/bootstrap.css " rel="stylesheet" type="text/css">
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
  <div id="del_wrap" style="text-align: center;width: 25%;margin-left: auto;margin-right: auto;">
    <h2 class="del_title">회원탈퇴</h2>
    <form method="post" action="member_del_ok.do"
          onsubmit="return check()">
     <table id="del_t" class="table">
        <tr> 
           <th> 아이디 </th>
           <td> ${id} </td>
           <!-- 컨트롤러에서 넘긴 키값 EL로 출력-->
        </tr>
        <tr> 
           <th> 회원이름 </th>
           <td> ${name} </td>
           <!-- 컨트롤러에서 넘긴 키값 EL로 출력-->
        </tr>
        <tr> 
           <th> 비밀번호 </th>
           <td> 
            <input type="password" name="pwd" id="pwd" class="form-control"/>
           </td>           
        </tr>
     </table>
     <div id="del_menu">
       <input type="submit" value="탈퇴" class="btn"/>
       <input type="reset" value="취소" class="btn"/>
     </div>     
    </form>
  </div>
</body>
</html>

