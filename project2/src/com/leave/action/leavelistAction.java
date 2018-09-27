package com.leave.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.leave.model.LeaveBean;
import com.leave.model.LeaveDao;

public class leavelistAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		LeaveDao dao = new LeaveDao();
		
		List<LeaveBean> list = dao.getLeaveList();
		
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./leave/leavelist.jsp");
		
		
		return forward;	
		
	}

}
