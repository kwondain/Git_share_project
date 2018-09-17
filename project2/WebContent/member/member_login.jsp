<%@page import="com.member.model.MemberDAO"%>
<%@page import="com.member.model.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
<script src="./js/jquery-3.js"></script>
<script>
    function check(){  // 아이디와 비번 체크 함수
    	if($.trim($("#id").val())==""){
    		alert("로그인 아이디를 입력하세요!");
    		$("#id").val("").focus();
    		return false;
    	}
    	if($.trim($("#pass").val())==""){
    		alert("로그인 비밀번호를 입력하세요!");
    		$("#pass").val("").focus();
    		return false;
    	}
    }    
    /* 비번 찾기 */
    function pwd_find(){
    	window.open("pwd_Find.do", "비번찾기");
    	// 자바스크립트에서 window.open("공지창경로/파일명","창이름", "크기속성")
    	// 메소드는 공지창을 만든다.
    }    
</script>
</head>
<%
	String path = request.getContextPath();
	request.setAttribute("path",path);
	//로그인 여부에 따라 처리
 	if(session.getAttribute("id")==null){//로그인 하지 않았을 경우
%>
  <div id="login_wrap">
  <form method="post" action="member_Login_ok.do"
        onsubmit="return check()">
    <table id="login_t2">
      <tr>
        <th> 아이디</th>
        <td> <input name="id" id="id" class="login_box"> </td>
      </tr>  
      <tr>
        <th> 비밀번호</th>
        <td> <input type="password" name="pass"
               id="pass" class="login_box"> </td>
      </tr>
    </table>
      <div id="login_menu">
        <input type="submit" value="로그인" />
<!--         <input type="reset" value="메인"
               onclick="location='main.do'" />    -->                           
        <input type="button" value="회원가입" 
               onclick="location='member_Join.do'" />
        <input type="button" value="비번찾기"
               onclick="pwd_find()" />
        <input type="button" value="관리자 로그인" 
        	   onclick="location='admin_login.do'" />               
      </div>    
  </form>
  </div> 
<%	}else{//id가 있는 경우(=로그인 한 경우)%>
	로그인 성공!
	<br>
	<%
		String member_id = (String) session.getAttribute("id");
	%>
	<%=member_id%>님 환영합니다.
	<br>
	<form name="logoutForm" method="post" action="member_Logout.do">
		<a href="member_edit.do" onfocus="this.blur()">회원정보수정</a>
		<a href="member_del.do" onfocus="this.blur()">회원탈퇴</a>
		<a href="javascript:logoutForm.submit()">로그아웃</a>
	</form>
<% } %>
</body>
</html>

