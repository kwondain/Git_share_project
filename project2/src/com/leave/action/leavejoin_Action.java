package com.leave.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.leave.model.LeaveBean;
import com.leave.model.LeaveDao;
import com.oreilly.servlet.MultipartRequest;



public class leavejoin_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		LeaveBean bean = new LeaveBean();
		
		String saveFolder=request.getRealPath("/upload");
/*		String saveFolder = "C:\\Users\\Administrator\\git\\Git_share_project\\project2\\WebContent\\upload";
*/
 	   	System.out.println(saveFolder);
		
 	   	
		int fileSize = 5*1024*1024;
		MultipartRequest multi=null;
		multi= new MultipartRequest(request, 
				saveFolder, 
				fileSize,
				"UTF-8");
		
		String leave_id = multi.getParameter("id");
		String leave_name = multi.getParameter("name");
		String leave_birth = multi.getParameter("birth");
		String leave_tel = multi.getParameter("tel");
		String leave_address = multi.getParameter("address");
		String leave_title = multi.getParameter("title");
		String leave_size = multi.getParameter("size");
		String leave_age = multi.getParameter("age");
		String[] leave_option = multi.getParameterValues("option");
		
		File leave_file = multi.getFile("file");
		
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
		bean.setLeave_name(leave_name);
		bean.setLeave_birth(leave_birth);
		bean.setLeave_tel(leave_tel);
		bean.setLeave_address(leave_address);
		bean.setLeave_title(leave_title);
		bean.setLeave_size(leave_size);
		bean.setLeave_age(leave_age);
		
		String option = "";
		if(leave_option!=null) {
			for(int i =0; i<leave_option.length ; i++) {
				option += leave_option[i]+", ";
			}
		}
		
		LeaveDao dao = new LeaveDao();
		
		bean.setLeave_option(option);
		
		int result = dao.insertLeave(bean);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('회원가입에 성공했습니다.');");
			out.println("location='./leavelist.do';");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('등록에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
			
		return null;
	}

}
