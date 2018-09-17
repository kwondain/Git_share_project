package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.*;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiDelOKAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session;
		response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  session=request.getSession();
		  
		  String admin_id=(String)session.getAttribute("admin_id");
		  
		  if(admin_id == null){
			  out.println("<script>");
			  out.println("alert('관리자 아이디로 로그인 하세요!')");
			  out.println("location='admin_login.do'");
			  out.println("</script>");
		  }else{
		  int gongji_no=Integer.parseInt(request.getParameter("gongji_no"));
		  int page=1;
		  if(request.getParameter("page") != null){
		     page=Integer.parseInt(request.getParameter("page"));	  
		  }
		    AdminGongjiDAO md=new AdminGongjiDAO();
		    System.out.println("1234");
		    md.deleteGongji(gongji_no);//아이디를 기준으로 삭제
		    System.out.println("5678");
		    response.sendRedirect("admin_gongji_list.do?page="+page);
		  }
		  return null;
	}

	
}
