package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 로그인 수행 컨트롤러
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		// 관리자 id/pwd를 파리미터로 받음
		String admin_id 
		    = request.getParameter("admin_id").trim();
		String admin_pwd 
	        = request.getParameter("admin_pwd").trim();
		AdminDAO dao = new AdminDAO();
		int re = dao.admincheck(admin_id, admin_pwd);
		if(re==1){ // id/pwd 일치
			session.setAttribute("admin_id", admin_id);
			// view page 포워딩
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); // *.jps 이동
			forward.setPath("./admin/admin_main.jsp");
			return forward; // 실제 view page 이동
		}else if(re==-1){
			out.println("<script>");
			out.println("alert('등록되지 않은 관리자 입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else if(re==0){
			out.println("<script>");
			out.println("alert('비번이 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}		
		return null;
	}

}
