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

public class AdminMemberFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		 request.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html;charset=UTF-8");
		  HttpSession session;
		  PrintWriter out=response.getWriter();
		  session=request.getSession();
		  
		  String admin_id=(String)session.getAttribute("admin_id");
		  
		  if(admin_id == null){
			  out.println("<script>");
			  out.println("alert('관리자 아이디로 로그인 하세요!')");
			  out.println("location='admin_index.do'");
			  out.println("</script>");		  
		  }else{
			  //회원검색부분 
			  AdminMemberDAO md=new AdminMemberDAO();		  
				
			  	int page=1;
				int limit=7;
				
				if(request.getParameter("page")!=null){
					page=Integer.parseInt(request.getParameter("page"));
				}
				
				String find_name=null;
				
				if(request.getParameter("find_name").trim() != null){
				 find_name=request.getParameter("find_name").trim();
				 //검색어 저장
				 //find_name=new String(find_name.getBytes("8859_1"),"UTF-8");
				 //get방식으로 넘어온 언어 코딩 타입을 UTF-8로 바꿔서 안깨지게 함.
				}
				String find_field=null;
				if(request.getParameter("find_field")!=null){
				find_field=request.getParameter("find_field");
			
				
				int listcount=md.getListCount3("%"+find_name+"%",find_field); 
		        				
				List<MemberBean> memList = md.getMemList3(page,limit,find_name,find_field); 
			   		
		   		
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
				request.setAttribute("memList", memList);
				
				request.setAttribute("find_name",find_name);
				request.setAttribute("find_field",find_field);
					
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./admin/admin_member_find.jsp");
				return forward;
				
				}
				
		  }
		return null;
	}
	
	
}
