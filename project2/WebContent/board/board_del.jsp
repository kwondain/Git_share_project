<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<!-- header 영역 추가 -->
<div class="clear"> </div>
<div id="article">
    <div id="article_c">
     <!-- 여기서 부터 본문의 내용 -->
     <%
       // 컨트롤러에서 넘긴 키값을 받는다.
       BoardBean bean = 
           (BoardBean)request.getAttribute("bean");
     %>
     <script>
       function del_check(){
    	  // del_pwd 값이 공백인 경우
    	  if($.trim($("#del_pwd").val())==""){
    		  alert('삭제 비번을 입력하세요');
    		  $("#del_pwd").val("").focus(); // 커서이동
    		  return false;
    	  }   
       }
     </script>
     <h2 class="boardDel_title"> 삭제 창</h2>
     <form method="post" action="board_del_ok.do">
     <!-- 게시물 번호와 DB 비번을 히든으로 넘김 -->
      <input type="hidden" name="no"
             value="<%=bean.getBoard_no() %>"/>
      <input type="hidden" name="db_pwd"
             value="<%=bean.getBoard_pwd() %>"/>
      <table id="boardDel_t">
         <tr> 
            <th> 비번 삭제</th>
            <td> <input type="password" name="del_pwd"
              id="del_pwd" size="14" class="input_box"/>
            </td>  
         </tr>
      </table>
      <div id="boardDel_menu">
       <input type="submit" value="삭제" id="input_b"/>
       <input type="button" value="취소" id="input_b"
              onclick="history.back()"/>
      </div>    
     </form>
    </div>
</div>
<div class="clear"> </div>




