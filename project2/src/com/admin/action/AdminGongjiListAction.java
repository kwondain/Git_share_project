package com.admin.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminGongjiDAO;
import com.gongji.model.GongjiBean;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminGongjiListAction implements Action{
	HttpSession session;
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id==null){
			out.println("<script>");
			out.println("alert('관리자로 로그인 하세요!')");
			out.println("location='admin_index.do'");
			out.println("</script>");			
		}else{
	/* 관리자 공지사항 목록 뷰페이지 파일명이 admin_Gongji_list.jsp
	 * 페이지와 컨트롤 부분 ,jdbc 작성 과제물 */
			AdminGongjiDAO gd=new AdminGongjiDAO();
			int page=1;
			int limit=7;
			
			if(request.getParameter("page")!=null){
				//get방식으로 넘어온 쪽번호가 정수형이라고 해도
				//문자열로 바껴져서 넘어온다.
				page=Integer.parseInt(request.getParameter("page"));
				//사칙연산을 하기 위해서 parseInt()메서드에 의해서
				//정수형 숫자로 바꾼다.
			}
			
			int listcount=gd.getListCount(); //총 리스트 수를 받아옴.		
			
			List<GongjiBean> gonjiList = gd.getGongjiList(page,limit); //리스트를 받아옴.
					
			//총 페이지 수.
	  		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리.
	  		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	  		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	  		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	  		int endpage = maxpage;
	  		
	  		if (endpage>startpage+10-1) {
	  			endpage=startpage+10-1;
	  		}
	  		
	  		request.setAttribute("page", page);		  //현재 페이지 수.
	  		request.setAttribute("maxpage", maxpage); //최대 페이지 수.
	  		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수.
	  		request.setAttribute("endpage", endpage);     //현재 페이지에 표시할 끝 페이지 수.
			request.setAttribute("listcount",listcount); //총게시물수.
			request.setAttribute("gonjiList", gonjiList);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_gongji_list.jsp");
			return forward;

		}
		return null;
	}

	
}
