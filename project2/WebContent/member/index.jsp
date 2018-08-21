<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인 성공!
	<br>
	<%
		String member_id = (String) session.getAttribute("id");
	%>
	<%=member_id%>님 환영합니다.
	<br>
	<form name="logoutForm" method="post" action="member_Logout.do">
		<a href="member_edit.do" onfocus="this.blur()">회원정보수정</a>
		</td> <a href="member_del.do" onfocus="this.blur()">회원탈퇴</a>
		</td> <a href="javascript:logoutForm.submit()">로그아웃</a>
	</form>
</body>
</html>