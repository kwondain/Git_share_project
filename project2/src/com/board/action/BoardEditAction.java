package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// 게시물 수정 폼
public class BoardEditAction implements Action {
	/*
	 * 1. 게시물 내용보기에서 게시물 번호 받음(get)
	 * 2. 수정 폼 화면 구성
	 */

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 게시물 번호 받기
		int no= Integer.parseInt
		 		(request.getParameter("no"));
		
		// 2. dao 메서드 호출
		BoardDAO dao = new BoardDAO();
		BoardBean dto = dao.getCont(no); // 레코드 1개
		
		// 3. key 생성
		request.setAttribute("bean", dto);
		
		// 4. view page 포워딩
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/board/board_edit.jsp");
		
		return forward;
	}

}
