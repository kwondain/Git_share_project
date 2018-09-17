package com.gongji.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gongji.model.*;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class GongjiContAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		GongjiDAO gongjidao = new GongjiDAO();
		int gongji_no=
				Integer.parseInt(request.getParameter("gongji_no"));
		//공지 번호 저장
		int page=1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
			//페이지 번호 저장
		}
		
		gongjidao.updateGongjgHit(gongji_no);
		//조회수 증가
		GongjiBean gongji=gongjidao.getGongjiCont(gongji_no);
		request.setAttribute("page", page);
		request.setAttribute("gongji", gongji);	
		
		/* view page 포워딩 */
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./gongji/gongji_cont.jsp");
		
		return forward;	// 실제 페이지 포워딩
	}
	

}
