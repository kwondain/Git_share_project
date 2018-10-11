package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberDAO;

public class passwordfindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		
		String id = request.getParameter("password_id");
		String name = request.getParameter("password_name");
		String birth = request.getParameter("password_birth");
		String email = request.getParameter("password_email");
		
		int result = dao.passwordfind(id,name,email);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('이메일로 비밀번호를 전송했습니다.');");
			out.println("window.close();");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('입력란을 다시 확인해주세요.');");
			out.println("location.back();");
			out.println("</script>");
		}
		
		
		return null;
	}

}
