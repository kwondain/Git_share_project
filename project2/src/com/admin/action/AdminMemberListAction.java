package com.admin.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminMemberDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.MemberBean;

public class AdminMemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		//웹상에 보이는 한글을 안깨지게 언어코딩 타입을 지정
		PrintWriter out=response.getWriter();
		//출력스트림 객체를 생성
		HttpSession session = null;
		session=request.getSession();//세션 객체를 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//관리자 세션 아이디값을 저장
		
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('관리자 아이디로 로그인 하세요!')");
			out.println("location='admin_index.do'");
			out.println("</script>");
		}else{//관리자 회원목록
			int page=1;
			int limit=7; // 1페이지 당 보여주는 목록 수 
			
			AdminMemberDAO dao=new AdminMemberDAO();			
			
			if(request.getParameter("page")!=null){
				//get방식으로 넘어온 쪽번호가 정수형이라고 해도
				//문자열로 바껴져서 넘어온다.
				page=Integer.parseInt(request.getParameter("page"));
				//사칙연산을 하기 위해서 parseInt()메서드에 의해서
				//정수형 숫자로 바꾼다.
			}
			
			int listcount=dao.getListCount(); //총 리스트 수를 받아옴.		
			System.out.print("listcount:"+listcount);
			List<MemberBean> memList = dao.getMemberList(page,limit); //리스트를 받아옴.
											
			//총 페이지 수.
	  		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리.
	  		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	  		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	  		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	  		int endpage = maxpage;
	  		
	  		if (endpage>startpage+10-1) endpage=startpage+10-1;
	  		
	  		request.setAttribute("page", page);		  //현재 페이지 수.
	  		request.setAttribute("maxpage", maxpage); //최대 페이지 수.
	  		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수.
	  		request.setAttribute("endpage", endpage);     //현재 페이지에 표시할 끝 페이지 수.
			request.setAttribute("listcount",listcount); //총게시물수.
			request.setAttribute("memList", memList);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_member_list.jsp");
			return forward;
		}
		return null;
	}
	

}
