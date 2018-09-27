<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="css/bootstrap.css " rel="stylesheet" type="text/css">
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
<style>
	#logo{
		margin-top :10px;
		width: 25%;
		height: 20%;
	}
	h1{
		display: inline-block;
		margin-left: 10%;
	}
	.clear{
		both: clear; 
	}
	body{
		width : 720px;
		margin: 0 auto;
		border: 1px solid #ccc;
	}
	.first{
		border-top: 1px solid #333;
	}
	.button{
		width:100px;
		height: 20px;
		border: 1px solid #ccc;
	}
	
	td{
		border-bottom: 1px solid #333;
		width:550px;
		padding-top:10px;
		padding-bottom: 10px;
		padding-left:10px;
	}
	th{
		background-color: #ccc;
		width: 200px;
		text-align: left;
		padding-left: 3%;
		border-bottom: 1px solid #333;
	}
	#join_menu{
		height: 50px;
	}
	#address{
		display:none;
	}
	img{
		margin: 5px;
	}
	#address_img{
		margin: 15px 0 0 0;
	}
</style>
<!-- 제이쿼리 라이브러리 링크 -->
<script src="./js/jquery-3.js"></script>
<script src="./js/member.js"></script>
<script>
	$(function() { // 현재 문서가 브라우저로 로딩될 때 자동 호출되는 무명함수
		$("#idcheck_btn").click(function(){
			var userId = $("#member_id").val();
			window.open("IdCheckAction.do?id="+userId,
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
		});
	/* 	//아이디 검사 및 중복체크
		$("#idcheck_btn")
				.mouseover(
						function() { // 마우스 오버 시	   
							$("#idcheck").hide();//idcheck 영역을 숨김
							var userId = $("#member_id").val(); // 아이디 저장
							//1.입력 아이디 길이 체크
							if ($.trim($("#member_id").val()).length < 4) {
								var warningTxt = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
								$("#idcheck").text('');// idcheck 영역 초기화
								$("#idcheck").show();// idcheck 영역 보임
								$("#idcheck").append(warningTxt);//idcheck 영역에 경고메시지 추가	   			
								$("#member_id").val('').focus();// member_id 텍스트 상자에 커서 이동
								return false;
							};
							if ($.trim($("#member_id").val()).length > 12) {
								var warningTxt = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
								$("#idcheck").text('');
								$("#idcheck").show();
								$("#idcheck").append(warningTxt);
								$("#member_id").val('').focus();
								return false;
							}
							;
							//2.입력 아이디 유효성 검사
							if (!(validate_userid(userId))) {//유효성검증 함수 호출(false인 경우)
								var warningTxt = '<font color="red">영문 소문자 시작과 숫자 및 _ 조합만 가능</font>';
								$("#idcheck").text('');
								$("#idcheck").show();
								$("#idcheck").append(warningTxt);
								$("#member_id").val('').focus();
								return false;
							};							
							 // 다음 태그 수행 금지   
						});
		//아이디 중복 체크 끝 */
		function validate_userid(userId) {
			var pattern = new RegExp(/^[a-z][a-z0-9_]+$/);//영문소문자,숫자와_만 허용
			return pattern.test(userId);
		}
	}); // $(function()
</script>
</head>
<body>
	<div id="join_wrap">
		<a href="./main.jsp"><img id="logo" src="./images/lovingpet.png"></a>
		<h1 class="join_title">회원가입</h1>
		<div class="clear"></div>
		<form name="f" method="post" action="member_Join_ok.do" onsubmit="return mem_check()">
			<table id="join_t" class="table table-hover">
				<tr>
					<th class="first">아이디</th>
					<td class="first"><input name="member_id" id="member_id" size="14"  class="form-control"/>
						<input type="button" value="아이디중복체크" id="idcheck_btn"  class="form-control"/> <br> <!-- 경고문이 출력되는 위치  -->
						<span id="idcheck"> </span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pass" id="member_pass"
						size="14"  class="form-control"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="member_pass2"
						id="member_pass2" size="14"  class="form-control"/></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input name="member_name" id="member_name" size="14"  class="form-control"/></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input name="member_nickname" id="member_nickname" size="20"  class="form-control"/></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="member_gender" value="남자">남자
       					<input type="radio" name="member_gender" value="여자">여자
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="member_email" id="member_email" size="20"  class="form-control"/></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" name="member_zip" id="member_zip" maxlength="7" size="7" class="form-control">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>
					</td>
				</tr>
				<tr>
					<th>주소1</th>
					<td><input type="text" name="member_addr1" id="member_addr1" maxlength="80" size="80" class="form-control"></td>
				</tr>
				<tr>
					<th>주소2</th>
					<td><input type="text" name="member_addr2" id="member_addr2" maxlength="80" size="80" class="form-control"></td>
				</tr>
			</table>
			<div id="join_menu">
				<center>
				<input type="submit" id="submit" value="가입" class="btn"/><input type="reset" value="취소" onclick="$('#member_id').focus();" class="btn" style="margin-left: 3px"/>
				</center>
			</div>
		</form>
	</div>
</body>
</html>