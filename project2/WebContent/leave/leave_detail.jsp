<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<link href="css/main_css.css" rel="stylesheet" type="text/css">
<!-- ver1은 css 수정이 웹 사이트에 반영이 안되었을 때를 대비해 작성 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="./js/jquery-3.js"></script>
<!-- jQuery 자바스크립트 라이브러리 외부 파일을 읽어온다 -->
<style>
	#body{
		padding-top:20px;
		margin:0 auto;
		width:80%;
		margin: 0 auto;
	}
	.left{
		margin: 0 auto;
		float: left;
		width: 55%;
	}
	.image img{
		width:100%;
	}
	.explain{
		text-align: center;
		margin: 0 auto;
		float: right;
		width: 40%;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.explain_inline{
		margin: 0 auto;
		width:90%;
		maring: 5px;
	}
	input[type="date"]{
		border:none;
		font-size: 18px;
		text-align: center;
	}
	.explain2{
		margin: 10px auto;
		float:right;
		width: 40%;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.explain2 span:last-child {
		display: none;
	}
	.explain3{
		margin: 10px auto;
		float:right;
		width: 40%;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.explain3_1{
		width:50%;
		float:left;
	}
	.explain3_1{
		width:50%;
		float:right;
	}
	.explain4{
		float: left;
		width: 55%;
		margin: 0 auto;
		border-radius: 5px;
		border: 1px solid #ccc;
	}
	.date{
		border: 2px solid #A6A6A6;
		border-radius: 5px;
		padding: 5px 30px;
	}
	.base{
		color: orange;
		font-size: 2em;
		font-weight: bold;
	}
	.base_size{
		border:2px solid #ccc;
		border-radius: 5px;
		padding: 8px;
		margin-left: 10px;
		font-size: 15px;
		font-weight: bold;
	}
	.explain_title{
		font-weight: bold;
		font-size: 20px;
	}
	.add{
		font-size: 13px;
	}
	.add_price{
		margin-left: 5px;
		color:#FFBB00;
		font-weight: bold;
		font-size: 20px;
	}
	table{
		width:100%;
		border-bottom: 1px solid #ccc;
	}
	tr{
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	table tr th{
		text-align: left;
	}
	table tr td{
		text-align: right;
	}
	th,td{
		border-top: 1px solid #ccc;
	}
	.Reservation{
		border:none;
		background:#48CAE1;
		padding: 15px 60px;
		border-radius: 5px;
		font-size: 20px;
		font-weight: bold;
		color: white;
		margin: 5px 0px;
	}
</style>
<script type="text/javascript">
	function mul(){
		if(document.getElementById("number").value != 0){
			document.getElementById("number").value--;
			document.getElementById("add2").value = document.getElementById("number").value * 25000;
			document.getElementById("add2").innerHTML = document.getElementById("add2").value;
			document.getElementById("price").innerHTML = document.getElementById("add2").value + 33000;
		}
	}
	function add(){
		if(document.getElementById("number").value != 5){
			document.getElementById("number").value++;
			document.getElementById("add2").value = document.getElementById("number").value * 25000;
			document.getElementById("add2").innerHTML = document.getElementById("add2").value;
			document.getElementById("price").innerHTML = document.getElementById("add2").value + 33000;
		}
	}
</script>
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
					<li><a href="#">펫시터란</a></li>
					<li><a href="#">펫시터 지원하기</a></li>
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
		
		<div id="body">
			<div class="left">
				<div class="image">
					<img src="upload/${detail.leave_file}">
				</div>
			</div>
			<div class="explain">
				<div class="explain_inline">
				<p class="explain_title">예약을 원하는 날짜를 선택해주세요.</p>
				<span class="date"><input type="date" name="startdate">><input type="date" name="enddate"></span>
				<p><span class="base">30,000원</span><span class="base_size">${detail.leave_size}</span></p>
				<p class="add">반려견 추가 당 <span class="add_price">25,000원</span></p>
				<table >
					<tr>
					<th>1박</th><td><span id="add3">30000</span>원</td>
					</tr>
					<tr>
					<th>반려견 추가<input type="button" value="-" onclick="mul()"><input type="number" min="0" max="5" id="number" value="0" readonly="readonly"><input type="button" value="+" onclick="add()"></th><td><span id="add2">0</span>원</td>
					</tr>
					<tr>
					<th>부가세</th><td><span id="add1">3000원</span></td>
					</tr>
					<tr>
					<th>총 합계</th><td><span id="price">33000</span>원</td>
					</tr>
				</table>
				<input type="button" class="Reservation" value="예약요청하기"><br>
					<c:if test="${detail.leave_id == id }">
						<input type="button" onclick="location='leave_delete.do?leave_id=${detail.leave_id}'" value="삭제하기">
						<input type="button" onclick="location='leave_edit.do?leave_id=${detail.leave_id}'" value="수정하기">
					</c:if>
				</div>
			</div>
			<div class="explain2">
				<p>${detail.leave_id}</p>
				<p>${detail.leave_address}</p>
					<c:forEach var="option" items="${detail.leave_option}">
							<span>#${option}</span>
					</c:forEach>
			</div>
			
			<div class="explain3">
				<div class="explain3_1">
				<p>돌봄가능한 강아지 크기 & 나이</p>
				<p>
					<c:if test="${detail.leave_size=='소형견'}">0~0.49kg 까지 돌봄 가능합니다.</c:if>
					<c:if test="${detail.leave_size=='중형견'}">0~14.9kg 까지 돌봄 가능합니다.</c:if>
					<c:if test="${detail.leave_size=='대형견'}">15kg이상까지 돌봄 가능합니다.</c:if>
				</p>
				</div>
				<div class="explain3_2">
					<p>체크인, 체크아웃 시간</p>
					<p>체 크 인 : 09:00 AM ~ 09:00 PM</p>
					<p>체 크 아 웃 : 09:00 AM ~ 09:00 PM</p>
				</div>
			</div>
			
			<div class="explain4">
				<p>돌봄 환경</p>
				<ul>
					<c:forEach var="option" items="${detail.leave_option}">
							${option}
					</c:forEach>
					돌봄공간		자격증보유
					픽업가능		다른 반려견 유무
					마당유무		반려견 재활 가능여부
				</ul>
			</div>
			
		</div>
		
</body>
</html>