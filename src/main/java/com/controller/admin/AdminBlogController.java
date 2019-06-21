package com.controller.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Blog;
import com.service.BlogService;

@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController {
	@Autowired
	BlogService blogService;

	
	@RequestMapping(value="/add")
	public String add(Model model) {
		
		model.addAttribute("title", "发布博客 - 猿馆后台 ");
		return "admin/blogAdd";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(@Valid @RequestBody Blog blog,BindingResult result) {
//		System.out.println("收到一个/admin/add请求，参数为："+blog.toString());

		if(result.hasErrors()) {
			
			return null;
		}
		
		return blogService.add(blog);
	}
	
	@RequestMapping(value="/addSuccess")
	public String addBlogSuccess(String id,Model model) {
		System.out.println("收到一个/admin/addSuccess请求，参数为："+id);
		
		model.addAttribute("id", id);
		return "admin/addSuccess";
	}
	
	
	
	
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public boolean delete(@PathVariable String id) {
		
		return blogService.delete(id);
	}

	@RequestMapping(value="/update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("blog", blogService.findById(id));
		model.addAttribute("title", "修改博客 - 猿馆后台 ");

		return "admin/blogUpdate";
	}

	@RequestMapping(value="//update",method=RequestMethod.PUT)
	@ResponseBody
	public boolean update(@Valid @RequestBody Blog blog,BindingResult result) {
		if(result.hasErrors()) {

			return false;
		}
		
		return blogService.update(blog);
	}
}
