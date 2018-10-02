<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>����� ��Ī ����, Loving Pet</title>
<link href="css/main_css.css" rel="stylesheet" type="text/css">
<!-- ver1�� css ������ �� ����Ʈ�� �ݿ��� �ȵǾ��� ���� ����� �ۼ� -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="./js/jquery-3.js"></script>
<!-- jQuery �ڹٽ�ũ��Ʈ ���̺귯�� �ܺ� ������ �о�´� -->
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
			<a href="./member_Login.do"><input type="button" value="�α���"></a> -->
		</div>

		<nav class="mainmenu">
		<ul>
			<li><a href="#">����� �����ϱ�</a>
				<ul>
					<li><a href="#">����Ͷ�</a></li>
					<li><a href="#">����� �����ϱ�</a></li>
				</ul></li>
			<li><a href="./leavelist_Action.do">�� �ñ��</a></li>
			<li><a href="#">��������&#38;�Խ���</a>
				<ul>
					<li><a href="gongji_list.do">��������</a></li>
					<li><a href="./board_list.do">�����Խ���</a></li>
				</ul></li>
			<li><a href="#">�� ������</a>
				<ul>
					<li><a href="member_edit.do">ȸ������ ����</a></li>
					<li><a href="#">���� ���� ����� ����Ʈ</a></li>
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
				<p class="explain_title">������ ���ϴ� ��¥�� �������ּ���.</p>
				<span class="date"><input type="date" name="startdate" id="startdate"  required>><input type="date" name="enddate" id="enddate" required></span>
				<p><span class="base">30,000��</span><span class="base_size">${detail.leave_size}</span></p>
				<p class="add">�ݷ��� �߰� �� <span class="add_price">25,000��</span></p>
				<table >
					<tr>
					<th>1��</th><td><span id="add3">30000</span>��</td>
					</tr>
					<tr>
					<th>�ݷ��� �߰�<input type="button" value="-" onclick="mul()"><input type="number" min="0" max="5" id="number" name="number" value="0" readonly="readonly"><input type="button" value="+" onclick="add()"></th><td><span id="add2">0</span>��</td>
					</tr>
					<tr>
					<th>�ΰ���</th><td><span id="add1">3000��</span></td>
					</tr>
					<tr>
					<th>�� �հ�</th><td><span id="price">33000</span>��</td>
					</tr>
				</table>
					<input type="submit" class="Reservation" value="�����û�ϱ�"><br>
				</form>
					<c:if test="${detail.leave_id == id }">
						<input type="button" onclick="location='leave_delete.do?leave_id=${detail.leave_id}'" value="�����ϱ�">
						<input type="button" onclick="location='leave_edit.do?leave_id=${detail.leave_id}'" value="�����ϱ�">
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
				<p>���������� ������ ũ��</p>
				<p class="black1">
					<c:if test="${detail.leave_size=='������'}">0.49kg ���� ���� �����մϴ�.</c:if>
					<c:if test="${detail.leave_size=='������'}">14.9kg ���� ���� �����մϴ�.</c:if>
					<c:if test="${detail.leave_size=='������'}">15kg�̻���� ���� �����մϴ�.</c:if>
				</p>
				</div>
				<div class="explain3_2">
					<p>üũ��, üũ�ƿ� �ð�</p>
					<p>üũ�� : <span class="black1">09:00 AM ~ 09:00 PM</span></p>
					<p>üũ�ƿ� : <span class="black1">09:00 AM ~ 09:00 PM</span></p>
				</div>
			</div>
			
			<div class="explain4">
				<p class="black">���� ȯ��</p>
				<table class="option2">
					<c:set var="num1" value="0"></c:set>
					<c:set var="num2" value="0"></c:set>
					<c:set var="num3" value="0"></c:set>
					<c:set var="num4" value="0"></c:set>
					<c:set var="num5" value="0"></c:set>
					<c:set var="num6" value="0"></c:set>
					
					<c:forEach var="option" items="${detail.leave_option}">
						<c:if test="${option=='����Ʈ'}"><c:set var="num1" value="1"></c:set></c:if>
						<c:if test="${option==' ����'}"><c:set var="num2" value="1"></c:set></c:if>
						<c:if test="${option==' �Ⱦ�����'}"><c:set var="num3" value="1"></c:set></c:if>
						<c:if test="${option==' �ڰ�������'}"><c:set var="num4" value="1"></c:set></c:if>
						<c:if test="${option==' �ݷ��߾��°�'}"><c:set var="num5" value="1"></c:set></c:if>
						<c:if test="${option==' ���డ��'}"><c:set var="num6" value="1"></c:set></c:if>
						<c:if test="${option==' ����óġ'}"><c:set var="num6" value="1"></c:set></c:if>
					</c:forEach>
					<tr>
						<td class="back">��������:<span class="right"><c:choose><c:when test="${num1 eq '1'}">����Ʈ</c:when><c:otherwise>�ܵ�����</c:otherwise></c:choose></span></td><td class="back">�ڰ�������:<span class="right"><c:choose><c:when test="${num4 eq '1'}">������</c:when><c:otherwise>������������</c:otherwise></c:choose></span></td>
					</tr>
					<tr>
						<td>�Ⱦ�����:<span class="right"><c:choose><c:when test="${num3 eq '1'}">�Ⱦ�����</c:when><c:otherwise>�Ⱦ��Ұ���</c:otherwise></c:choose></span></td><td>�ٸ� �ݷ��� ����:<span class="right"><c:choose><c:when test="${num5 eq '1'}">�ݷ��� ����</c:when><c:otherwise>�ݷ��� ����</c:otherwise></c:choose></span></td>
					</tr>
					<tr>
						<td class="back">��������:<span class="right"><c:choose><c:when test="${num2 eq '1'}">���纸��</c:when><c:otherwise>�̺���</c:otherwise></c:choose></span></td><td class="back">�ݷ��� ��Ȱ ���ɿ���:<span class="right"><c:choose><c:when test="${num6 eq '1'}">����</c:when><c:otherwise>�Ұ���</c:otherwise></c:choose></span></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear"></div>
		<br>
		<footer>
		<div>
			<p>Copyright �� 2018 2�� ������Ʈ All rights reserved. Code Is Content
				by 2�� License Powered by Choongang</p>
			<p>2��: �Ǵ���, �ż���, ������, ������, ����</p>
		</div>
		</footer>
</body>
</html>