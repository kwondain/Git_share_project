<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<!-- dao 패키지의 모든 클래스를 사용하기 위해서 임포트 시킴 -->
<%@ page import="java.util.*" %>
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->
<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->

<div class="clear"></div>

 <div id="article">
  
  <div id="article_c">
       
<div id="boardwrite_wrap">
<h2 class="boardwrite_title">게시물 글쓰기</h2>
<form method="post" action="board_write_ok.do"
      onsubmit="return board_check()">
 <table id="boardwrite_t">
    <tr>
      <th> 글쓴이 </th>
      <td>
        <input name="board_name" id="board_name" 
        class="input_box" size="14"/></td>
    </tr>   
    <tr>
      <th> 제목 </th>
      <td>
        <input name="board_title" id="board_title"
        class="input_box" size="30"/></td>
    </tr>
    <tr>
      <th> 글내용 </th>
      <td> <textarea name="board_cont" id="board_cont"
           rows="8" cols="40"></textarea> </td>
       <!-- textarea 태그는 2줄 이상의 문단을 입력할 수 있는 텍스트 필드 양식 -->
    </tr>
    <tr>
      <th> 비밀번호</th>
      <td> <input type="password" name="board_pwd" 
           id="board_pwd" class="input_box" size="14"/> 
      </td>
    </tr>
 </table>
   <input type="submit" value="입력" class="boardwrite_b"/>
   <input type="reset" value="취소" 
              onclick="history.back()"/>
   <!--  입력 내용을 초기화 하면서 글쓴이 입력창으로 포커스를 이동시킨다. -->
</form>
</div>

 </div>
</div>

<div class="clear"></div>



