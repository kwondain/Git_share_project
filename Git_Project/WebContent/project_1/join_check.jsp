<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd1 = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String eamil2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		
		try{
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String sql_id = "scott";
			String sql_pw = "tiger";
			
			Connection conn = DriverManager.getConnection(url,sql_id,sql_pw);
			Statement st = conn.createStatement();
			String sql = "insert into member values('"+id+"','"+pwd1+"','"+name+"','"+birth+"','"+gender+"','"+email1+"@"+eamil2+"','"+tel1+"-"+tel2+"-"+tel3+"','"+address2+" "+address3+"')"; 
			
			st.executeUpdate(sql);
			out.println("회원가입 완료");
		}catch(Exception e){
			out.println("회원가입 실패");
		}
	%>
</body>
</html>