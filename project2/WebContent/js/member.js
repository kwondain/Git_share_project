/*member_join.js*/
  /* 기본 회원정보 체크 */
	  function mem_check(){
	  	if($.trim($("#member_id").val())==""){
	  		alert("회원아이디를 입력하세요!");
	  		$("#member_id").val("").focus();
	  		return false;
	  	}
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
	  	if($('input:radio[name=member_gender]').is(':checked')==false){
	  		alert("성별을 입력하세요!");
	  		return false;
	  	}
	  	if($.trim($("#member_email").val())==""){
	  		alert("이메일을 입력하세요!");
	  		$("#member_email").val("").focus();
	  		return false;
	  	}
	  	if($.trim($("#member_zip").val())==""){
	  		alert("우편번호를 입력하세요!");
	  		$("#member_zip").val("").focus();
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
  	if($('input:radio[name=member_gender]').is(':checked')==false){
  		alert("성별을 입력하세요!");
  		return false;
  	}
  	if($.trim($("#member_email").val())==""){
  		alert("이메일을 입력하세요!");
  		$("#member_email").val("").focus();
  		return false;
  	}
  	if($.trim($("#member_zip").val())==""){
  		alert("우편번호를 입력하세요!");
  		$("#member_zip").val("").focus();
  		return false;
  	}
 /* if($("#member_gender").radioButtondelivery.setChecked(false)){
		alert("성별을 입력하세요!");
		return false;	
	}*/
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