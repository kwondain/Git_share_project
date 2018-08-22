package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;

public class MemberLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 세션 객체 생성
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		String id=request.getParameter("id").trim();
		String pass=request.getParameter("pass").trim();
		// id와 pass가 db가 있는가 조회하는 메서드 
		int result = dao.userCheck(id, pass);
		if(result==1){ // 비번이 있는 경우
			// 해당 id의 정보를 빈 타입으로 넘겨받는다.
			MemberBean bean = dao.getMember(id);
			// 사용자 정보(4개 필드)를 변수에 저장
			String name=bean.getMember_name(); // 이름추출
			String nickname=bean.getMember_nickname();
			// 사용자의 세션 객체 생성
			session.setAttribute("id",id);
			session.setAttribute("name",name);
			session.setAttribute("nickname",nickname);
			
			
			// view page 포워딩
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);// *.do로 이동
			forward.setPath("./main.jsp");
			return forward; // 실제 포워딩		
		}else if(result==0){ // 비빈이 틀린 경우
			out.println("<script>");
			out.println("alert('비번이 일치하지 않음')");
			out.println("history.back()");
			out.println("</script>");			
		}else if(result==-1){// id가 없는 경우
			out.println("<script>");
			out.println("alert('등록되지 않는 아이디 입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}		
		return null;
	}

}
