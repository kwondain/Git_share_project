package com.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class BoardDelOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 문자셋 인코딩 방식 지정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 히든으로 넘어온 게시물 번호와 비번 받기
		int no = Integer.parseInt
				 (request.getParameter("no"));		
		String db_pwd = request.getParameter("db_pwd");
		
		// 사용자 입력한 비번 받기
		String del_pwd = request.getParameter("del_pwd");
		
		// 사용자 비번과 db 비번 비교
		if(del_pwd.equals(db_pwd)){ // 비번 일치
			BoardDAO dao = new BoardDAO(); // db 연동 객체
			dao.deleteBoard(no);// 레코드 삭제 메서드 호출
			// sendRedirect() 사용 예
			response.sendRedirect("board_list.do");
		}else{ // 비번 불일치
			out.println("<script>");
			out.println("alert('비번이 틀립니다.')");
			out.println("history.back()");// 이전페이지 이동
			out.println("</script>");
		}		
		return null;
	}

}
