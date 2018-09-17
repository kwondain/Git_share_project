/* admin.js */
function adminLogin_check(){
	if($.trim($("#admin_id").val())==""){
		alert("관리자 아이디를 입력하세요!!");
		$("#admin_id").val("").focus();
		return false;
	}
	if($.trim($("#admin_pwd").val())==""){
		alert("관리자 비번을 입력하세요!!");
		$("#admin_pwd").val("").focus();
		return false;
	}	
}
function post_search(){
	alert("우편번호 검색 버튼을 클릭하세요.");
}
/* 우편번호 검색창 */
function post_check(){
	window.open("admin_zipcode.do","우편번호주소찾기",
			"width=450, height=150");
	// 자바스크립트의 open 메서드로 팝업창 띄우기
}
/* 정보 수정 체크 */
function edit_check(){	
	if($.trim($("#member_pass").val())==""){
		alert("비밀번호를 입력하세요!");
		$("#member_pass").val("").focus();
		return false;
	}
	if($.trim($("#member_pass2").val())==""){
		alert("비밀번호확인을 입력하세요!");
		$("#member_pass2").val("").focus();
		return false;
	}
	if($.trim($("#member_pass").val()) 
			!= $.trim($("#member_pass2").val())){
		alert("비밀번호가 일치하지 않습니다!");
		$("#member_pass").val("");//비번 입력창 초기화
		$("#member_pass2").val("");
		$("#member_pass").focus();//비번입력창으로 초기화
		return false;
	}
	if($.trim($("#member_name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#member_name").val("").focus();
		return false;
	}
	if($.trim($("#member_nickname").val())==""){
		alert("회원닉네임을 입력하세요!");
		$("#member_nickname").val("").focus();
		return false;
	}
	if($.trim($("#member_zip1").val())==""){
		alert("우편번호를 입력하세요!");
		$("#member_zip1").val("").focus();
		return false;
	}
	if($.trim($("#member_addr1").val())==""){
		alert("주소를 입력하세요!");
		$("#member_addr1").val("").focus();
		return false;
	}
	if($.trim($("#member_addr2").val())==""){
		alert("나머지 주소를 입력하세요!");
		$("#member_addr2").val("").focus();
		return false;
	}
}





