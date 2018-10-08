<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css"> <!-- ver1은 css 수정이 웹 사이트에 반영이 안되었을 때를 대비해 작성 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<style>
article{
width: 29.17%;
height: auto;
float: left;
margin-right: 1.5625%;
margin-bottom: 20px;
margin-top: 20px;
padding: 0.5%;
border-radius: 10px;
}
article:first-child {
	margin-left: 2.083%;
}
article-h3{
padding-left: 30px;
}
article h2{
text-align: center;

}
dl {
	margin: 10px;
}
dd{
margin-bottom: 10px;
}
ul{
	margin: 10px;
list-style-type: square;

}
ul li{
margin-bottom: 10px;
}
aside {
clear: both;
width: 93.75%;
padding: 10px;
margin-left: auto;
margin-right: auto;
text-align: center;
}

footer{
position:static;
margin-left:auto;
margin-right:auto;
margin-top:1%;
bottom:0;
width:99%;
}
.button {
border: none; 
color: white; 
padding: 15px 32px; 
text-align: center; 
text-decoration: none; 
display: inline-block; 
font-size: 16px;
background: #aaa;
}

.button:hover{
background: #000000;
    -webkit-transition: background 1s;
    -moz-transition: background 1s;
    -o-transition: background 1s;
    transition: background 1s;
}
.image2{
margin-left: 20%;
margin-right: 80%;
}
.triangle {display:inline-block; width:0;; height:0; border-style:solid; border-width:20px;
}
.triangle.tri{border-color:#aaa transparent transparent transparent;
margin-left: 46%;
margin-right: 54%;
bottom: -15ox;}
.triangle.tri2{border-color:transparent transparent transparent #aaa; float: left; 
margin-top: 5%;
margin-bottom: 5%;}
.suq{
border-radius:15px;
width:20%;
height:5%;
padding: 10px;
background-color: #aaa;
margin-left: auto;
margin-right: auto;
text-align: center;

}
.suq2{
border-radius:15px 0px 0px 15px;
width:14%;
height:5%;
padding: 10px;
background-color: #aaa;
margin-left: auto;
margin-right: auto;
text-align: center;
float:left;
margin-top: 5%;
margin-bottom: 5%;
}
.tipas{
margin-left: 15%;
margin-right: 85%;
width: 100%;
}
.tipas-img{
margin-left: 25%;
margin-right: 75%;
}
.balloon {position:relative; display:inline-block;}
.balloon span {display:inline-block; padding:10px; color:#000; background:#aaa; border-radius:15px; width: 100px; text-align:center;margin-bottom: 10px; }
.balloon:after {content:''; position:absolute; width:0; height:0; border-style:solid;margin-bottom: 10px;}
.balloon.test_1:after{border-width:15px 20px; left:50%; margin-left:-20px;}
.balloon.test_1:after{border-color:#aaa transparent transparent transparent; bottom:-30px;}
.balloon2 {position:relative; display:inline-block;}
.balloon2 span {display:inline-block; padding:10px; color:#000; background:#aaa; border-radius:15px; width: 100px; text-align:center;margin-bottom: 10px; }

.sq2{
text-align: center;

}

.sq3{
text-align: left;

}


</style>
<body>
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
<aside>
<h1>Loving Pet의 펫시터가 되어주세요</h1>

<div class="tipas">
<div class="suq2">온라인서류</div>
<span class="triangle tri2"></span>
<div class="suq2">지원자면담</div>
<span class="triangle tri2"></span>
<div class="suq2">펫시터교육</div>
<span class="triangle tri2"></span>
<div class="suq2">펫시터등록</div>
<span class="triangle tri2"></span>
</div>

</aside>
<section>
<article>
<h2>지원 자격</h2>
<ul>
<li>나이 25살 이상이신 분</li>
<li>3년이상 반려동물을 키운적이 있으신분</li>
<li>반려동물을 사랑하며 사용자의 반려동물을 내 반려동물을 대하듯이 성심성의껏 맡아주실수 있으신분</li>
</ul>
<h2>우대</h2>
<ul>
<li>애완동물학과 재학자이시거나 졸업자이신분 또는 반려동물관리사 자격증등 해당업무에 연관된 교육을 받으신분</li>
<li>펫시팅업무를 한 경력이 있으시거나 지인의 반려동물을 맡아주신적이 있으신분</li>
</ul>

</article>
<article>
  <h2>Loving Pat 펫시터의 혜택</h2>
  <ul>
  <li>Loving Pat에서 제공하는 펫시터 전문교육으로 전문펫시터가 되실수 있습니다.</li>
   <li>Loving Pat의 펫시팅 중계업무로 더 안정적인 부수입을 보장해드립니다.</li>
   <li>펫시팅 업무에 필요한 물품 다수를 Loving Pet에서 무료로 제공해 드립니다.</li>
  <li>Loving Pat에서의 펫시터회원과의 교류로 펫시팅에 관한 정보등을 나누실수 있습니다.</li>
  </ul>
</article>
 <article>
   <h2>지원자 교육</h2>
   <dl class="sq2">
   <dd class=sq3>반려동물과의 친화법, 체중 나이에맞는 관리법, 응급처치법 등 실무에 알맞는 교육으로 펫시팅 전문가로 만들어드립니다.</dd>
<dd><div class="balloon test_1"><span>지원서류작성</span></div></dd>
<dd><div class="balloon test_1"><span>온라인교육</span></div></dd>
<dd><div class="balloon test_1"><span>오프라인교육</span></div></dd>
<dd><div class="balloon2"><span>테스트</span></div></dd>


   </dl>
 </article>
</section>
<aside>
<p>※저희 Loving Pet의 펫시터가 되실분은 저희 홈페이지에 회원가입을 하셔야 합니다</p>
<input type="button" value="펫시터 지원하기" class="button" onclick="location='leavejoin.do'">
</aside>
<footer>
<div>
  <p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content by 2조 License Powered by Chongang</p>
  <p>2조: 권다인, 신성수, 유원모, 이한유</p>
  </div>
</footer>
</div>
</form>
</body>
</html>