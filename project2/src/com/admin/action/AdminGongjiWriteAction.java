package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
HttpSession session = request.getSession();
		
		// 세션 객체는 Object 타입이기 때문에 String으로 다운캐스팅
		 response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  System.out.println("1234");
		  session=request.getSession();
		  String admin_id=(String)session.getAttribute("admin_id");
		  
		  if(admin_id == null){
			  out.println("<script>");
			  out.println("alert('관리자 아이디로 로그인 하세요!')");
			  out.println("location='admin_login.do'");
			  out.println("</script>");
		  }else{	// id 세션이 있는 경우
			/* DAO 클래스의 메소드 호출 */
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_gongji_write.jsp");
			return forward;	// 실제view 페이지로 포워딩 시킴
		}
		return null;
	}
	

}
