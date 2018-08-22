<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<%@ page import="java.util.*" %>
<!-- 외부 패키지 임포트 -->

<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->

<div class="clear"></div>

 <div id="article">
  
 <div id="article_c">
 <%
 	// setAttribute()메소드로 저장된 키 값을 가져온다.
 	// board 키에는 수정을 위한 레코드 정보가 들어있다.
 	BoardBean board = (BoardBean)request.getAttribute("bean");
 %> 
 <div id="boardwrite_wrap">
 <h2 class="boardwrite_title">게시물 수정 </h2>
 <form method="post" action="board_edit_ok.do"
       onsubmit="return board_check()"> 
 <!-- 히든타입으로 글번호와 비밀번호를 넘긴다.
         히든은 웹 상에서 안보이게 하는 역할을 한다. 값이 보이지 않게 넘길때 사용됨-->
 <input type="hidden" name="no" value="<%=board.getBoard_no()%>"/>
 <input type="hidden" name="db_pwd" value="<%=board.getBoard_pwd()%>"/>
 <table id="boardwrite_t">
    <tr>
       <th> 글쓴이 </th>
       <td> <input type="text" name="board_name" id="board_name"
       		 class="input_box" size="14" value="<%=board.getBoard_name() %>" /></td>
    </tr>
    <tr>
       <th> 글제목 </th>
       <td> <input type="text" name="board_title" id="board_title"
       		 class="input_box" size="14" value="<%=board.getBoard_title() %>" /></td>
    </tr>
    <tr>
       <th> 글내용 </th>
       <td> <textarea name="board_cont" id="board_cont" 
       	 cols="40" rows="10"><%=board.getBoard_cont() %>
              </textarea>
       </td>
    </tr>
    <tr>
       <th> 비밀번호 </th>
       <td> <input type="password" name="board_pwd" 
                 id="board_pwd" size="14" class="input_box"/> 
    </tr>    
 </table>
   <input type="submit" value="수정" class="boardwrite_b"/>
   <input type="button" value="취소" 
              onclick="history.back()"/>   
  </form>
  </div>
  </div>
  </div>
    
<div class="clear"></div>




