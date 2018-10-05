<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		float: right;
		width: 40%;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.explain3_1{
		width:50%;
		float:right;
		text-align: center;
	}
	.explain3_2{
		width:50%;
		float: left;
		text-align: center;
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
	.black{
		font-weight: bold;
		font-size: 20px;
	}
	.option{
		font-weight: bold;
		color:#48CAE1;
	}
	.explain2_1{
		width:90%;
		margin:0 auto;
	}
	.clear{
		clear:both;
	}
	.black1{
		font-weight: bold;
		font-size: 18px;
	}
	.option2{
		width: 90%;
		margin: 0 auto;
		margin-top: -10px;
		margin-bottom: 10px;
	}
	.option2 td{
		text-align: left;
	}
	.right{
		float:right;
		margin-right: 10px;
		font-weight: bold;
	}
	table td{
		width: 50%;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	.back{
		background-color: #ccc;
	}
	table{
		border-spacing: 0px;
	}
	.explain4 p{
		margin-left: 20px;
	}
	footer div{
	background-color: #D8D8D8;
	width: 97%;
	padding: 1.56%;
	text-align: center;
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
		
		<div id="body">
			<div class="left">
				<div class="image">
					<img src="upload/${detail.leave_file}">
				</div>
			</div>
			<div class="explain">
				<div class="explain_inline">
				<form action="reservationAction.do">
				<input type="hidden" name="leave_id" value="${detail.leave_id}">
				<p class="explain_title">예약을 원하는 날짜를 선택해주세요.</p>
				<span class="date"><input type="date" name="startdate" id="startdate"  required>><input type="date" name="enddate" id="enddate" required></span>
				<p><span class="base">30,000원</span><span class="base_size">${detail.leave_size}</span></p>
				<p class="add">반려견 추가 당 <span class="add_price">25,000원</span></p>
				<table >
					<tr>
					<th>1박</th><td><span id="add3">30000</span>원</td>
					</tr>
					<tr>
					<th>반려견 추가<input type="button" value="-" onclick="mul()"><input type="number" min="0" max="5" id="number" name="number" value="0" readonly="readonly"><input type="button" value="+" onclick="add()"></th><td><span id="add2">0</span>원</td>
					</tr>
					<tr>
					<th>부가세</th><td><span id="add1">3000원</span></td>
					</tr>
					<tr>
					<th>총 합계</th><td><span id="price">33000</span>원</td>
					</tr>
				</table>
					<input type="submit" class="Reservation" value="예약요청하기"><br>
				</form>
					<c:if test="${detail.leave_id == id }">
						<input type="button" onclick="location='./leave_delete.do?leave_id=${detail.leave_id}'" value="삭제하기">
						<input type="button" onclick="location='./leave_edit.do?leave_id=${detail.leave_id}'" value="수정하기">
					</c:if>
				</div>
			</div>
			<div class="explain2">
				<div class="explain2_1">
				<p class="black">${detail.leave_id}</p>
				<p class="black">${detail.leave_address}</p>
				<p>
					<c:forEach var="option" items="${detail.leave_option}">
							<span class="option">#${option}</span>
					</c:forEach>
				</p>
				</div>
			</div>
			<div class="clear"></div>
			<div class="explain3">
				<div class="explain3_1">
				<p>돌봄가능한 강아지 크기</p>
				<p class="black1">
					<c:if test="${detail.leave_size=='소형견'}">0.49kg 까지 돌봄 가능합니다.</c:if>
					<c:if test="${detail.leave_size=='중형견'}">14.9kg 까지 돌봄 가능합니다.</c:if>
					<c:if test="${detail.leave_size=='대형견'}">15kg이상까지 돌봄 가능합니다.</c:if>
				</p>
				</div>
				<div class="explain3_2">
					<p>체크인, 체크아웃 시간</p>
					<p>체크인 : <span class="black1">09:00 AM ~ 09:00 PM</span></p>
					<p>체크아웃 : <span class="black1">09:00 AM ~ 09:00 PM</span></p>
				</div>
			</div>
			
			<div class="explain4">
				<p class="black">돌봄 환경</p>
				<table class="option2">
					<c:set var="num1" value="0"></c:set>
					<c:set var="num2" value="0"></c:set>
					<c:set var="num3" value="0"></c:set>
					<c:set var="num4" value="0"></c:set>
					<c:set var="num5" value="0"></c:set>
					<c:set var="num6" value="0"></c:set>
					
					<c:forEach var="option" items="${detail.leave_option}">
						<c:if test="${option=='아파트'}"><c:set var="num1" value="1"></c:set></c:if>
						<c:if test="${option==' 마당'}"><c:set var="num2" value="1"></c:set></c:if>
						<c:if test="${option==' 픽업가능'}"><c:set var="num3" value="1"></c:set></c:if>
						<c:if test="${option==' 자격증보유'}"><c:set var="num4" value="1"></c:set></c:if>
						<c:if test="${option==' 반려견없는곳'}"><c:set var="num5" value="1"></c:set></c:if>
						<c:if test="${option==' 투약가능'}"><c:set var="num6" value="1"></c:set></c:if>
						<c:if test="${option==' 응급처치'}"><c:set var="num6" value="1"></c:set></c:if>
					</c:forEach>
					<tr>
						<td class="back">돌봄공간:<span class="right"><c:choose><c:when test="${num1 eq '1'}">아파트</c:when><c:otherwise>단독주택</c:otherwise></c:choose></span></td><td class="back">자격증보유:<span class="right"><c:choose><c:when test="${num4 eq '1'}">보유함</c:when><c:otherwise>보유하지않음</c:otherwise></c:choose></span></td>
					</tr>
					<tr>
						<td>픽업가능:<span class="right"><c:choose><c:when test="${num3 eq '1'}">픽업가능</c:when><c:otherwise>픽업불가능</c:otherwise></c:choose></span></td><td>다른 반려견 유무:<span class="right"><c:choose><c:when test="${num5 eq '1'}">반려견 있음</c:when><c:otherwise>반려견 없음</c:otherwise></c:choose></span></td>
					</tr>
					<tr>
						<td class="back">마당유무:<span class="right"><c:choose><c:when test="${num2 eq '1'}">마당보유</c:when><c:otherwise>미보유</c:otherwise></c:choose></span></td><td class="back">반려견 재활 가능여부:<span class="right"><c:choose><c:when test="${num6 eq '1'}">가능</c:when><c:otherwise>불가능</c:otherwise></c:choose></span></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear"></div>
		<br>
		<footer>
		<div>
			<p>Copyright ⓒ 2018 2조 프로젝트 All rights reserved. Code Is Content
				by 2조 License Powered by Choongang</p>
			<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
		</div>
		</footer>
</body>
</html>