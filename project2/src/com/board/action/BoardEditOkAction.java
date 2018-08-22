package com.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardBean;
import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

// 게시물 수정 액션클래스
public class BoardEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 히든 파라미터 받기(no, db_pwd)
		int no = Integer.parseInt
				(request.getParameter("no"));
		String db_pwd = request.getParameter("db_pwd");
		// 폼 파라미터 4개 받기
		String board_name = request.getParameter("board_name");
		String board_title = request.getParameter("board_title");
		String board_cont = request.getParameter("board_cont");
		String board_pwd = request.getParameter("board_pwd");
		
		PrintWriter out = response.getWriter();
		ActionForward forward=null;
		if(db_pwd.equals(board_pwd)){
			BoardBean dto = new BoardBean();
			dto.setBoard_no(no); // 수정 구분
			dto.setBoard_name(board_name);
			dto.setBoard_title(board_title);
			dto.setBoard_cont(board_cont);
			/* db 수정 */
			BoardDAO dao = new BoardDAO();
			dao.boardEdit(dto); // 레코드 수정
			/* view page 포워딩 */
			forward = new ActionForward();
			forward.setRedirect(true); // *.do
			forward.setPath("board_cont.do?no="+no);
		}else{
			out.println("<script>");
			out.println("alert('비번이 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
