<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<!-- ver1은 css 수정이 웹 사이트에 반영이 안되었을 때를 대비해 작성 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="./js/jquery-3.js"></script>
<!-- jQuery 자바스크립트 라이브러리 외부 파일을 읽어온다 -->
<style>
	*{
		list-style: none;
	}
	#body{
		padding-top:20px;
		margin:0 auto;
		width:80%;
	}
	.menu{
		width:100%;
		border:1px solid #ccc;
		border-radius: 10px;
	}
	.inmenu{
		margin-left:10%;
	}
	.location{
		width:100%;
		height:auto;
	}
	.clear{
		clear:both;
	}
	.location ul li{
		float:left;
		padding: 5px 50px 5px 50px;
		border: 1px solid #ccc;
	}
	.location ul li:hover{
		background-color: #ccc;
		cursor: pointer;
	}
	.setting{
		width:100%;
	}
	.setting ul li ul{
		float:left;
	}
	.setting ul li{
		padding: 5px;
	}
	.search{
		border-color: #48CAE1;
		border-radius: 5px;
		color:white;
		background-color: #48CAE1;
		padding: 5px 28px;
		font-size: 1em;
	}
	.search:hover{
		background-color: #1294AB;
		border-color: #1294AB;
	}
	.menu3 ul li ul li{
		float:left;
		border: 1px solid #ccc;
		border-radius: 3px;
		padding: 5px;
		margin: 15px 3px;
	}
	.menu3 ul li ul li:hover{
		cursor: pointer;
		color:white;
		background-color: #48CAE1;
	}
	select{
		border-radius: 3px;
		padding: 5px;
		font-size: 13px;
	}
	label{
		cursor: pointer;
	}
	input[type="checkbox"]{
		display: none;
	}
	#option1:checked~ li .option>li:nth-child(1){
		color:white;
		background-color: #48CAE1;
	}
	#option2:checked~ li .option>li:nth-child(2){
		color:white;
		background-color: #48CAE1;
	}
	#option3:checked~ li .option>li:nth-child(3){
		color:white;
		background-color: #48CAE1;
	}
	#option4:checked~ li .option>li:nth-child(4){
		color:white;
		background-color: #48CAE1;
	}
	#option5:checked~ li .option>li:nth-child(5){
		color:white;
		background-color: #48CAE1;
	}
	#option6:checked~ li .option>li:nth-child(6){
		color:white;
		background-color: #48CAE1;
	}
	#option7:checked~ li .option>li:nth-child(7){
		color:white;
		background-color: #48CAE1;
	}
	#option8:checked~ li .option>li:nth-child(8){
		color:white;
		background-color: #48CAE1;
	}
	#option9:checked~ li .option>li:nth-child(9){
		color:white;
		background-color: #48CAE1;
	}
	#option10:checked~ li .option>li:nth-child(10){
		color:white;
		background-color: #48CAE1;
	}
	#option11:checked~ li .option>li:nth-child(11){
		color:white;
		background-color: #48CAE1;
	}
	#option12:checked~ li .option>li:nth-child(12){
		color:white;
		background-color: #48CAE1;
	}
	.join{
		float:right;
		color:#FFBB00;
	}
	.join:hover{
		color:#48CAE1;
	}
	a{
		color: inherit;
	}
	.list{
		width:100%;
		border: 1px solid #ccc;
		position:relative;
	}
	.file{
		width: 40%;
		float:left;
	}
	.explain{
		width:60%;
		float:left;
	}
	.location1{
		position:absolute;
		background-color: rgba(53,53,53,0.5);
		color:white;
		font-size: 18px;
		padding:3px;
		z-index:99;
	}
	.explain_in{
		width:90%;
		margin:0 auto;
		
	}
	.explain_in ul li div{
 		border: 1px solid #48CAE1;
 		border-radius: 3px; 
 		float:left;
		color: #48CAE1;
		padding: 5px 10px;
		margin:5px;
	}
	.explain_in ul li:last-child{
		display: none;
	}
	.empty_list{
		width:100%;
		border: 1px solid #ccc;
		height: 400px;
	}
	.empty_list p{
		font-size: 30px;
		vertical-align: center;
	}
	.file img{
		width:100%;
	}
	.big{
		font-size:40px;
		color: red;
	}
	.list:hover{
		border: 2px solid #FFBB00;
		cursor: pointer;
	}
	table th{
		text-align: left;
		padding-right: 20px;
	}
	table td{
		font-weight: bold;
		font-size: 20px;
	}
	.black{
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 10px;
	}
