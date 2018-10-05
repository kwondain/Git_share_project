package com.admin.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.order.model.ReservationDAO;
import com.order.model.Reservationbean;

public class AdminReservationAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		
		Reservationbean bean = new Reservationbean();
		ReservationDAO dao = new ReservationDAO();
		
		List<Reservationbean> list = dao.getReservation();
		
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/admin_Reservationlist.jsp");
		return forward;
	}

}
