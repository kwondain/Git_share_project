<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta charset="UTF-8">
<title>회원정보 찾기</title>
<script src="./js/jquery-3.js"></script>

<script>
	var arr = ["TNKX9","4531FVHA","DLV4","D8T93","A2CBV"];
	var random = Math.ceil(Math.random()*4);
	
	var imgNumber = arr[random];
	
	function chk(){
		var value = document.getElementById("protect").value;
		if(value!=imgNumber){
			alert('방지문자가 틀렸습니다.');
			document.getElementById("protect").value="";
			document.getElementById("protect").focus();
			return false;
		}
	}
</script>
<!-- 
<script>
	var protect = document.getElementById("protect");
	function chk(){
		if(protect.value() != imgNumber ){
			alert('방지문자가 틀렸습니다');
			protect.value()="";
			protect.focus();
			return false;
		}
		return true;
	}
</script>     -->
<link href="css/bootstrap.css " rel="stylesheet" type="text/css">
<style>
	th{
		width:20%;
	}
</style>
</head>
<div id=wrapper>
		<header>
		<div class="title">
			<a href="./main.jsp"><img src="images/lovingpet.png"></a>
		</div>
		<div class="loginmenu">
 			<jsp:include page="/member/member_login.jsp" />
		</div>
		</header>
		<nav class="mainmenu">
		<ul>
			<li><a href="#">펫시터 지원하기</a>
				<ul>
					<li><a href="#">펫시터란</a></li>
					<li><a href="#">펫시터 지원하기</a></li>
				</ul></li>
			<li><a href="#">펫 맡기기</a></li>
			<li><a href="#">공지사항&#38;게시판</a>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="./board_list.do">자유게시판</a></li>
				</ul></li>
			<li><a href="#">내 페이지</a>
				<ul>
					<li><a href="member_edit.do">회원정보 수정</a></li>
					<li><a href="#">내가 찜한 펫시터 리스트</a></li>
				</ul></li>
		</ul>
		</nav>
<body>
    <div id="wrap">
        <div id="header">
            <h2>회원정보 찾기</h2>
        </div>
        <section>
        <input type="radio" name="finder" id="id_check" class="id_check" checked>
        <input type="radio" name="finder" id="password_check" class="password_check">
            <article class="titleArticle">
                <label for="id_check" class="top" id="clon_id">아이디 찾기</label><label for="password_check" class="top" id="clon_pwd">비밀번호 찾기</label>
            </article>
            <article>
                <div class="text">
                <div class="text1">
                <img src="./images/protect.png">
                </div>
                <div class="text2">
                <b>개인회원의 아이디, 비밀번호 찾기입니다.</b>
                <p>회원정보 확인 후 반드시 비밀번호를 변경하여주세요.</p>
                <p>회원정보가 잘못 입력할 경우 다른 정보가 확인될수있습니다.</p>
                <p>아이디찾기와 비밀번호찾기를 선택하여 원하는 정보를 찾을 수 있습니다.</p>
                </div>
                </div>
            </article>
            <div class="clear"></div>
            <div class="main">
            	<p>회원정보 인증</p>
            <ul>
                <li>
                    <div class="id_finder">
                    <form action="id_finde.do">
                        <table class="table">
                            <tr>
                                <th class="name">이름</th>
                                <td><input type="text" name="id_name" id="id_name"class="form-control"></td>
                            </tr>
                            <tr>
                                <th>이메일주소</th>
                                <td><input type="text" name="email" id="email"class="form-control"></td>
                            </tr>
                        </table>
                        <div class="button"style="text-align: center;">
                        <input type="submit" value="아이디찾기"class="btn">
                        </div>
                        </form>
                    </div>
                </li>
                <li>
                    <div class="password_finder">
                    <form method="post" action="password_find.do" name="pass" onsubmit="return chk()">
                        <table class="table">
                            <tr>
                                <th class="id">아이디</th>
                                <td><input type="text" name="password_id" id="password_id"class="form-control"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" name="password_name" id="password_name"class="form-control"></td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td><input type="date" name="password_birth" id="password_birth"class="form-control"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="text" name="password_email" id="password_email"class="form-control"></td>
                            </tr>
                            <tr>
                            	<th>방지문자</th>
                            	<td>
                            	<script>
                            	document.write("<img src=./images/"+imgNumber+".jpg>");
                            	</script>
                            	<input type="text" id="protect"  name="protect" class="form-control"><p>이미지를 보이는 대로 입력해주세요.</p>
                            	</td>
                            </tr>
                        </table>
                        <div class="button"style="text-align: center;">
                        <input type="submit" value="비밀번호찾기"class="btn">
                        </div>
                        </form>
                    </div>
                </li>
            </ul>
            </div>
        </section>
    </div>
<link rel="stylesheet" type="text/css" href="./css/member_find.css">  
</body>
</html>