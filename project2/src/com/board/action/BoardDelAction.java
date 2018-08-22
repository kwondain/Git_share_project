package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// 게시물 삭제 폼
public class BoardDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int no = Integer.parseInt
				(request.getParameter("no"));
		/* dao 메서드 호출 */
		BoardDAO dao = new BoardDAO();
		// 삭제 레코드 가져오기
		BoardBean bean = dao.getCont(no);
		// key 생성
		request.setAttribute("bean", bean);
		// view page 포워딩
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/board/board_del.jsp");
		
		return forward;
	}

}
