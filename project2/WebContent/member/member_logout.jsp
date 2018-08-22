<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String path = request.getContextPath();
    //세션정보
    session.invalidate();//세션 정보 삭제
    
    out.print("<script>");
    out.print("alert('로그아웃 되었습니다.');");
    out.print("location.href='./main.jsp';");
    out.print("</script>");
%>
</body>
</html>