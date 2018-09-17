package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminLogoutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 세션 정보를 만료 시키고, 사용자 단 페이지 이동
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 속성 만료
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.')");
		out.println("location='./main.jsp'");
		out.println("</script>");
		
		return null;
	}

}
