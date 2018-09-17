package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminGongjiDAO;
import com.gongji.model.GongjiBean;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiContAction implements Action{
	HttpSession session;
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out=response.getWriter();
	    session=request.getSession();
	    
	    String admin_id=(String)session.getAttribute("admin_id");
	    int page=1;
		   if(request.getParameter("page")!=null){
			   // 특정 페이지에서 page를 넘긴 경우
			   page=Integer.parseInt
					 (request.getParameter("page"));
			   // 해당 page로 변경
		   }
		   
	    if(admin_id == null){
	    	out.println("<script>");
	    	out.println("alert('관리자로 로그인 하세요!')");
	        out.println("location='admin_index.do'");
	        out.println("</script>");
	    }else{
	    	int gongji_no=Integer.parseInt(request.getParameter("gongji_no"));
	    	
	    	AdminGongjiDAO admingongjidao = new AdminGongjiDAO();
	    	
	    	GongjiBean g=admingongjidao.getGongjiCont(gongji_no);
	        //번호를 기준으로 디비로 부터 공지 내용을 가져옴.
	        
	        g.setGongji_cont(g.getGongji_cont().replace("\n","<br/>"));
	        //공지 내용 중 엔터키 친부분을 웹상에 보이게 할때 다음줄로 개행
	        
	        ActionForward forward = new ActionForward();
	        request.setAttribute("g", g);
	        request.setAttribute("page",page);
	        forward.setPath("./admin/admin_gongji_cont.jsp");
	        return forward;
	    }
		return null;
	
	}

}
