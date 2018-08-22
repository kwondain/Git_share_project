package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// db에 게시물 저장
public class BoardWriteOkAction implements Action {
	/*
	 * 1. view page의 파라미터 받음
	 * 2. dao의 메서드 호출 -> 저장
	 * 3. 결과를 리턴 받아서 -> view page 포워딩
	 */

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 파라미터 받기		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String board_name=request.getParameter("board_name");
		String board_title=request.getParameter("board_title");
		String board_cont=request.getParameter("board_cont");
		String board_pwd=request.getParameter("board_pwd");
		
		// 2. DTO 객체를 생성
		BoardBean dto = new BoardBean();
		dto.setBoard_name(board_name);
		dto.setBoard_title(board_title);
		dto.setBoard_cont(board_cont);
		dto.setBoard_pwd(board_pwd);
		
		// 3. DAO 메서드 호출
		BoardDAO dao = new BoardDAO();
		int re = dao.insertBoard(dto); // 레코드 삽입
		
		// 4. view page 포워딩
		ActionForward forward = new ActionForward();
		if(re>=1){ // 성공
			forward.setRedirect(true); // *.do 이동
			forward.setPath("board_list.do"); // 목록
		}else{ // 실패
			forward.setRedirect(false); // *.jsp 이동
			forward.setPath("/board/board_write.jsp");
		}
		
		return forward;
	}

}





