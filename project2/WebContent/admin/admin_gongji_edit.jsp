<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.gongji.model.*"%>   
<%
	GongjiBean m = (GongjiBean)request.getAttribute("g");
int nowpage=((Integer)request.getAttribute("page")).intValue();
%>
<div class="clear"></div>
<div id="article">
  
  <div id="article_c">
 <!-- 본문 내용 -->
   <div id="aMain_cont">
     <div id="aGongji_edit">
       <h2 class="aGedit_title">관리자 공지사항 수정</h2>
       <form method="post" action="admin_gongji_edit_ok.do"
       onsubmit="return aGongji_write();">
       <input type="hidden" name="gongji_no" value="<%=m.getGongji_no() %>" />
       <input type="hidden" name="page" value="<%= nowpage %>" />
       <table id="aGedit_t">
         <tr>
          <th>공지 작성자</th>
          <td>
           <input name="gongji_name" id="gongji_name" size="14" 
           class="admin_box" value="<%=m.getGongji_name() %>" />
          </td>
         </tr>
         
         <tr>
           <th>공지 제목</th>
           <td>
            <input name="gongji_title" id="gongji_title" size="40"
            class="admin_box" value="<%=m.getGongji_title() %>" />
           </td>
         </tr>
         
         <tr>
           <th>공지 내용</th>
           <td>
            <textarea name="gongji_cont" id="gongji_cont" rows="9"
            cols="40" ><%=m.getGongji_cont() %></textarea>
           </td>
         </tr>
         
         <tr>
           <th>비밀번호</th>
           <td>
            <input type="password" name="gongji_pwd" id="gongji_pwd"
            size="14" class="admin_box" />
           </td>
         </tr>
       </table>
       <div id="aGedit_menu">
        <input type="submit" value="수정" class="admin_b" />
        <input type="reset" value="취소" class="admin_b" 
        onclick="$('#gongji_name').focus();" />
       </div>
       </form>
     </div>     
   </div>
    </div>
   </div>
 <div class="clear"></div>
   