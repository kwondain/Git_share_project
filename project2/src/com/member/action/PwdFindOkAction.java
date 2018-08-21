package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;

public class PwdFindOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String pwd_id =
		request.getParameter("pwd_id").trim();
		String pwd_name =
	    request.getParameter("pwd_name").trim();
		// DAO 연동 객체 생성
		MemberDAO dao = new MemberDAO();
		// pwd_id와 pwd_name으로 비번 검색 메서드 호출		
		MemberBean bean = dao.findpwd(pwd_id, pwd_name);
		// 리턴 값은 빈 타입으로 받는다.
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(bean==null){ // 일치하는 id와 name이 없는 경우
			out.println("<script>");
			out.println("alert('입력한 정보가 없습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		}else{ // id와 name이 있는 경우
			// passwd 키에 사용자의 비번 저장
			request.setAttribute("passwd",
					bean.getMember_pass());
			// view page 포워딩
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/pwd_find.jsp");
			return forward; // 실제 포워딩
		}		
		return null;
	}

}
