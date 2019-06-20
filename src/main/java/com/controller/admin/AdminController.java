package com.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.User;
import com.pojo.JsonMsg;
import com.service.UserService;
import com.util.MyUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	 @Autowired
	UserService userService;


	 @RequestMapping("")
	 public String home(Model model){
		 model.addAttribute("title","猿馆后台");

	 	return "admin/home";
	 }


	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		if(MyUtil.serverPath == null){
//	        获取本项目在磁盘中的真实路径
			MyUtil.serverPath = request.getSession().getServletContext().getRealPath("/");
		}
		

		return "admin/login";
	}

	@RequestMapping(value="/login",method=RequestMethod.POST)
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
