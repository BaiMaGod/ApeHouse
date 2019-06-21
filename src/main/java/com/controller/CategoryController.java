package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Category;
import com.pojo.Page;
import com.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	
	
	@RequestMapping("/all")
	@ResponseBody
	public List<Category> queryAll(Page page){
		
		
		return categoryService.findAll(page);
	}

	@RequestMapping("/{type}")
	@ResponseBody
	public List<Category> query(@PathVariable String type, Page page){


		return categoryService.findByType(type, page);
	}
	
	@RequestMapping("/")
	@ResponseBody
	public List<Category> query(@RequestBody Category category,Page page){
		
		
		return categoryService.findByExample(category, page);
	}
}