</style>
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
	<div class="menu">
		<div class="inmenu">
		<div class="location">
			<ul>
				<a href="#"><li>전체</li></a>
				<a href="#"><li>서울</li></a>
				<a href="#"><li>경기</li></a>
				<a href="#"><li>인천</li></a>
				<a href="#"><li>부산</li></a>
				<a href="#"><li>광주</li></a>
				<a href="#"><li>대구</li></a>
				<a href="#"><li>강원</li></a>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="setting">
			<ul>
				<li>
					<ul>
						<li>서비스</li>
						<li>
							<select name="service">
								<option value="" selected disabled hidden>서비스 선택</option>
								<option value="24시 돌봄">24시 돌봄</option>
								<option value="데이케어">데이케어</option>
							</select>
						</li>
					</ul>
					<div class="setting_date">
					<ul>
						<li>예약일을 알려주세요!</li>
						<li><input type="date" name="startdate" min="2018-09-19">~<input type="date" name="endtdate" min="2018-09-19"></li>
					</ul>
					</div>
					<div class="setting_age">
					<ul>
						<li>반려견 나이</li>
						<li>
							<select name="age">
								<option value="" selected disabled hidden>반려견 나이</option>
								<option value="강아지">강아지(1살 이후)</option>
								<option value="성견">성견(2~6살)</option>
								<option value="노령견(7살이후)">노령견(7살 이후)</option>
							</select>
						</li>
					</ul>
					</div>
					<div class="setting_size">
					<ul>
						<li>반려견 크기</li>
						<li>
							<select name="size">
								<option value="" selected disabled hidden>반려견 크기</option>
								<option value="소형견">소형견(0~4.9kg)</option>
								<option value="중형견">중형견(5~14.9kg)</option>
								<option value="대형견">대형견(15kg 이상)</option>
							</select>
						</li>
					</ul>
					</div>
				</li>
				<li>
					<ul>
						<li></li>
						<li><input type="submit" class="search" value="찾기"></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="menu3">
			<ul>
				<li>원하는 태그 모두를 선택해주세요</li>
				<input type="checkbox" name="option" id="option1" value="아파트">
				<input type="checkbox" name="option" id="option2" value="마당">
				<input type="checkbox" name="option" id="option3" value="노령견케어">
				<input type="checkbox" name="option" id="option4" value="환자견케어">
				<input type="checkbox" name="option" id="option5" value="자격증보유">
				<input type="checkbox" name="option" id="option6" value="실외배변">
				<input type="checkbox" name="option" id="option7" value="픽업가능">
				<input type="checkbox" name="option" id="option8" value="수제간식">
				<input type="checkbox" name="option" id="option9" value="반려견없는곳">
				<input type="checkbox" name="option" id="option10" value="응급처치">
				<input type="checkbox" name="option" id="option11" value="투약가능">
				<input type="checkbox" name="option" id="option12" value="대형견">
				<li>
					<ul class="option">
						<li><label for="option1">아파트</label></li>
						<li><label for="option2">마당</label></li>
						<li><label for="option3">노령견케어</label></li>
						<li><label for="option4">환자견케어</label></li>
						<li><label for="option5">자격증보유</label></li>
						<li><label for="option6">실외배변</label></li>
						<li><label for="option7">픽업가능</label></li>
						<li><label for="option8">수제간식</label></li>
						<li><label for="option9">반려견 없는 곳</label></li>
						<li><label for="option10">응급처치</label></li>
						<li><label for="option11">투약가능</label></li>
						<li><label for="option12">대형견</label></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		</div>
		</div>
		<a href="leavejoin.do" class="join"><p>펫시터에 등록하시겠습니까?</p></a>
		<div class="clear"></div>
		<hr>
		<br>
		
		
		<c:if test="${not empty list}">
			<c:forEach var="list" items="${list}">
			<a href="leave_detail.do?leave_id=${list.leave_id}">
		<div class="list">
			<div class="file"><img src="upload/${list.leave_file}"></div>
			<div class="explain">
				<div class="explain_in">
					<h2>${list.leave_title}</h2>
					<b>${list.leave_id }</b>
					<hr>
					<ul>
						<c:forEach var="option" items="${list.leave_option}">
							<li><div>${option}</div></li>
						</c:forEach>
					</ul>
					<div class="clear"></div>
					<br>
					<table>
						<tr>
							<th>펫시터 이름:</th><td><span class="black">${list.leave_name}</span></td>
						</tr>
						<tr>
							<th>주소:</th><td> <span class="address">${list.leave_address}</span></td>
						</tr>
						<tr>	
							<th>펫시터 전화번호:</th><td><span class="tel">${list.leave_tel}</span></td>
						</tr>
					</table>
					<p>펫시터는 반려동물이 <span class="black">${list.leave_size}</span>, <span class="black">${list.leave_age }</span>이길 원합니다.</p>
					<p align="right">day care/<b class="big">20,000</b> 1박/<b class="big">30,000</b></p>
				</div>
			</div>
			<div class="location1">${list.leave_address}</div>
			<div class="clear"></div>
			</div>
			</a>
		<div class="clear"></div>
		<br>
		</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<div class="empty_list">
				<P align="center">검색 결과가 없습니다.</P>
			</div>
		</c:if>
		<footer>
		<div>
			<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
				by 2조 License Powered by Choongang</p>
			<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
		</div>
		</footer>
</div>
</body>
</html>