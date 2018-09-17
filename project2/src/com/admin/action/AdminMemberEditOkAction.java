package com.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminMemberDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;

public class AdminMemberEditOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		// 세션 객체는 Object 타입이기 때문에 String으로 다운캐스팅
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  
		  session=request.getSession();
		  String admin_id=(String)session.getAttribute("admin_id");
		  AdminMemberDAO dao = new AdminMemberDAO();
		  if(admin_id != null){	// id 세션 객체가 있는 경우
				String member_pass=request.getParameter("member_pass").trim();
				String member_name=request.getParameter("member_name").trim();
				String member_nickname=request.getParameter("member_nickname").trim();
				String member_gender=request.getParameter("member_gender").trim();
				String member_email=request.getParameter("member_email").trim();
				String member_zip=request.getParameter("member_zip").trim();
				String member_addr1=request.getParameter("member_addr1").trim();
				String member_addr2=request.getParameter("member_addr2").trim();
				String member_id=request.getParameter("member_id");
				MemberBean bean = new MemberBean();	// 빈 객체 생성
				/* 회원정보를 빈 클래스에 저장 - Setter() 사용 */
				
				bean.setMember_id(member_id);
				bean.setMember_pass(member_pass);
				bean.setMember_name(member_name);
				bean.setMember_nickname(member_nickname);
				bean.setMember_gender(member_gender);
				bean.setMember_email(member_email);
				bean.setMember_zip(member_zip);
				bean.setMember_addr1(member_addr1);
				bean.setMember_addr2(member_addr2);
				
				/* DAO 클래스의 수정 메소드 호출 */
				int re = dao.updateMember(bean);	// 수정 메소드 호출
				int page = Integer.parseInt(request.getParameter("page"));
				if(re==1){
					out.println("<script>");
					out.println("alert('회원정보가 수정되었습니다.');");
					out.println("<script>");
					MemberBean m = dao.getmemCont(member_id);
					request.setAttribute("m", m);
					ActionForward forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("./admin_member_cont.do?mem_id="+member_id+"&page="+page);
					return forward;
				}else{	// 수정 실패 시
					out.println("<script>");
					out.println("alert('회원정보가 수정에 실패했습니다..')");
					out.println("history.back()");
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