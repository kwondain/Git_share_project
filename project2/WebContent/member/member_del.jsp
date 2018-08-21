<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_del.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" 
            href="./css/member.css">
<script src="./js/jquery-3.js"></script>
<script>
   function check(){ // 회원탈퇴 data 검증
	   if($.trim($("#pwd").val())==""){
		   alert('비밀번호를 입력하세요!');
		   $("#pwd").val("").focus(); // 커서 이동
		   return false; // false값 리턴
	   }
   }
</script>
</head>
<body>
  <div id="del_wrap">
    <h2 class="del_title">회원탈퇴</h2>
    <form method="post" action="member_del_ok.do"
          onsubmit="return check()">
     <table id="del_t">
        <tr> 
           <th> 아이디 </th>
           <td> ${id} </td>
           <!-- 컨트롤러에서 넘긴 키값 EL로 출력-->
        </tr>
        <tr> 
           <th> 회원이름 </th>
           <td> ${name} </td>
           <!-- 컨트롤러에서 넘긴 키값 EL로 출력-->
        </tr>
        <tr> 
           <th> 비밀번호 </th>
           <td> 
            <input type="password" name="pwd" id="pwd"/>
           </td>           
        </tr>
     </table>
     <div id="del_menu">
       <input type="submit" value="탈퇴"/>
       <input type="reset" value="취소"/>
     </div>     
    </form>
  </div>
</body>
</html>


