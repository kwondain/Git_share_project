package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;

public class MemberEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		// 로그인 사용자의 세션 객체 생성
		String id = (String)session.getAttribute("id");
		if(id!=null){ // 세션이 있는 경우
			// 수정폼에서 넘긴 파라미터 받음
			String member_pass 
			=request.getParameter("member_pass").trim();
			String member_name 
			=request.getParameter("member_name").trim();
			String member_nickname 
			=request.getParameter("member_nickname").trim();
			String member_gender
			=request.getParameter("member_gender").trim();
			String member_email 
			=request.getParameter("member_email").trim();
			String member_zip
			=request.getParameter("member_zip").trim();
			String member_addr1 
			=request.getParameter("member_addr1").trim();
			String member_addr2 
			=request.getParameter("member_addr2").trim();
			MemberBean bean = new MemberBean();
			// 빈의 Setter()로 필드값 저장
			bean.setMember_id(id); // id 저장
			bean.setMember_pass(member_pass);//pass 저장
			bean.setMember_name(member_name);//name 저장
			bean.setMember_nickname(member_nickname);//nickname 저장
			bean.setMember_gender(member_gender);//nickname 저장
			bean.setMember_email(member_email);//nickname 저장
			bean.setMember_zip(member_zip);//zip저장
			bean.setMember_addr1(member_addr1);//addr1저장
			bean.setMember_addr2(member_addr2);//addr2저장
			
			// 빈 객체를 DAO로 넘겨서 DB 저장한다.
			int re = dao.updateMember(bean);
			System.out.print(re);
			if(re==1){
				out.println("<script>");
				out.println("alert('수정에 성공하였습니다.')");
				out.println("location='./main.jsp'");
				out.println("</script>");
			}else{ // 수정 실패 시
				out.println("<script>");
				out.println("alert('수정에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else{ // id 세션 말료(null인 경우)
			out.println("<script>");
			out.println("alert('다시 로그인하세요.')");
			out.println("location='member_Login.do'");
			out.println("</script>");
		}		
		return null;
	}

}
