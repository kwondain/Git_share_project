package com.leave.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.leave.model.LeaveBean;
import com.leave.model.LeaveDao;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;

public class leave_detailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String id = (String)session.getAttribute("id");
		String leave_id = request.getParameter("leave_id");
		
		if(id==null){
			out.println("<script>");
			out.println("alert('로그인 해주셔야 상세내용을 볼 수 있습니다.');");
			out.println("location='member_Login.do';");
			out.println("</script>");
		}else{
			LeaveDao dao = new LeaveDao();
			LeaveBean detail = dao.getleavedetail(leave_id);
			
			request.setAttribute("detail", detail);
			request.setAttribute("id", id);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./leave/leave_detail.jsp");
			return forward;
		}
		
		return null;
	}

}
