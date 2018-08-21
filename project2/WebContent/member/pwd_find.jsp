<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" 
      uri="http://java.sun.com/jsp/jstl/core" %>
<!-- pwd_find.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비번 찾기</title>
<link rel="stylesheet" type="text/css" 
      href="./css/member.css">
<script src="./js/jquery-3.js"></script>
<script>
   function pwd_check(){ 
	   // pwd_id 체크
	   if($.trim($("#pwd_id").val())==""){
		   alert("아이디를 입력하세요!");
		   $("#pwd_id").val("").focus();
		   return false;
	   }
	   // pwd_name 체크
	   if($.trim($("#pwd_name").val())==""){
		   alert("회원 이름을 입력하세요!");
		   $("#pwd_name").val("").focus();
		   return false;
	   }	   
   }
</script>      
</head>
<body>
  <div id="pwd_wrap">
  <c:if test="${empty passwd}" >
    <h2 class="pwd_title">비번찾기</h2>
    <form method="post" action="pwd_find_ok.do"
          onsubmit="return pwd_check()">
       <table id="pwd_t">
         <tr> 
          <th> 아이디</th>
          <td>
            <input name="pwd_id" id="pwd_id" size="14"/>
          </td>
         </tr>
         <tr> 
          <th> 회원이름</th>
          <td>
           <input name="pwd_name" id="pwd_name" size="14"/>
          </td>
         </tr>
       </table>
       <div id="pwd_menu">
         <input type="submit" value="찾기"/>
         <input type="reset" value="취소"
                onclick="$('#pwd_id').focus()"/>
         <!-- 인라인 방식으로 제이쿼리 함수 지정-->       
       </div>
    </form> 
 </c:if>
 <!-- jstl를 이용하여 결과값을 리턴 받음 -->
 <%
   request.setCharacterEncoding("UTF-8"); 
 %>
 <c:if test="${!empty passwd}">
   <h2 class="pwd_title2">비번찾기 결과</h2>
      <table id="pwd_t2">
         <tr>
            <th>검색된 비번 </th>
            <th> ${passwd} </th>
         </tr>
      </table> 
 </c:if>
            
  </div>
</body>
</html>




