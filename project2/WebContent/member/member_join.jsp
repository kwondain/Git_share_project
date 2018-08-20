<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<!-- 제이쿼리 라이브러리 링크 -->
<script src="./js/jquery-3.js"></script>
<!-- 회원가입에 있어서 데이터를 검증하는 외부 자바스크립트 파일 링크  -->
<script src="./js/member.js"></script>
<script>
	$(function() { // 현재 문서가 브라우저로 로딩될 때 자동 호출되는 무명함수		
		function validate_userid(userId) {
			var pattern = new RegExp(/^[a-z][a-z0-9_]+$/);//영문소문자,숫자와_만 허용
			return pattern.test(userId);
		}
	}); // $(function()
</script>
</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원가입</h2>
		<form name="f" method="post" action="member_Join_ok.do"
			onsubmit="return mem_check()" enctype="multipart/form-data">
			<!-- enctype="multipart/form-data"은 이진파일(바이너리 모드)을 
       업로드 할 경우 지정하는 속성이다. -->
			<table id="join_t">
				<tr>
					<th>회원아이디</th>
					<td><input name="member_id" id="member_id" size="14" />
						<input type="button" value="아이디중복체크" id="idcheck_btn" /> <br> <!-- 경고문이 출력되는 위치  -->
						<span id="idcheck"> </span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pass" id="member_pass"
						size="14" /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="member_pass2"
						id="member_pass2" size="14" /></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input name="member_name" id="member_name" size="14" /></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input name="member_nickname" id="member_nickname" size="20" /></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input name="member_gender" id="member_gender" size="20" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="member_email" id="member_email" size="20" /></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input name="member_zip1" id="member_zip1" size="3"
						/>
<!-- 						readonly onclick="post_search()" /> -->
						-
						<input name="member_zip2" id="member_zip2" size="3"
						/>
<!-- 						readonly onclick="post_search()" /> readonly 속성 : 텍스트상자에 데이터를 입력할 수 없고,
                        단지 읽기 전용으로 지정할 경우 사용하는 속성 -->
                        <input type="button" value="우편번호찾기" onclick="post_check()" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="member_addr1" id="member_addr1" size="50"
						/>
<!-- 						readonly onclick="post_search()" /></td> -->
				</tr>
				<tr>
					<th>나머지 주소</th>
					<td><input name="member_addr2" id="member_addr2" size="40" />
					</td>
				</tr>
			</table>
			<div id="join_menu">
				<input type="submit" value="가입" /> <input type="reset" value="취소" onclick="$('#member_id').focus();" />
			</div>
		</form>
	</div>
</body>
</html>







