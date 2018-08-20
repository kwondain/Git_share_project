package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
	//추상메소드
	public String requestPro(HttpServletRequest request, 
                      HttpServletResponse response)
	throws Throwable;

}
