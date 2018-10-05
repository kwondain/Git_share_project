package com.leave.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.leave.model.LeaveBean;
import com.leave.model.LeaveDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class leave_updateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session=request.getSession();
		LeaveBean bean = new LeaveBean();
		PrintWriter out = response.getWriter();
		
		String saveFolder=request.getRealPath("/upload");
		int result;
		int fileSize = 5*1024*1024;
		MultipartRequest multi=null;
		multi= new MultipartRequest(request, 
				saveFolder, 
				fileSize,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		
		
		String leave_id = (String)session.getAttribute("id");
		String leave_address = multi.getParameter("address");
		String leave_title = multi.getParameter("title");
		String[] leave_option = multi.getParameterValues("option");
		
		
		File leave_file = multi.getFile("leave_file");
		
		System.out.println(leave_id);
		System.out.println(leave_address);
		System.out.println(leave_title);
		
		if(leave_file!=null) {
			Calendar c= Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			
			String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
			File path1 = new File(homedir);
			if(!path1.exists()) {//해당 디렉토리가 존재하지 않으면
				path1.mkdirs();//생성
			}
			Random r = new Random();
			int random = r.nextInt(100000000); 
			//파일 확장자 구하기 test1.txt
			int index = leave_file.getName().lastIndexOf(".");
			String fileExtension
			   = leave_file.getName().substring(index+1);//"."이후의 txt
			
			String refileName
			 = "leave"+year+month+date+random+"."+fileExtension;
			//파일명 수정
			leave_file.renameTo(new File(homedir+"/"+refileName));
			
			String fileDbName
			   = "/"+year+"-"+month+"-"+date+"/"+refileName;
			
			bean.setLeave_file(fileDbName);
		}
		
		bean.setLeave_id(leave_id);
		bean.setLeave_address(leave_address);
		bean.setLeave_title(leave_title);
		
		String option = "";
		if(leave_option!=null) {
			for(int i =0; i<leave_option.length ; i++) {
				option += leave_option[i]+", ";
			}
		}
		LeaveDao dao = new LeaveDao();
		
		bean.setLeave_option(option);
		
		if(leave_file !=null) {
			result = dao.getUpdate(bean, leave_id);
		}else {
			result = dao.getEditUpdate(bean, leave_id);
		}
		

		if(result >0 ) {
			out.println("<script>");
			out.println("alert('펫시터 정보 수정완료');");
			out.println("location='./main.jsp';");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정 실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}

}
