package com.member.action;

import java.io.File;
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
		// 이진파일 업로드 폴더 경로	
		String saveFolder="C:\\Users\\Administrator\\git\\Git_share_project\\project2\\WebContent\\upload";
		// 이진파일 업로드 최대 크기(5MB)-크기 지정
		int fileSize=5*1024*1024;	
		// 이진파일을 업로드 시키는 JAVA 클래스 객체 생성
		MultipartRequest multi=null;
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		/*
		 *  MultipartRequest는 이진파일 업로드 객체를 생성하는 클래스
		 *  첫번째 매개변수 : 사용자 폼에서 입력한 정보를 서버로 가져오는 역할
		 *  두번째 매개변수 : 이진파일 업로드 서버 경로(폴더 경로)
		 *  세번째 매개변수 : 이진파일 업로드 최대 크기
		 *  네번째 매개변수 : 언어 인코딩 방식
		 */
		/* 이진파일 업로드 객체를 이용하여 회원정보를 파라미터로 받음 */
		String member_id=multi.getParameter("member_id").trim();
		String member_pass=multi.getParameter("member_pass").trim();
		String member_name=multi.getParameter("member_name").trim();
		String member_nickname= multi.getParameter("member_nickname").trim();
		String member_gender= multi.getParameter("member_gender").trim();
		String member_email= multi.getParameter("member_email").trim();
		String member_zip1=multi.getParameter("member_zip1").trim();
		String member_zip2=multi.getParameter("member_zip2").trim();
		String member_addr1=multi.getParameter("member_addr1").trim();
		String member_addr2=multi.getParameter("member_addr2").trim();		   
		   
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
		     bean.setMember_zip1(member_zip1);
		     bean.setMember_zip2(member_zip2);
		     bean.setMember_addr1(member_addr1);
		     bean.setMember_addr2(member_addr2);	         
		    
		     /* DAO 클래스의 메소드 호출 */
		     dao.insertMember(bean); //저장메서드 호출		     
		     
		     /* View 페이지 포워딩 */
			 forward.setRedirect(true); // 포워딩 경로 변경
			 forward.setPath("./member_Login.do"); // view 페이지
			 return forward; // 실제 view 페이지 이동			
			}
		}
