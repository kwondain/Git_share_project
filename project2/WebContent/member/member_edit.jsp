<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<!-- 제이쿼리 라이브러리 링크 -->
<script src="./js/jquery-3.js"></script>
<!-- 회원가입에 있어서 데이터를 검증하는 외부 자바스크립트 파일 링크  -->
<script src="./js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
           
            //각 주소의 노출 규칙에 따라 주소를 조합한다.
            //내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
            var fullAddr = '';//최종 주소 변수
            var extraAddr = '';//조합형 주소 변수
            
            //사용자가 선택한 주소타입에 따라 해당 주소값을 가져온다.
            if(data.userSelectedType==='R'){//사용자가 도로명 주소를 선택
            	fullAddr = data.roadAddress;
            }else{//사용자가 지번 주소를 선택
            	fullAddr = data.jibunAddress;
            }
            
            //사용자가 선택한 주소가 도로명타입일 때 조합한다.
            if(data.userSelectedType==="R"){
            	//법정동명이 있을 경우 추가
            	if(data.bname!==''){
            		extraAddr += data.bname;
            	}
            	//건물명이 있을 경우 추가
            	if(data.buildingName!==''){
            		extraAddr += (extraAddr!==''?','+data.buildingName:data.buildingName);
            	}
            	//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            	fullAddr += (extraAddr!==''?' ('+extraAddr+')': '')
            }
            //우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_zip').value=data.zonecode;//5자리 새 우편번호 사용
            document.getElementById('member_addr1').value=fullAddr;
            
            //커서를 상세주소 필드로 이동한다.
            document.getElementById('member_addr2').focus();
        }
    }).open();
}
</script>
<link href="css/bootstrap.css " rel="stylesheet" type="text/css">
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
  <div id="join_wrap" style="text-align: center;">
    <h2 class="join_title">회원정보 수정</h2>
    <form name="f" method="post" action="member_edit_ok.do"
    onsubmit="return edit_check()">
       
   <table class="table" id="join_t"style="text-align: center; width: 40%; margin-left: auto; margin-right: auto;">
      <tr  style="text-align: center;">
         <th>회원아이디</th>
         <td> ${member.member_id} </td>       
      </tr>     
      <tr>
         <th>비밀번호</th>
         <td> 
           <input type="password" name="member_pass" 
                id="member_pass" size="14" class="form-control"/>
          </td>
      </tr>            
      <tr>
         <th>비밀번호 확인</th>
         <td> 
           <input type="password" name="member_pass2" 
                id="member_pass2" size="14" class="form-control"/>
          </td>
      </tr>
      <tr>
         <th>회원이름</th>
         <td> 
           <input name="member_name" id="member_name" size="14"
            value="${member.member_name}" class="form-control"/> </td>
      </tr>
      <tr>
         <th>닉네임</th>
         <td> 
         <input name="member_nickname" id="member_nickname" 
                size="14" value="${member.member_nickname}" class="form-control"/>  
         </td>
      </tr>
      <tr>
         <th>성별</th>
         <td> 
<%--          <input name="member_gender" id="member_gender" size="14" value="${member.member_gender}"/> --%>
         <input type="radio" name="member_gender" value="남자">남자
       	 <input type="radio" name="member_gender" value="여자">여자
         </td>
      </tr>
            <tr>
         <th>이메일</th>
         <td> 
         <input name="member_email" id="member_email" 
                size="20" value="${member.member_email}" class="form-control"/>  
         </td>
      </tr>
      <tr>
         <th>우편번호</th>
         <td> 
           <input name="member_zip" id="member_zip" size="5"
           	value="${member.member_zip}"
            class="form-control"/>
<!--               readonly onclick="post_search()"/> -->
         
        
<!--             readonly onclick="post_search()"/> -->
          <!-- readonly 속성 : 텍스트상자에 데이터를 입력할 수 없고,
                        단지 읽기 전용으로 지정할 경우 사용하는 속성 -->
            <input type="button" value="우편번호찾기" onclick="execDaumPostcode()"
             class="form-control"/>
<!--                    onclick="post_check()"/>      -->                                                           
         </td>
      </tr>
      <tr>
         <th>주소</th>
         <td> 
           <input name="member_addr1" id="member_addr1" size="50"
           value = "${member.member_addr1}"
           class="form-control"/>
<!--            readonly onclick="post_search()"/> -->
          </td>
      </tr>
      <tr>
         <th>나머지 주소</th>
         <td> 
           <input name="member_addr2" id="member_addr2"
           value = "${member.member_addr2}"
            size="40" class="form-control"/>
          </td>
      </tr>      
   </table> 
   <div id="join_menu">
      <input type="submit" value="수정"class="btn"/>
      <input type="reset" value="취소"
              onclick="$('#member_id').focus();"class="btn"/>   
   </div>          
   </form>   
  </div>
  <footer style=" position:absolute;bottom:0;width:100%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>