package com.controller;

import com.fasterxml.jackson.databind.ser.std.SerializableSerializer;
import com.model.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PublicController {
    @Autowired
	UserService userService;

	@RequestMapping("/main")
	public String main(Model model) {

		model.addAttribute("title","猿馆-白马46的个人博客");
		return "public/main";
	}


	@RequestMapping("/login")
	public String login() {

		return "public/login";
	}

	@RequestMapping("/doLogin")
	@ResponseBody
	public String doLogin(User user, HttpSession session, HttpServletRequest request) {
		User loginUser = userService.login(user,request);

		if(loginUser==null) {
			return "0";
		}

		session.setAttribute("loginUser",loginUser);
		return "1";
	}
}
