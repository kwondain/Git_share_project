package com.leave.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.leave.model.LeaveBean;
import com.leave.model.LeaveDao;

public class leave_editAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String leave_id = request.getParameter("leave_id");
		
		LeaveDao dao = new LeaveDao();
		LeaveBean bean = dao.getleavedetail(leave_id);
		
		request.setAttribute("detail", bean);
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./leave/leaveEdit.jsp");
		
		return forward;
	}

}
