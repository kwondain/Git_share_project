<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*"%>
<div class="clear"></div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
 <div id="article">
  
  <div id="article_c">
	 <!-- 본문 내용 -->
   <div id="aMember_wrap">
    <div id="aMember_list">
      <h2 class="aMember_title">관리자 회원 목록</h2>
		<div id="aMember_count">
			총회원 수 : ${listcount}<br />
		</div>

		<table id="aMember_t">
			<tr>
				<th class="id">아이디</th>
				<th class="name">회원이름</th>
				<th class="nick">닉네임</th>
				<th class="no">수정</th>
				<th class="no">삭제</th>
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
					<input type="button" value="수정" class="admin_b"
						onclick="location='admin_member_edit.do?mem_id=<%=m.getMember_id()%>&page=<%=nowpage%>'" />				
				</td>
				<td>
					<input type="button" value="삭제" class="admin_b"
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
		      <table id="aMember_find_t">
		        <tr>
		         <td>
		         <select name="find_field">
		          <option value="member_id">아이디</option>
		          <option value="member_name">회원이름</option>		          	          
		         </select>
		         <input name="find_name" id="find_name" size="10"
		         class="admin_box" />
		         <input type="submit" value="검색" class="admin_b"  />
		         </td>
		        </tr>
		      </table>
		  </form>
		</div>
    </div>
   </div>
   </div>
  </div>
  <div class="clear"></div>
