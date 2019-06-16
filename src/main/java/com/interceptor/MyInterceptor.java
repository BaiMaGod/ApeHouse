package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MyInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		System.out.println("拦截到一个敏感请求");
		
		
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("loginUser");
		if(obj==null){
			String path=request.getContextPath();
			request.setAttribute("error", "未登陆，请先登陆");
			response.sendRedirect(path+"/admin/login");
			return false;
		}
		return true;
	}
}
