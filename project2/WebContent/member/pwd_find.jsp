<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 찾기</title>
<style>
	body{
		margin: 0px;
	}
    #wrap{
        width: 600px;
        margin: 0 auto;
    }
    #header{
        margin:0px;
        width:100%;
        text-align: center;
        background: #ddd;
        height:auto;
    }
    #header h2{
        margin :0;
        padding: 10px; 
    }
    
    .title{
        width:100%;
        padding-top: 20px;
        margin-top:20px;
        margin-bottom:20px;
        text-align: center;
    }
    .top{
        padding:10px 16%;
        border: 1px solid #ddd;
        border-spacing: 0px;
        background:#ddd;
        border-bottom: 1px solid #000;
    }
    p {
        margin:0;
        padding:0;
        float: left;
    }
    .text{
        width:100%;
        margin-bottom: 10px;
        height:75px;
    }
    .text1{
        width:15%;
        margin:0;
        float:left;
    }
    .text2{
        float:left;
        width:80%;
        font-size:13px;
    }
    .text1 img{
        width:70px;
    }
    ul{
        list-style-type: none;
        padding:0;
    }
   
    table{
        width: 90%;
        margin: 0 auto;
        border-spacing: 0px;
        border-bottom: 2px solid #bbb;
        border-top: 2px solid #bbb;
    }
    th{
        width: 30%;
        background: #ccc;
        text-align: left;
        padding-left: 5%;
        padding-top:10px;
        padding-bottom:10px;
        border-bottom: 1px solid #ddd;
    }
    td{
        width: 70%;
        padding-top:10px;
        padding-bottom:10px;
        border-bottom: 1px solid #ddd;
    }
    ul li input[type="text"]{
        width: 80%;
        margin-left: 15px;
        height: 20px;
    }
    ul li input[type="date"]{
        width: 80%;
        margin-left: 15px;
        height: 20px;
    }
	input[type="submit"]{
		background: red;
		color: white;
		width: 30%;
		height: 70%;
		text-align: center;
		margin-left: 38%;
		margin-top: 3%;
	}
	.button{
		width:100%;
		height: 50px;
		margin-bottom: 3%;
	}
	.main{
		border: 1px solid #ccc;
	}
	.main p{
		padding-left: 15px;
		margin: 15px;
	}
	#password_check:checked~ .main ul li .password_finder{
		display:block;
	}
	#password_check:checked~ .main ul li .id_finder{
		display:none;
	}
	#id_check:checked~ .main ul li .password_finder{
		display:none;
	}
	#id_check:checked~ .main ul li .id_finder{
		display:block;
	}
	#id_check:checked~ .title #clon_id{
		background: #fff;
		color:black;
		border-top:1px solid #000;
		border-left:1px solid #000;
		border-right:1px solid #000;
		border-bottom: 1px solid #fff;
	}
	#password_check:checked~ .title #clon_pwd{
		background: #fff;
		color:black;
		border-top:1px solid #000;
		border-left:1px solid #000;
		border-right:1px solid #000;
		border-bottom: 1px solid #fff;
	}
	input[type="radio"]{
		display:none;
	}
	td img{
		padding-left: 20%;
		width : 50%;
		height: 70%;
	}
</style>
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

</head>
<body>
    <div id="wrap">
        <div id="header">
            <h2>회원정보 찾기</h2>
        </div>
        <section>
        <input type="radio" name="finder" id="id_check" class="id_check" checked>
        <input type="radio" name="finder" id="password_check" class="password_check">
            <article class="title">
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
                    <form action="id_finde.jsp">
                        <table>
                            <tr>
                                <th class="name">이름</th>
                                <td><input type="text" name="id_name" id="id_name"></td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td><input type="date" name="id_birth" id="id_birth"></td>
                            </tr>
                        </table>
                        <div class="button">
                        <input type="submit" value="아이디찾기">
                        </div>
                        </form>
                    </div>
                </li>
                <li>
                    <div class="password_finder">
                    <form method="post" action="password_find.jsp" name="pass" onsubmit="return chk()">
                        <table>
                            <tr>
                                <th class="id">아이디</th>
                                <td><input type="text" name="password_id" id="password_id"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" name="password_name" id="password_name"></td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td><input type="date" name="password_birth" id="password_birth"></td>
                            </tr>
                            <tr>
                                <th>이메일주소</th>
                                <td><input type="text" name="password_email" id="password_email"></td>
                            </tr>
                            <tr>
                            	<th>방지문자 인증</th>
                            	<td>
                            	<script>
                            	document.write("<img src=./images/"+imgNumber+".jpg>");
                            	</script>
                            	<input type="text" id="protect" class="protect" name="protect"><p>이미지를 보이는 대로 입력해주세요.</p>
                            	</td>
                            </tr>
                        </table>
                        <div class="button">
                        <input type="submit" value="비밀번호찾기">
                        </div>
                        </form>
                    </div>
                </li>
            </ul>
            </div>
        </section>
    </div>  
</body>
</html>

