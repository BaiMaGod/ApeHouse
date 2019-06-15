package com.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Blog;
import com.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Autowired
	BlogService blogService;

	
	@RequestMapping("")
	public void main(Model model){
		
		model.addAttribute("title", "所有博客 - 猿馆");
	}
	
	
	@RequestMapping("/detail")
	@ResponseBody
	public Blog detail(@RequestParam String id,Model model) {
		Blog blog = blogService.findById(id);
		model.addAttribute("title", blog.getTitle()+" - 猿馆");
		
		return blog;
	}
	
	
	@RequestMapping("/{id}")
	public String queryById(@PathVariable String id,Model model) {
		Blog blog = blogService.findById(id);
		model.addAttribute("blog", blog);
		model.addAttribute("title", blog.getTitle()+" - 猿馆");
		return "blog/detail";
	}
	
}
