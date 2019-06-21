package com.controller;

import com.model.Blog;
import com.model.Log;
import com.model.Message;
import com.pojo.Page;
import com.service.BlogService;
import com.service.LogService;
import com.service.MessageService;
import com.service.MusicService;

import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PublicController {
    @Autowired
	MusicService musicService;
	@Autowired
	BlogService blogService;
	@Autowired
	LogService logService;
	@Autowired
	MessageService messageService;

	@RequestMapping("/")
	public String home(Model model,HttpServletRequest request) {
		if(MyUtil.serverPath == null){
//	        获取本项目在磁盘中的真实路径
			MyUtil.serverPath = request.getSession().getServletContext().getRealPath("/");
		}

		model.addAttribute("blogs", blogService.findByExample(new Blog(), new Page()));
		model.addAttribute("logs", logService.findByExample(new Log(), new Page()));
		model.addAttribute("messages",messageService.findByExample(new Message(), null));
		model.addAttribute("title","猿馆 - 白马46的个人博客");
		
		return "blog/main";
	}
	@RequestMapping("/main")
	public String main1(Model model) {
		model.addAttribute("blogs", blogService.findByExample(new Blog(), new Page()));
		model.addAttribute("title","猿馆 - 白马46的个人博客");
		
		return "blog/home";
	}
	@RequestMapping("/main2")
	public String main2(Model model) {
		model.addAttribute("blogs", blogService.findByExample(new Blog(), new Page()));
		model.addAttribute("title","猿馆 - 白马46的个人博客");

		return "blog/main2";
	}
	@RequestMapping("/body")
	public String body(Model model) {
		model.addAttribute("blogs", blogService.findByExample(new Blog(), new Page()));
		model.addAttribute("title","博客列表 - 猿馆");

		return "blog/body";
	}

	@RequestMapping("/getMusic")
	@ResponseBody
	public List getMusic(int number) {

		return musicService.getWangyiMusic(number);
	}

}
