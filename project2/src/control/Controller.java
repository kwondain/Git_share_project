package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

@WebServlet(description = "mvc컨트롤러", 
		    urlPatterns = {"*.do"}, 
		    initParams = { 
				@WebInitParam(name = "config", 
						      value = "/WEB-INF/command.properties", 
						      description = "명령어초기화 파일")
				}
            )
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//commandMap 객체 생성
	 Map<String, CommandAction> commandMap = new HashMap<>();
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()메소드 시작");
	//1. 프로퍼티 읽어서 저장
		Properties props = new Properties();
		String initParam = config.getInitParameter("config");
		System.out.println("initParam="+initParam);
		FileInputStream f=null;
		try {
			String configFilePath 
			            = config.getServletContext().getRealPath(initParam);
			System.out.println("configFilePath="+configFilePath);
			f= new FileInputStream(configFilePath);
			props.load(f);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(f!=null) f.close();}catch(Exception e){}
		}
	//2. 프로퍼티에 있는 키 값을 commandMap에 저장
		Iterator<Object> iterator = props.keySet().iterator();
		while(iterator.hasNext()) {
			String command = (String) iterator.next();//
			String commandClass = props.getProperty(command);
			System.out.println("init- command="+command);
			try {
				Class className = Class.forName(commandClass);
				CommandAction action 
				           = (CommandAction) className.newInstance();//
				commandMap.put(command, action);
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}//커멘드맵에 저장 완료
		System.out.println("init()메소드 끝.");
	}//init()메소드 끝.
	
	
    //service()메소드 -> doGet()와 doPost() 나위어짐
	protected void service(HttpServletRequest request, 
			                HttpServletResponse response) 
			    throws ServletException, IOException {
		requestPro(request,response);
	}
	
	
	//서비스 실행부
	private void requestPro(HttpServletRequest request, 
                 HttpServletResponse response) 
                		 throws ServletException, IOException{
	String view =null;
	CommandAction action=null;
	try {
		 String command = request.getRequestURI();
		 if(command.indexOf(request.getContextPath())==0) {
			 command = 
				command.substring(request.getContextPath().length()+1);
			 System.out.println("command="+command);
		 }
		 action = (CommandAction)commandMap.get(command);//해당 객체 얻기
		 System.out.println(action==null?"해당인스턴스없음":"해당인스턴스있음");
		 view = action.requestPro(request, response);//실행 후 이동 경로 얻기
		 System.out.println("view="+view);
	}catch(Throwable e) {
		throw new ServletException(e);
	}
	  //view로 이동처리
      RequestDispatcher rd
       = request.getRequestDispatcher(view);
      rd.forward(request, response);
	}//requestPro() 메소드 끝.

}
