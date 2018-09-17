package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;

public class AdminMemberEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		// 관리자 id 세션을 가져온다.
		String admin_id = 
			(String)session.getAttribute("admin_id");
		if(admin_id ==null){ // 세션이 없는 경우
			out.println("<script>");
			out.println("alert('관리자 아이디로 로그인 하세요!')");
			out.println("location='admin_index.do'");
			out.println("</script>");			
		}else{ // 세션 객체가 있는 경우
		   String mem_id=request.getParameter("mem_id");
		   int page = 
		   Integer.parseInt(request.getParameter("page"));
		   
		   // 회원정보 가져오기
		   MemberDAO dao = new MemberDAO(); 
		   MemberBean bean = dao.getMember(mem_id);
		   // 회원정보를 member 키에 저장
		   request.setAttribute("member",bean);
		   request.setAttribute("page",page);
		   // view page 포워딩
		   ActionForward forward = new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("./admin/admin_member_edit.jsp");
		   return forward;	
		}
	
		return null;
	}

}
