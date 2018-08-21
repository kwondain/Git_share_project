package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;

public class MemberEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 로그인 사용자의 정보를 수정하는 컨트롤러
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 세션 객체를 생성
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null){
			out.println("<script>");
			out.println("alert('다시 로그인하세요!')");
			out.println("location='member_Login.do'");
			out.println("</script>");
		}else{ // id 세션이 있는 경우
			MemberDAO dao= new MemberDAO(); //db객체 생성
			MemberBean bean = dao.getMember(id);
			// 현재 로그인 사용자의 회원 정보를 가져온다.
			request.setAttribute("member", bean);
			// 회원정보를 "member"키에 저정
			// view page 포워딩
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_edit.jsp");
			return forward;
		}
		
		return null;
	}

}
