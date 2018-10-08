package com.leave.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.order.model.ReservationDAO;
import com.order.model.Reservationbean;

public class reservationAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		
		String id = (String)session.getAttribute("id");
		String leave_id = request.getParameter("leave_id");
		int pet_number = Integer.parseInt(request.getParameter("number"));
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		Reservationbean bean = new Reservationbean();
		
		bean.setId(id);
		bean.setLeave_id(leave_id);
		bean.setPet_number(pet_number);
		bean.setStartDate(startdate);
		bean.setEndDate(enddate);
		
		ReservationDAO dao = new ReservationDAO();
		int result = dao.insertReservation(bean);
		
		if(result>0) {
			out.println("<script>");
			out.println("alert('성공적으로 예약되었습니다.');");
			out.println("location.href='./main.jsp';");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('예약이 실패되었습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return null;
	}

}
