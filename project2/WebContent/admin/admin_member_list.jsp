<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
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
List<MemberBean> memList=(List<MemberBean>)request.getAttribute("memList");
//setAttribute()에 의해서 Object형으로 업캐스팅 되면서
//키값에 저장된다. 반환되는 값도 다운캐스팅을 해서 저장한다.
//다운캐스팅은 업캐스팅이 된것에 한해서 다운캐스팅이 된다.
//레퍼런스간의 캐스팅 즉 다운(업)캐스팅은 상속이 된것에 한에서만
//허용된다.
//int listcount1=((Integer)request.getAttribute("listcount1")).intValue();
//int listcount2=((Integer)request.getAttribute("listcount2")).intValue();

int nowpage=((Integer)request.getAttribute("page"));
int maxpage=((Integer)request.getAttribute("maxpage"));
int startpage=((Integer)request.getAttribute("startpage"));
int endpage=((Integer)request.getAttribute("endpage"));

%>
 <div id="article" style="text-align: center;">
  <div id="article_c">
	 <!-- 본문 내용 -->
   <div id="aMember_wrap">
    <div id="aMember_list">
      <h2 class="aMember_title">관리자 회원 목록</h2>
		<div id="aMember_count">
			총회원 수 : ${listcount}<br />
		</div>

		<table id="aMember_t"  class="table table-hover"
					style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
					<tr style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th class="id" width="30%" style="text-align: center;">아이디</th>
				<th class="name" width="30%" style="text-align: center;">회원이름</th>
				<th class="nick" width="20%" style="text-align: center;">닉네임</th>
				<th class="no" width="10%" style="text-align: center;">수정</th>
				<th class="no" width="10%" style="text-align: center;">삭제</th>
			</tr>
			<%	    	
		for(int i=0;i<memList.size();i++){
			MemberBean m=memList.get(i);			
	%>
			<tr align="center" valign="middle" >

				<td align="center">
				 <a
					href="admin_member_cont.do?mem_id=<%=m.getMember_id()%>&page=<%=nowpage%>"
					onfocus="this.blur();"><%=m.getMember_id()%></a>
				</td>

				<td><%=m.getMember_name() %></td>
				<td><%=m.getMember_nickname()%></td>
				<td>
					<input type="button" value="수정" class="btn"
						onclick="location='admin_member_edit.do?mem_id=<%=m.getMember_id()%>&page=<%=nowpage%>'" />				
				</td>
				<td>
					<input type="button" value="삭제" class="btn"
						onclick="if(confirm('정말로 삭제 하시겠습니까?')){
							location='admin_member_del_ok.do?mem_id=<%=m.getMember_id()%>&page=<%=nowpage%>' 
							}else{ return; }" />			 				
				</td>
			</tr>
			<%	   
		} %>
		</table>
		<div id="aMember_paging">
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="admin_member_list.do?page=<%=nowpage-1 %>" onfocus="this.blur();">[이전]</a>&nbsp;
			<%} %>

			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
			[<%=a %>]
			<%}else{ %>
			<a href="admin_member_list.do?page=<%=a %>" onfocus="this.blur();">[<%=a %>]
			</a>&nbsp;
			<%} %>
			<%} %>

			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="admin_member_list.do?page=<%=nowpage+1 %>" onfocus="this.blur();">[다음]</a>
			<%} %>
		</div>
		<br>		
		<!-- 관리자 회원 검색 부분 -->
		<div id="aMember_find">
		  <script>
		    function find_check(){
		    	if($.trim($("#find_name").val())==""){
		    		alert("검색어를 입력하세요!");
		    		$("#find_name").val("").focus();
		    		return false;
		    	}
		    }
		  </script>
		  <form method="get" action="admin_member_find.do"
		  onsubmit="return find_check()">
		      <table id="aMember_find_t" style="margin-left: auto;margin-right: auto; text-align: center;">
		        <tr>
		         <td>
		         <select name="find_field" >
		          <option value="member_id">아이디</option>
		          <option value="member_name">회원이름</option>		          	          
		         </select>
		         <input name="find_name" id="find_name" size="10"
		         class="admin_box" />
		         <input type="submit" value="검색" class="btn"  />
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