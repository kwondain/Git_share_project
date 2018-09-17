package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminGongjiDAO;
import com.gongji.model.GongjiBean;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiEditOKAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
HttpSession session = request.getSession();
		
		// 세션 객체는 Object 타입이기 때문에 String으로 다운캐스팅
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
				  
		  session=request.getSession();
		  String admin_id=(String)session.getAttribute("admin_id");
		  AdminGongjiDAO dao = new AdminGongjiDAO();
		  PrintWriter out = response.getWriter();
		  if(admin_id != null){	// id 세션 객체가 있는 경우
				int gongji_no=Integer.parseInt(request.getParameter("gongji_no").trim());
				String gongji_name=request.getParameter("gongji_name").trim();
				String gongji_title=request.getParameter("gongji_title").trim();
				String gongji_cont=request.getParameter("gongji_cont").trim();
				String gongji_pwd=request.getParameter("gongji_pwd").trim();

				GongjiBean bean = new GongjiBean();	// 빈 객체 생성
				/* 회원정보를 빈 클래스에 저장 - Setter() 사용 */
							
				bean.setGongji_no(gongji_no);
				bean.setGongji_name(gongji_name);
				bean.setGongji_title(gongji_title);
				bean.setGongji_cont(gongji_cont);
				bean.setGongji_pwd(gongji_pwd);				
				
				/* DAO 클래스의 수정 메소드 호출 */				
				int re = dao.updateMember(bean);	// 수정 메소드 호출
				int page=1;
				   if(request.getParameter("page")!=null){
					   // 특정 페이지에서 page를 넘긴 경우
					   page=Integer.parseInt
							 (request.getParameter("page"));
					   // 해당 page로 변경
				   }
				if(re==1){					
					ActionForward forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("./admin_gongji_list.do?page="+page);					
					return forward;
				}else{	// 수정 실패 시
					out.println("<script>");
					out.println("alert('회원정보가 수정에 실패했습니다..')");
					out.println("hisroty.back()");
					out.println("</script>");
				}
			}else{	// 세션이 만료된 경우
				out.println("<script>");
				  out.println("alert('관리자 아이디로 로그인 하세요!')");
				  out.println("location='admin_login.do'");
				  out.println("</script>");
			}					
			return null;
	}
	

}
