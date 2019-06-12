package com.controller;

import com.model.User;
import com.pojo.JsonMsg;
import com.pojo.Page;
import com.service.BlogService;
import com.service.MusicService;
import com.service.ResourceServiceImpl;
import com.service.UserService;

import com.util.MyUtil;
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
import java.util.List;

@Controller
public class PublicController {
    @Autowired
	UserService userService;
    @Autowired
	MusicService musicService;
	@Autowired
	BlogService blogService;

	@RequestMapping("/")
	public String main(Model model,HttpServletRequest request) {
		if(MyUtil.serverPath == null){
//        获取本项目在磁盘中的真实路径
			String realPath = request.getSession().getServletContext().getRealPath("/");
//        保存
			MyUtil.serverPath = realPath;
		}

		model.addAttribute("title","猿馆-白马46的个人博客");
		return "blog/home";
	}

	@RequestMapping("/getMusic")
	@ResponseBody
	public List getMusic(int number) {

		return musicService.getMusic(number);
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
	
	

}
