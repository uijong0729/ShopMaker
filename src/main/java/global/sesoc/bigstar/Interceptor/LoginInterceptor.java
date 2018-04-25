package global.sesoc.bigstar.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
	
	System.out.println("인터셉털");
	try {
		HttpSession session = request.getSession();
		String loginCode = (String) session.getAttribute("loginCode");
		if(loginCode == null || loginCode == "")
		{
			response.sendRedirect("loginPage");
			return false;
		}
		else
		{
			return super.preHandle(request, response, handler);
		}
	}	
	catch(Exception e){
		System.out.println("세션이 없습니다.");
	}
		return super.preHandle(request, response, handler);
	}

}

