package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminMemberDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminMemberDelOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String admin_id = 
			 (String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('관리자로 다시 로그인하세요.')");
			// 관리자 로그인 페이지로 이동
			out.println("location='admin_index.do'");
			out.println("</script>");
		}else{
			String mem_id = request.getParameter("mem_id");
			int page=1;
			if(request.getParameter("page") != null){
				page = Integer.parseInt
						(request.getParameter("page"));
			}
			AdminMemberDAO dao = new AdminMemberDAO();
			dao.deleteMember(mem_id);// 레코드 삭제
			// 회원 목록보기로 이동(해당 페이지 번호 넘김)
			response.sendRedirect
			   ("admin_member_list.do?page="+page);
		}
		return null;
	}

}
