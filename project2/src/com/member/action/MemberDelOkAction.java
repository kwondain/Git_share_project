package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberDAO;

public class MemberDelOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		// 현재 로그인 사용자의 id 세션 가져오기
		String id = 
		   (String)session.getAttribute("id");
		if(id==null){ // 세션이 없는 경우
			out.println("<script>");
			out.println("alert('다시 로그인해주세요!')");
			out.println("location='member_Login.do'");
			out.println("</script>");
		}else{ // 세션이 있는 경우
			// 삭제폼에 넘어온 파라미터 받기
			String pass=
			request.getParameter("pwd").trim();
			// DAO 메서드 호출(삭제 메서드)
			MemberDAO dao = new MemberDAO();
			int re = 
			dao.deleteMember(id,pass);
			// 아이디,비번,탈퇴사유로 메서드 호출
			if(re==1){
				session.invalidate();//탈퇴시 세션만료
				out.println("<script>");
				out.println("alert('회원에서 탈퇴하셨습니다!')");
				out.println("location='./main.jsp'");
				out.println("</script>");
			}else if(re==0){ // 비번이 다른 경우
				out.println("<script>");
				out.println("alert('비번이 틀립니다!')");
				out.println("history.back()");
				out.println("</script>");
			}else if(re==-1){ // DAO 작업 실패 시
				out.println("<script>");
				out.println("alert('탈퇴에 실패했습니다!')");
				out.println("history.go(-1)");
				out.println("</script>");
			}			
		}	
		
		return null;
	}

}
