package com.controller;

import com.model.Blog;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PublicController {
    @Autowired
	MusicService musicService;
	@Autowired
	BlogService blogService;

	@RequestMapping("/")
	public String main(Model model,HttpServletRequest request) {
		if(MyUtil.serverPath == null){
//	        获取本项目在磁盘中的真实路径
			MyUtil.serverPath = request.getSession().getServletContext().getRealPath("/");
		}
		
		
		model.addAttribute("blogs", blogService.findByExample(new Blog(), new Page()));
		model.addAttribute("title","猿馆 - 白马46的个人博客");
		
		return "blog/home";
	}
	@RequestMapping("/main")
	public String main2(Model model) {
		model.addAttribute("blogs", blogService.findByExample(new Blog(), new Page()));
		model.addAttribute("title","猿馆 - 白马46的个人博客");
		
		return "blog/main";
	}

	@RequestMapping("/getMusic")
	@ResponseBody
	public List getMusic(int number) {

		return musicService.getMusic(number);
	}

}
