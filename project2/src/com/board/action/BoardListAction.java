package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// 게시판의 목록 액션 클래스
public class BoardListAction implements Action {
	/*
	 * 액션 클래스=컨트롤러 역할
	 *  1. view page의 요청 받는다.
	 *  2. 요청에 맞게 dao 메서드 호출
	 *  3. dao 리턴 값을 받아서 view page 포워딩
	 */

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. dao 객체 생성
		BoardDAO dao = new BoardDAO();
		// 2. 메서드 호출, 전체 목록 리턴
		List<BoardBean> list = dao.getBoardList();
		// 3. key값 생성
		request.setAttribute("LIST", list);		
		// 4. view page 포워딩
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);// *.jsp
		forward.setPath("/board/board_list.jsp");
		
		return forward; // 실제 포워딩
	}

}
