<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%
String zipcode,addr,addr2;
String dong = (String)request.getAttribute("dong"); 
List zipcodeList = (ArrayList)request.getAttribute("zipcodelist");
%>
<html>
<head>
<title>우편번호 검색</title>
<SCRIPT>
function selectnow() {	
	var zip=document.postform.post_list.value;
	var zip1=zip.substring(0,3);
	var zip2=zip.substring(4,7);
	var addr2=zip.substring(7, (zip.length));
	
	opener.document.f2.member_zip1.value=zip1;
	/* 회원가입창에 첫번째 세자리 우편번호를 입력한다. */
	opener.document.f2.member_zip2.value=zip2;
	/* 회원가입창에 두번째 세자리 우편번호를 입력한다. */
	opener.document.f2.member_addr1.value=addr2;		
	/* 회원가입창에 나머지 주소를  입력한다. */

	parent.window.close();
	/* 그리고 윈도우 창을 닫아준다.  */

}
function check(form){
	if(form.dong.value==""){
		alert("동을 입력해 주세요!");
		form.dong.focus();
	return false;
	}
}

</SCRIPT>
<style type="text/css">
<!--
INPUT,SELECT{font-family: Dotum;font-size:9pt;;}
.style1 {
	color: #466D1B;
	font-weight: bold;
	font-size: 12px;
}
-->
</style>
</head>
<body onload="postform.dong.focus();" bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<form name="postform" method="post" action="admin_zipcode_ok.do"  onsubmit="return check(this)">
<table width="414" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr> 
  <td bgcolor="#999999" align="center"><input type="image" src="images/ZipCode_img01.gif" width="413" height="58"></td>
 </tr>
 <tr> 
  <td bgcolor="f5ffea" align="center"> 
   <strong><font color="#466d1b"><span class="style1">[거주지의 면.동을 입력하고 '찾기'버튼을 누르세요!!!]</span></font></strong>
  </td>
 </tr>
 <tr height="30"> 
   <td bgcolor="f5ffea" align="center">
     <input type="text" name="dong" value size="10" maxlength="10">
     &nbsp;
     <input type="image"  src="images/m-i02.gif" width="69" height="19" align="absmiddle" onfocus="this.blur()">
   </td>
 </tr>
 <%if(dong != null){ %>
 <%if(zipcodeList != null && zipcodeList.size() != 0){%>
 <tr> 
  <td bgcolor="f5ffea" height="30" align="center">
   <SELECT NAME="post_list" onchange="selectnow()">
    <option value="">----주소를 선택하세요----</option>
	<%for(int i = 0; i < zipcodeList.size(); i++) {	
		String data=(String)zipcodeList.get(i);
		StringTokenizer st = new StringTokenizer(data,",");
		zipcode = st.nextToken();
		addr = st.nextToken();
		addr2 = st.nextToken();
		String totaladdr = zipcode + addr;
	%>
	<option value="<%=totaladdr%>">[<%=zipcode%>]&nbsp;<%=addr%></option>
	<%}%>
   </SELECT>
  </td>
 </tr>
 <%}else{ %>
 <tr>
   <td bgcolor="f5ffea" height="30" align="center">
     <font color="#466d1b"><span class="style1">검색 결과가 없습니다.</span></font>
   </td>
 </tr>
 <%}}%>
 <tr> 
  <td bgcolor="508C0F" colspan="3" height="3"></td>
 </tr>
</table>
</form>
</body>
</html>