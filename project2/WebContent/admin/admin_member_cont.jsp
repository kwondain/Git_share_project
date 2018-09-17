<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*"%>

<div class="clear"></div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MemberBean mb = (MemberBean)request.getAttribute("m");
%>
 <div id="article">
  
  <div id="article_c">
  <!-- 본문 내용 --> 
   <div id="aMain_cont">
     <div id="meminfo_wrap">
       <h2 class="meminfo_title">회원정보</h2>
       <table id="meminfo_t">
        <tr>
         <th>아이디</th> <td><%= mb.getMember_id() %></td>
        </tr>
        <tr>
         <th>비밀번호</th> <td><%= mb.getMember_pass() %></td>
        </tr>
        <tr>
         <th>회원이름</th> <td><%= mb.getMember_name() %></td>
        </tr>
        <tr>
         <th>닉네임</th> <td><%= mb.getMember_nickname() %></td>
        </tr>
        <tr>
         <th>성별</th> <td><%= mb.getMember_gender() %></td>
        </tr>
        <tr>
         <th>이메일</th> <td><%= mb.getMember_email() %></td>
        </tr>
        <tr>
         <th>집주소</th>
         <td>
          <%= mb.getMember_zip() %><br/>
          <%= mb.getMember_addr1() %>&nbsp; <%= mb.getMember_addr2() %>
         </td>
        </tr>

       </table>
       <div id="meminfo_menu">
        <input type="button" value="회원목록" class="admin_b"
        onclick="location='admin_member_list.do?page=${page}'" />        
       </div>
     </div>
   </div>
  </div>
  </div>
  <div class="clear"></div>
   