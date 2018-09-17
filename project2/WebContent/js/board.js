/* board_write.jsp 와   board_edit.jsp*/

function board_check(){
	if($.trim($("#board_name").val())==""){
		alert("글쓴이를 입력하세요.");
		$("#board_name").val("").focus();
		return false;
	}
	if($.trim($("#board_title").val())==""){
		alert("글 제목을 입력하세요.");
		$("#board_title").val("").focus();
		return false;
	}
	if($.trim($("#board_cont").val())==""){
		alert("글 내용을 입력하세요.");
		$("#board_cont").val("").focus();
		return false;
	}
	if($.trim($("#board_pwd").val())==""){
		alert("비밀번호를 입력하세요.");
		$("#board_pwd").val("").focus();
		return false;
	}
	
}


