package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminGongjiDAO;
import com.gongji.model.GongjiBean;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// 세션 객체는 Object 타입이기 때문에 String으로 다운캐스팅
		 response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  
		  session=request.getSession();
		  String admin_id=(String)session.getAttribute("admin_id");
		  
		  if(admin_id == null){
			  out.println("<script>");
			  out.println("alert('관리자 아이디로 로그인 하세요!')");
			  out.println("location='admin_index.do'");
			  out.println("</script>");
		  }else{	// id 세션이 있는 경우
			/* DAO 클래스의 메소드 호출 */
			int gongji_no = Integer.parseInt(request.getParameter("gongji_no"));
			int page=Integer.parseInt(request.getParameter("page"));
			AdminGongjiDAO dao = new AdminGongjiDAO();
			GongjiBean g = dao.getGongji(gongji_no);	// 회원정보 가져옴
			// 회원정보를 "member"키에 저장
			request.setAttribute("g", g);
			request.setAttribute("page", page);
			/* view page로 포워딩 */
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_gongji_edit.jsp");
			return forward;	// 실제view 페이지로 포워딩 시킴
		}
		return null;
	}
	

}
