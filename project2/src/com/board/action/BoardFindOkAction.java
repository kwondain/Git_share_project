package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// 게시물 검색 - find_field, find_name
public class BoardFindOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String find_field = 
				request.getParameter("find_field");
		String find_name = 
				request.getParameter("find_name");
		/* dao 메서드 호출 */
		BoardDAO dao = new BoardDAO();
		List<BoardBean> list = 
				dao.findBoard(find_name, find_field);
		/* key 저장 */
		request.setAttribute("LIST", list);
		
		/* view page forwarding */
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/board/board_find.jsp");
		
		return forward;
	}

}
