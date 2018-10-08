<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="java.util.*"%>
<%@ page import="com.gongji.model.*" %>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
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
<%
List<GongjiBean> gongjiList=(List<GongjiBean>)request.getAttribute("gongjiList");
//setAttribute()에 의해서 Object형으로 업캐스팅 되면서
//키값에 저장된다. 반환되는 값도 다운캐스팅을 해서 저장한다.
//다운캐스팅은 업캐스팅이 된것에 한해서 다운캐스팅이 된다.
//레퍼런스간의 캐스팅 즉 다운(업)캐스팅은 상속이 된것에 한에서만
//허용된다.
//int listcount1=((Integer)request.getAttribute("listcount1")).intValue();
//int listcount2=((Integer)request.getAttribute("listcount2")).intValue();

int nowpage=((Integer)request.getAttribute("page")).intValue();
int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
int startpage=((Integer)request.getAttribute("startpage")).intValue();
int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>
<div id="article">
  
  <div id="article_c">
<!-- 본문 내용 -->
   <div id="aMain_cont">
   <div id="aGongji_list">
      <h2 class="aGlist_title">관리자 공지검색 목록</h2>
		<div id="aGlist_count">
			총게시물 수 : ${listcount}<br />
		</div>

		<table id="aGlist_t"  class="table table-hover"
					style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
					<tr style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td height="26" class="no" width="10%" style="text-align: center;">번호</td>
				<td class="title" width="30%" style="text-align: center;">제목</td>
				<td class="writer" width="10%" style="text-align: center;">작성자</td>
				<td class="date" width="20%" style="text-align: center;">날짜</td>
				<td class="hit" width="10%" style="text-align: center;">조회수</td>
				<td class="no" width="10%" style="text-align: center;">수정</td>
				<td class="no" width="10%" style="text-align: center;">삭제</td>
			</tr>
			<%	    
     if((gongjiList != null) && (gongjiList.size()>0)){			
		for(int i=0;i<gongjiList.size();i++){
			GongjiBean g=gongjiList.get(i);			
	%>
			<tr align="center" valign="middle" >
				<td height="23">
					 <%=g.getGongji_no()%> 
				</td>

				<td class="title_box">
				 <a
					href="admin_gongji_cont.do?gongji_no=<%=g.getGongji_no()%>&page=<%=nowpage%>"
					onfocus="this.blur();"> <%=g.getGongji_title()%></a>
				</td>

				<td><%=g.getGongji_name() %></td>
				<td><%=g.getGongji_regdate().substring(0,10)%></td>
				<td><%=g.getGongji_hit() %></td>
				<td>
<input type="button" value="수정" class="btn"
onclick="location='admin_gongji_edit.do?gongji_no=<%=g.getGongji_no()%>&page=<%=nowpage%>'" />				
				</td>
				<td>
<input type="button" value="삭제" class="btn"
onclick="if(confirm('정말로 삭제 하시겠습니까?')){
location='admin_gongji_del_ok.do?gongji_no=<%=g.getGongji_no()%>&page=<%=nowpage%>' 
}else{ return; }" />
<!-- 자바스크립트에서 window객체 하위의 confirm()메서드는 확인/취소 단추
를 가진 경고창을 만들어 준다. 확인단추를 클릭하면 반환값으로 true로 리턴하고,
취소 단추를 클릭하면false를 반환한다. 즉 관리자 모드에서 삭제 유무를 다시
확인하기 위해서 주로 사용한다. 확인을 클릭하면 삭제창으로 이동하고,취소를
클릭하면 삭제를 안하고 그대로 현재창에 있게 된다. --> 				
				</td>
			</tr>
			<%	   
		} }else{%>
		    <tr>
		     <th colspan="7" align="center">공지 검색 결과가 없습니다!</th>
		    </tr>
		<% } %>
		</table>
		<div id="aGlist_paging">
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="admin_gongji_find.do?page=<%=nowpage-1%>&find_name=${find_name}&find_field=${find_field}" onfocus="this.blur();">[이전]</a>&nbsp;
			<%} %>

			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
			[<%=a %>]
			<%}else{ %>
			<a href="admin_gongji_find.do?page=<%=a%>&find_name=${find_name}&find_field=${find_field}" onfocus="this.blur();">[<%=a %>]
			</a>&nbsp;
			<%} %>
			<%} %>

			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="admin_gongji_find.do?page=<%=nowpage+1 %>&find_name=${find_name}&find_field=${find_field}" onfocus="this.blur();">[다음]</a>
			<%} %>
		</div>		
		
		<!-- 관리자 공지 검색 부분 -->
		<div id="aGlist_find" style="text-align: center;">
		  <script>
		    function find_check(){
		    	if($.trim($("#find_name").val())==""){
		    		alert("검색어를 입력하세요!");
		    		$("#find_name").val("").focus();
		    		return false;
		    	}
		    }
		  </script>
		  <form method="get" action="admin_gongji_find.do"
		  onsubmit="return find_check()">
		      <table id="aGlistFind_t">
		        <tr>
		         <td>
		         <select name="find_field">
		          <option value="gongji_title" 
		          <c:if test="${find_field == 'gongji_title'}">
		       ${'selected'}</c:if>>공지제목</option>
		          <option value="gongji_cont" 
		          <c:if test="${find_field == 'gongji_cont'}">
		       ${'selected'}</c:if>
		          >공지내용</option>		          	          
		         </select>
		         <input name="find_name" id="find_name" size="10"
		         class="admin_box" value="${find_name}" />
		         <input type="submit" value="검색" class="admin_b"  />
		         <input type="button" value="목록" 
                   onclick="location='admin_gongji_list.do'"/>
		         </td>
		        </tr>
		      </table>
		  </form>
		</div>
    </div>
    </div>    
     </div>
   </div>
</body>
<footer style=" position:absolute;bottom:0;width:100%;width:105%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>