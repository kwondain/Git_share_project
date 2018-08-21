package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberDAO;

public class MemberIdCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		int result = dao.checkMemberId(id);
		
		if(result>=1) {
			out.print("<script>");
			out.print("alert('이미 있는 아이디 입니다. 다른 아이디를 적어주세요.');");
			out.print("window.close();");
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('사용가능한 아이디 입니다.');");
			out.print("window.close();");
			out.print("</script>");
		}
		return null;
	}
	
}
