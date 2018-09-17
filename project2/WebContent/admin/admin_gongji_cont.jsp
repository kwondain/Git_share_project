<%@page import="com.gongji.model.GongjiBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<div class="clear"></div>
<%
	GongjiBean m = (GongjiBean)request.getAttribute("g");
%>

 <div id="article">
  
  <div id="article_c">
 <!-- 본문 내용 -->
 <div id="aGongji_cont">
  <h2 class="aGongji_title">관리자 공지 내용</h2>
  <table id="aGongji_t">
       <tr>
        <th>공지제목</th>
        <td>
         <%= m.getGongji_title() %>
        </td>
       </tr>
       
       <tr>
        <th>공지내용</th>
        <td>
         <%= m.getGongji_cont() %>
        </td>
       </tr>  
       
      </table>
      <div id="aGcont_menu">
       <input type="button" value="목록" class="admin_b"
       onclick="location='admin_gongji_list.do?page=${page}'" />
      </div>
    </div>
   </div>
 </div>
 <div class="clear"></div>