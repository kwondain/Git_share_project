<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.gongji.model.*" %>
<%@ page import="com.gongji.model.*" %>
<!-- dao 패키지의 모든 클래스를 사용하기 위해서 임포트 시킴 -->
<%@ page import="java.util.*" %>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->
<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->
<div class="clear"></div>

 <div id="article">
  
  <div id="article_c">
  <%
  	GongjiBean gongji = (GongjiBean)request.getAttribute("gongji");
  %>
 <div id="uGongji_wrap">
  <h2 class="uGongji_title">사용자 공지 보기</h2>
  <table id="uGongji_t">
   <tr>
    <th>공지제목</th>
    <td><%= gongji.getGongji_title() %></td>
   </tr>
   
   <tr>
    <th>공지내용</th>
    <td><%= gongji.getGongji_cont() %></td>
   </tr>
   
   <tr>
    <th>조회수</th>
    <td><%=gongji.getGongji_hit() %></td>
   </tr>
  </table>
  
  <div id="uGongji_menu">
    <input type="button" value="목록" class="gbutton_b"
    onclick="location='gongji_list.do?page=${page}'" />
  </div>
 </div>
  </div>
</div>
<div class="clear"></div>