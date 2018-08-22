package com.member.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;
import com.member.model.MemberDAO;
import com.oreilly.servlet.MultipartRequest;

public class MemberJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {		
		// 클라이언트와 서버측 한글 인코딩 처리
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String member_id=request.getParameter("member_id").trim();
		String member_pass=request.getParameter("member_pass").trim();
		String member_name=request.getParameter("member_name").trim();
		String member_nickname= request.getParameter("member_nickname").trim();
		String member_gender= request.getParameter("member_gender").trim();
		String member_email= request.getParameter("member_email").trim();
		String member_zip=request.getParameter("member_zip").trim();
		String member_addr1=request.getParameter("member_addr1").trim();
		String member_addr2=request.getParameter("member_addr2").trim();		   
		   
		// DTO, DAO, ActionForward 객체 생성  
		MemberDAO dao=new MemberDAO();
		MemberBean bean=new MemberBean();
		ActionForward forward=new ActionForward();
	     
		     // 회원의 정보를 빈 클래스에 저장한다.
		     bean.setMember_id(member_id); 
		     bean.setMember_pass(member_pass);
		     bean.setMember_name(member_name);
		     bean.setMember_nickname(member_nickname);
		     bean.setMember_gender(member_gender);
		     bean.setMember_email(member_email);
		     bean.setMember_zip(member_zip);
		     bean.setMember_addr1(member_addr1);
		     bean.setMember_addr2(member_addr2);	         
		    
		     /* DAO 클래스의 메소드 호출 */	     
		     dao.insertMember(bean);


		     /* View 페이지 포워딩 */
		    forward.setRedirect(true); // 포워딩 경로 변경
		    forward.setPath("./member_Login.do"); // view 페이지
		    return forward; // 실제 view 페이지 이동			

		 }
}
		
