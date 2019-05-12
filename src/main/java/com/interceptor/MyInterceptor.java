package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("loginUser");
		if(obj==null){
			String path=request.getContextPath();
			request.setAttribute("error", "未登陆，请先登陆");
			response.sendRedirect(path+"/login");
			return false;
		}
		return true;
	}
}
