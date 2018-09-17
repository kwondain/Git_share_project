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

public class AdminGongjiFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();//출력스트림객체 생성
		session=request.getSession();//세션 객체 생성
		
		String admin_id=(String)session.getAttribute("admin_id");
		//관리자 세션 아이디값을 저장
		if(admin_id==null){
			out.println("<script>");
			out.println("alert('관리자 아이디로 다시 로그인 하세요!')");
			out.println("location='admin_index.do'");
			out.println("</script>");
		}else{
			/* 관리자 검색 공지 부분을 작성하고, 검색 결과 뷰페이지는
			 * admin_Gongji_find.jsp (과제물)
			 */
			AdminGongjiDAO gd=new AdminGongjiDAO();		  
			
		  	int page=1;
			int limit=7;
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			String find_name=null;
			
			if(request.getParameter("find_name").trim() != null){
			 find_name=request.getParameter("find_name").trim();
			 //검색어 저장
             // Tomcat의 server.xml 환경설정에서 인코딩 방식을 지정했으면
             // 아래 코드를 주석처리한다.
			 //find_name=new String(find_name.getBytes("8859_1"),"UTF-8");
			 //get방식으로 넘어온 언어 코딩 타입을 UTF-8로 바꿔서 안깨지게 함.
			}
			String find_field=null;
			if(request.getParameter("find_field")!=null){
			find_field=request.getParameter("find_field");
			//검색 필드 저장
			}		
						
			int listcount=gd.getListCount3("%"+find_name+"%",find_field); 
			//총 리스트 수를 받아옴.
						
			List<GongjiBean> gongjiList = gd.getGongjiSerch(page,limit,find_name,find_field); 
			//리스트를 받아옴.			
			
			int maxpage=0;
			if(listcount%limit==0){
				maxpage=listcount/limit;
			}else{
				maxpage=listcount/limit+1;
			}
			int startpage=(((int) ((double)page / 10 +0.9))-1)*10+1;
			
			int endpage=maxpage;
			
			if(endpage>startpage+limit-1) endpage=startpage+limit-1;
			
			
	   		request.setAttribute("page", page);		  //현재 페이지 수.
	   		request.setAttribute("maxpage", maxpage); //최대 페이지 수.
	   		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수.
	   		request.setAttribute("endpage", endpage);     //현재 페이지에 표시할 끝 페이지 수.
			request.setAttribute("listcount",listcount); //글 수.
			request.setAttribute("gongjiList", gongjiList);
			
			
			request.setAttribute("find_name",find_name);
			request.setAttribute("find_field",find_field);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_gongji_find.jsp");
			return forward;	
		}
		return null;
	}
	

}
