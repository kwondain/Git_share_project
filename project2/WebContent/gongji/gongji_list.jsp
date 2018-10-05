<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.gongji.model.*" %>
<!-- dao 패키지의 모든 클래스를 사용하기 위해서 임포트 시킴 -->
<%@ page import="java.util.*" %>
<head>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->
<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->
<div id=wrapper>
		<header>
			<div class="title">
			<a href="./main.jsp"><img src="images/lovingpet.png"></a>
		</div>
		<div class="loginmenu">
 			<jsp:include page="/member/member_login.jsp" />
<!-- 			<br><br>
			<a href="./member_Login.do"><input type="button" value="로그인"></a> -->
		</div>

		<nav class="mainmenu">
		<ul>
			<li><a href="#">펫시터 지원하기</a>
				<ul>
					<li><a href="./leavepet.do">펫시터란</a></li>
					<li><a href="./leavejoin.do">펫시터 지원하기</a></li>
				</ul></li>
			<li><a href="./leavelist_Action.do">펫 맡기기</a></li>
			<li><a href="#">공지사항&#38;게시판</a>
				<ul>
					<li><a href="gongji_list.do">공지사항</a></li>
					<li><a href="./board_list.do">자유게시판</a></li>
				</ul></li>
			<li><a href="#">내 페이지</a>
				<ul>
					<li><a href="member_edit.do">회원정보 수정</a></li>
					<li><a href="#">내가 찜한 펫시터 리스트</a></li>
				</ul></li>
		</ul>
		</nav>
		
<div class="clear"></div>

 <div id="article" style="text-align: center;">
  
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

		<table id="Glist_t"
			style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
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
		<footer style=" position:absolute;bottom:0;width:100%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>
</body>