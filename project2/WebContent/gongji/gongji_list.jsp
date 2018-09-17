<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.gongji.model.*" %>
<!-- dao 패키지의 모든 클래스를 사용하기 위해서 임포트 시킴 -->
<%@ page import="java.util.*" %>
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->
<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->
<div class="clear"></div>

 <div id="article">
  
  <div id="article_c">
  <%
List<GongjiBean> gongjiList=(List<GongjiBean>)request.getAttribute("gonjiList");
int nowpage=((Integer)request.getAttribute("page")).intValue();
int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
int startpage=((Integer)request.getAttribute("startpage")).intValue();
int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>   
<div id="Gongji_list">
      <h2 class="Glist_title">공지사항 목록</h2>
		<div id="Glist_count">
			총게시물 수 : ${listcount}<br />
		</div>

		<table id="Glist_t">
			<tr>
				<td height="26" class="no">번호</td>
				<td class="title">제목</td>
				<td class="writer">작성자</td>
				<td class="date">날짜</td>
				<td class="hit">조회수</td>				
			</tr>
			<%	    	
		for(int i=0;i<gongjiList.size();i++){
			GongjiBean g=gongjiList.get(i);			
	         %>
			<tr align="center" valign="middle" >
				<td height="23">
					 <%=g.getGongji_no()%> 
				</td>

				<td class="title_box">
				 <a
					href="gongji_cont.do?gongji_no=<%=g.getGongji_no()%>&page=<%=nowpage%>"
					onfocus="this.blur();"> <%=g.getGongji_title()%></a>
				</td>

				<td><%=g.getGongji_name() %></td>
				<td><%=g.getGongji_regdate().substring(0,10)%></td>
				<td><%=g.getGongji_hit() %></td>				
			</tr>
			<%	   
		} %>
		</table>
		<div id="Glist_paging">
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="gongji_list.do?page=<%=nowpage-1 %>" onfocus="this.blur();">[이전]</a>&nbsp;
			<%} %>

			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
			[<%=a %>]
			<%}else{ %>
			<a href="gongji_list.do?page=<%=a %>" onfocus="this.blur();">[<%=a %>]
			</a>&nbsp;
			<%} %>
			<%} %>

			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="gongji_list.do?page=<%=nowpage+1 %>" onfocus="this.blur();">[다음]</a>
			<%} %>
		</div>
	</div>		
</div>
</div>
<div class="clear"></div>