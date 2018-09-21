<%@page import="java.net.URL"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
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
    try {
    	   File directory = new File("./");
    	   System.out.println(directory.getAbsolutePath());
    } catch (Exception e) {
      System.err.println(e);
      System.exit(1);
    }
%>
</body>
</html>