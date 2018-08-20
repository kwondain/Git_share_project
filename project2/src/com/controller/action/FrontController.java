package com.controller.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream("C:\\Users\\HY_LEE\\git\\Git_share_project\\project2\\src\\com\\controller\\action\\mapping.properties");
		//�봽濡쒗띁�떚 �뙆�씪 濡쒕뱶, �옄諛붽꼍濡쒓뎄遺꾩� \\ or /
		prop.load(fis);
		fis.close();
		String value=prop.getProperty(command);

		if(value.substring(0,7).equals("execute")) {
			try {
				StringTokenizer st = new StringTokenizer(value,"|");
				String url_1 = st.nextToken();
				String url_2 = st.nextToken();
				Class url = Class.forName(url_2); //臾몄옄�뿴濡� �씫�뼱�삩 �겢�옒�뒪 �뙆�씪紐낆쓣 媛앹껜�솕�븳�떎.
				//媛앹껜�솕�븳 �겢�옒�뒪�뒗 Object�삎�씠誘�濡� 媛뺤젣 �떎�슫罹먯뒪�똿�빐�빞�븳�떎.
				action = (Action)url.newInstance();
				try {
					forward=action.execute(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}catch(ClassNotFoundException ex){
				ex.printStackTrace();
			}catch(InstantiationException ex){
				ex.printStackTrace();
			}catch(IllegalAccessException ex){
				ex.printStackTrace();
			}
		}else{  // view page
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		if(forward != null){
			if(forward.isRedirect()){ // true
				response.sendRedirect(forward.getPath());
			}else{ // false
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
}
