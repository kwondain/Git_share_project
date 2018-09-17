package com.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;

public class AdminLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 관리자 로그인 뷰 페이지 연결 컨트롤러
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // *.jsp 이동
		forward.setPath("/admin/admin_login.jsp");
		return forward; // 실제 view page 포워딩
	}

}
