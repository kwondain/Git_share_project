<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*" %>
<%@ page import="java.util.*" %>

<div class="clear">
<h3>게시판1 (유저가 사용하는 게시판으로 분화시킬 것/admin이 사용하는 공지사항은 다른 방법으로 생성해야 함)</h3>
<hr>
</div>
 <div id="article">
  <div id="article_c">
<%List<BoardBean> boardList = (List<BoardBean>)request.getAttribute("LIST");
  // 게시판의 목록을 가져온다.
  // getBoardList()메소드는 BoardDAO 클래스에 목록을 가져올 수 있는 내용을 메소드를 작성한다.
%>
 <div id="board_wrap">  
  <table id="board_t">
     <tr>
        <td colspan="5" align="center">  
            &nbsp;
        </td>
     </tr>
     <tr>
        <th> 글번호 </th> <th> 제목 </th>
        <th> 글쓴이 </th> <th> 등록날짜 </th>
        <th> 조회수 </th>
     </tr>
     <%
        if((boardList != null) && (boardList.size()>0 )){
        	// 게시판의 목록이 1개 이상 존재하는 경우 조건은 참이 된다.
        	for(int i=0; i<boardList.size(); i++){
        		BoardBean board = boardList.get(i);
        		// 컬렉션 요소값을 BoardBean 타입으로 가져온다.
     %>
        <tr>
           <!-- 게시판 번호 표시 -->
           <td align="center"> <%=board.getBoard_no() %></td>
           <td>
              <!-- 게시물 제목을 클릭하면 해당 게시물의 내용을 볼 수 있도록
               '*.do?no=글번호' 형태의 get 방식으로 글번호를 넘긴다. -->
               <a href="board_cont.do?no=<%=board.getBoard_no()%>"
                 onfocus="this.blur()"> 
               <%=board.getBoard_title()%></a></td>
           
           <td> &nbsp;<%=board.getBoard_name() %>&nbsp; </td>
           <td>
              &nbsp; 
              <%=board.getBoard_regdate().substring(0,10)%>&nbsp;</td>
            <!-- substring(0,10)은 등록날짜에서 앞자리 10개만 추출(날짜부분)-->
            <td align="center"> <%=board.getBoard_hit() %> </td>
          </tr>
          <%
        	} // for end
          }else{
          %>
            <tr>
               <td colspan="5"> 게시물 목록이 없습니다.</td>
            </tr>
          <% } %>
      </table>
  		<input type="button" value="글쓰기" 
            onclick="location='board_write.do'" 
            class="board_b"/>
       <!-- [글쓰기] 버튼을 클릭하면 board_write.jsp 파일로 이동된다. -->     
       <script>
         function find_check(){
        	 if($.trim($("#find_name").val())==""){
        		 alert("검색어를 입력하세요.");
        		 $("#find_name").val("").focus();
        		 return false;
        	 }
         }
       </script>
       <div id="board_find">
         <form method="get" action="board_find_ok.do"
               onsubmit="return find_check()">
            <select name="find_field">
              <option value="board_title">제목</option>
              <option value="board_cont">내용</option>
            </select>
            <input name="find_name" id="find_name"
                   size="14"/>
            <input type="submit" value="검색" />       
         </form>
       </div>     
    </div> 
  </div>
</div>

<div class="clear"></div>