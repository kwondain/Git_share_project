package com.leave.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.leave.model.LeaveDao;

public class leave_deleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String leave_id = request.getParameter("leave_id");
		
		LeaveDao dao = new LeaveDao();
		int result = dao.deleteLeave(leave_id);

		if(result > 0) {
			out.println("<script>");
			out.println("alert('삭제되었습니다.');");
			out.println("location='./leavelist.do';");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		
		return null;
	}

}
