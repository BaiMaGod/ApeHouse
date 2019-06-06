package com.controller;

import com.model.User;
import com.pojo.JsonMsg;
import com.pojo.Page;
import com.service.ResourceServiceImpl;
import com.service.UserService;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class PublicController {
    @Autowired
	UserService userService;

	@RequestMapping("/main")
	public String main(Model model) {

		model.addAttribute("title","猿馆-白马46的个人博客");
		return "public/home";
	}


	@RequestMapping("/login")
	public String login() {

		return "public/login";
	}

	@RequestMapping("/doLogin")
	@ResponseBody
	public JsonMsg doLogin(@Validated @RequestBody User user,BindingResult result, HttpSession session, HttpServletRequest request,Model model,HttpServletResponse response) {
		FieldError numberError = result.getFieldError("number");
		FieldError passwordError = result.getFieldError("password");
		
		System.out.println("接收到一个登录请求");
		
		if(numberError!=null || passwordError!=null) {
//			if(numberError!=null) {
//				model.addAttribute("login_number", numberError.getDefaultMessage());
//			}
//			if(passwordError!=null) {
//				model.addAttribute("login_password", passwordError.getDefaultMessage());
//			}
			model.addAttribute("errors",result.getAllErrors());
			response.setHeader("access-Control-Allow-Origin","*");
			
			return new JsonMsg(0);
		}
		
		User loginUser = userService.login(user,request);

		if(loginUser==null) {
			
			return new JsonMsg(0,"账号或密码错误");
		}

		session.setAttribute("loginUser",loginUser);
		return new JsonMsg(1);
	}
	
	
	@Test
	public void test() {
		Page page  = new Page();
		
		System.out.println(page.toString());
		
		ResourceServiceImpl  resourceServiceImpl = new ResourceServiceImpl();
		
		resourceServiceImpl.find(page);
		System.out.println(page.toString());
		
		System.out.println("test finaily");
	}
}
