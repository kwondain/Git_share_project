package com.gongji.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.*;

// 공지사항 목록을 보여주는 컨트롤러 클래스
public class GongjiListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 디비 연동 객체 생성 (dao)
		GongjiDAO gongjidao = new GongjiDAO();
		
		int page=1;	// 현재 페이지
		int limit = 10;	// 한 페이지에 보여지는 목록수 지정(10개)
		
		if(request.getParameter("page") != null){
			// 넘어온 페이지 번호값이 있으면 true
			page = Integer.parseInt(request.getParameter("page"));
			// 쪽번호를 정수형으로변환하여 저장
		}
		
		int listcount=gongjidao.getListCount(); //총 리스트 수를 받아옴.		
		
		List<GongjiBean> gonjiList = gongjidao.getGongjiList(page,limit); //리스트를 받아옴.
					
		List<GongjiBean> gList2=new ArrayList<GongjiBean>();
		
		String gongji_title=null;
		
		for(int i=0;i<gonjiList.size();i++){
		  GongjiBean g=gonjiList.get(i);//공지 목록을 받아옴
		  gongji_title=g.getGongji_title();//공지 제목을 저장
		  
		  if(gongji_title.length() >= 24){//문자열 길이가 14자 이상이면
			  gongji_title=gongji_title.substring(0,24)+"...";
			  //0이상 14미만 사이의 문자열을 반환+... 으로 처리		  
		  }
		  GongjiBean g2=new GongjiBean();
		  g2.setGongji_title(gongji_title);
		  g2.setGongji_regdate(g.getGongji_regdate());
		  g2.setGongji_no(g.getGongji_no());
		  g2.setGongji_name(g.getGongji_name());
		  g2.setGongji_hit(g.getGongji_hit());
		  gList2.add(g2);//컬렉션에 요소값 추가
		}		
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
		request.setAttribute("gonjiList", gList2);
		
		/* view page 포워딩 */
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./gongji/gongji_list.jsp");
		
		return forward;	// 실제 페이지 포워딩
	}

	
}
