package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// 게시물 내용 보기
public class BoardContAction implements Action {
	/*
	 * 1. 목록에서 게시물 번호 받음(get)
	 * 2. 게시물 번호를 이용하여 레코드 조회
	 * 3. 결과를 view page 포워딩
	 */

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 게시물 번호 받기
		int no= Integer.parseInt
				(request.getParameter("no"));
		// 2. 게시물 조회
		BoardDAO dao = new BoardDAO();
		dao.boardHit(no); // 조회수 증가
		BoardBean dto = dao.getCont(no); // 상세보기
		
		// 3. key 생성
		request.setAttribute("bean", dto);
		
		// 4. view page 포워딩
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/board_cont.jsp");
		return forward;
	}

}




