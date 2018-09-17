package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminGongjiDAO;
import com.gongji.model.GongjiBean;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiWriteOKAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session;
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id==null){
			out.println("<script>");
			out.println("alert('관리자로 로그인 하세요!')");
			out.println("location='admin_login.do'");
			out.println("</script>");
		}else{
			String gongji_name=request.getParameter("gongji_name").trim();
			String gongji_title=request.getParameter("gongji_title").trim();
			String gongji_cont=request.getParameter("gongji_cont").trim();
			String gongji_pwd=request.getParameter("gongji_pwd").trim();
		
			GongjiBean g=new GongjiBean();
			g.setGongji_name(gongji_name); g.setGongji_title(gongji_title);
			g.setGongji_cont(gongji_cont); g.setGongji_pwd(gongji_pwd);
			AdminGongjiDAO dao = new AdminGongjiDAO();
			int re = dao.insertGongji(g);//저장메서드 실행
			if(re == 1){
				out.println("<script>");
				out.println("alert('등록완료')");
				out.println("</script>");
				response.sendRedirect("admin_gongji_list.do");
			}else{
				out.println("<script>");
				out.println("alert('등록실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		//공지 목록으로 이동
		}
		return null;
	}
	

}
