package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminMemberDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;

public class AdminMemberContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// id를 클릭하면 회원의 상세정보 제공 컨트롤러
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		// admin_id 세션 객체를 가져온다.
		String admin_id = 
		     (String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('관리자 아이디로 로그인 하세요.')");
			out.println("location='admin_index.do'");
			out.println("</script>");
		}else{ // 세션 객체가 있는 경우
			// get 방식으로 넘긴 데이터(id/page)를 받음
		   String mem_id=request.getParameter("mem_id");
		   int page=1;
		   if(request.getParameter("page")!=null){
			   // 특정 페이지에서 page를 넘긴 경우
			   page=Integer.parseInt
					 (request.getParameter("page"));
			   // 해당 page로 변경
		   }
		   AdminMemberDAO dao = new AdminMemberDAO();
		   MemberBean bean = dao.getmemCont(mem_id);
		   // 회원아이디를 기준으로 회원정보 검색
		  
		   
		   // 회원의 정보와 page를 view page에 넘김
		   request.setAttribute("m",bean);
		   request.setAttribute("page",page);
		   
		   ActionForward forward = new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("./admin/admin_member_cont.jsp");
		   return forward; // 실제 view page 이동
		}		
		return null;
	}

}
