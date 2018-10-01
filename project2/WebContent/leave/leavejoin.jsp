<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<style>
	body{
		background-color: #BDBDBD;
		width:100%;
		border-spacing: 0px;
		margin:0;
		padding:0;
	}
	.background{
		width:100%;
		background-color:#5CD1E5;
		height: 300px;
	}
	#body{
		border: 1px solid #ccc;
		border-radius: 10px;
		background-color: #fff;
		width: 50%;
		margin: -100px auto;
	}
	.inline{
		width : 90%;
		margin: 0 auto;
	}
	.red{
		color: red;
		font-size:17px;
	}
	a{
		color: inherit;
	}
	a:hover{
		cursor: pointer;
		color: #00D8FF;
	}
	input[type="text"]{
		border: none;
		border-bottom: 1px solid #ccc;
		padding: 10px;
		transition: all 0.3s;
	}
	input[type="text"]:focus{
		border-bottom: 1px solid #000;
	}
	input[type="submit"]{
		border-radius: 5px;
		border-color: #48CAE1;
		padding: 5px;
		background-color: #48CAE1;
		font-size: 15px;
		margin-top:10px;
		margin-bottom: 20px;
		color:white;
	}
	input[type="submit"]:hover{
		cursor: pointer;
		background-color: #1294AB;
		border-color: #1294AB;
	}
</style>
</head>
<body>
	<div class="background">
	</div>
	<div id="body">
		<div class="inline">
			<h1>러빙펫 펫시터 지원서</h1>
			<br>
			<p> 해당 문서는 펫시터의 집에서 강아지를 맡기는 '위탁펫시터 모집'을 위한 지원서입니다.<br>
			이에 따라 함께 거주하는 가족, 동거인의 동의가 반드시 필요합니다. 반드시 확인해주세요.<br>
			러빙펫 전문펫시터 교육을 모두 이수 하신 분들은 (위탁)펫시터로 즉시 활동이 가능합니다. :)</p>
			<br><br>
			
			<p class="red">*회원가입 하셨나요?</p>
			<p>아직 회원가입을 안하셨다면 지원서를 작성하기 전에 회원가입을 꼭 진행해주세요!</p>
			<b><a href="./member_Join.do">회원가입</a></b>
			<br><br>
			
			<form action="leavejoin_Action.do" method="post" enctype="multipart/form-data">
			
			<h3>지원자 아이디</h3>
			<input type="text" name="id" size="40">
			
			<h3>지원자 성명</h3>
			<input type="text" name="name" size="40">
			
			<h3>생년월일이 어떻게 되시나요? <span class="red">*25세 부터 지원이 가능합니다.</span></h3>
			<input type="text" name="birth" size="40">
			
			<h3>연락처를 알려주세요</h3>
			<input type="text" name="tel" size="40">
			
			<h3>지원자 거주 지역(ex.서울시 강남구 역삼동)</h3>
			<input type="text" name="address" size="40">
			
			<h3>게시판에 등록될 제목을 입력해주세요</h3>
			<input type="text" name="title" size="40">
			
			<h3>돌봄 가능한 반려동물 크기를 선택해주세요</h3>
			<input type="radio" name="size" value="소형견">소형견
			<input type="radio" name="size" value="중형견">중형견
			<input type="radio" name="size" value="대형견">대형견
			
			<h3>돌봄 가능한 반려동물 나이를 선택해주세요</h3>
			<input type="radio" name="age" value="강아지">강아지
			<input type="radio" name="age" value="중견">중견
			<input type="radio" name="age" value="노견">노견
			
			<h3>해당하는 사항을 선택해주세요(다중선택 가능)</h3>
			<input type="checkbox" name="option" value="아파트">아파트
			<input type="checkbox" name="option" value="마당">마당
			<input type="checkbox" name="option" value="노령견케어">노령견케어
			<input type="checkbox" name="option" value="자격증보유">자격증보유<br>
			<input type="checkbox" name="option" value="실외배변">실외배변
			<input type="checkbox" name="option" value="픽업가능">픽업가능
			<input type="checkbox" name="option" value="수제간식">수제간식
			<input type="checkbox" name="option" value="반려견없는곳">반려견 없는 곳
			<input type="checkbox" name="option" value="응급처치">응급처치<br>
			<input type="checkbox" name="option" value="투약가능">투약가능
			<input type="checkbox" name="option" value="대형견">대형견
			
			<h3>돌봄할 장소 사진 첨부 바랍니다.</h3>
			<input type="file" name="file">
			<br><br>
			
			<center>
			<input type="submit" value="펫시터 신청">
			</center>
			
			</form>
		</div>
	</div>
	
</body>
</html>