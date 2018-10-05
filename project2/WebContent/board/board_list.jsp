<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.board.model.*"%>
<%@ page import="java.util.*"%>
<link href="css/main_css.css?ver=1" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫시터 매칭 서비스, Loving Pet</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
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
	<div id="article" style="text-align: center;">
		<h1>자유게시판</h1>
		<div id="article_c">
			<%
				List<BoardBean> boardList = (List<BoardBean>) request.getAttribute("LIST");
				// 게시판의 목록을 가져온다.
				// getBoardList()메소드는 BoardDAO 클래스에 목록을 가져올 수 있는 내용을 메소드를 작성한다.
			%>
			<div id="board_wrap">
			<div style="margin-left: 55%">전체글(<%=boardList.size() %>)</div>
				<table class="table table-hover"
					style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
					<tr style="background-color: transparent;">
						<th width="10%" style="text-align: center;">글번호</th>
						<th width="50%" style="text-align: center;">제목</th>
						<th width="10%" style="text-align: center;">글쓴이</th>
						<th width="20%" style="text-align: center;">등록날짜</th>
						<th width="10%" style="text-align: center;">조회수</th>
					</tr>
					<%
						if ((boardList != null) && (boardList.size() > 0)) {
							// 게시판의 목록이 1개 이상 존재하는 경우 조건은 참이 된다.
							for (int i = 0; i < boardList.size(); i++) {
								BoardBean board = boardList.get(i);
								// 컬렉션 요소값을 BoardBean 타입으로 가져온다.
					%>
					<tr style="text-align: center;">
						<!-- 게시판 번호 표시 -->
						<td align="center"><%=board.getBoard_no()%></td>
						<td>
							<!-- 게시물 제목을 클릭하면 해당 게시물의 내용을 볼 수 있도록
               '*.do?no=글번호' 형태의 get 방식으로 글번호를 넘긴다. --> <a
							href="board_cont.do?no=<%=board.getBoard_no()%>"
							onfocus="this.blur()"> <%=board.getBoard_title()%></a>
						</td>

						<td>&nbsp;<%=board.getBoard_name()%>&nbsp;
						</td>
						<td>&nbsp; <%=board.getBoard_regdate().substring(0, 10)%>&nbsp;
						</td>
						<!-- substring(0,10)은 등록날짜에서 앞자리 10개만 추출(날짜부분)-->
						<td align="center"><%=board.getBoard_hit()%></td>
					</tr>
					<%
						} // for end
						} else {
					%>
					<tr>
						<td colspan="5">게시물 목록이 없습니다.</td>
					</tr>
					<%
						}
					%>
					<tr style="background-color: transparent;">
					<td><div>
							<input type="button" value="글쓰기"
								onclick="location='board_write.do'" class="btn" />
						</div></td>
					<td colspan="4"></td>
						</tr>
					
				</table>
				<!-- [글쓰기] 버튼을 클릭하면 board_write.jsp 파일로 이동된다. -->
				<script>
					function find_check() {
						if ($.trim($("#find_name").val()) == "") {
							alert("검색어를 입력하세요.");
							$("#find_name").val("").focus();
							return false;
						}
					}
				</script>
				<div id="board_find" class="from-group" >
					<form method="get" action="board_find_ok.do"
						onsubmit="return find_check()">
						<table style="margin-left: auto;margin-right: auto;">
							<tr>
								<td><select name="find_field" class="form-control">
										<option value="board_title">제목</option>
										<option value="board_cont">내용</option>
								</select></td>
								<td><input name="find_name" id="find_name" size="14"
									class="form-control" /></td>
								<td><input type="submit" value="검색" class="btn" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>

		<footer style=" position:absolute;bottom:0;width:100%;height:70px;">
			<div>
				<p>Copyright @ 2018 2조 프로젝트 All rights reserved. Code Is Content
					by 2조 License Powered by Choongang</p>
				<p>2조: 권다인, 신성수, 유원모, 이한유, 김경범</p>
			</div>
		</footer>