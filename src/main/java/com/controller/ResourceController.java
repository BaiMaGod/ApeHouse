package com.controller;

import com.model.Resource;
import com.pojo.Page;
import com.service.ResourceService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/src/main/resource")
public class ResourceController {
    @Autowired
    ResourceService resourceService;

    @RequestMapping("/")
    public String resourceCenter(Resource resource,Page page,Model model){
    	System.out.println("收到一个/resourceCenter请求，参数为："+resource.toString()+page.toString());
    	
    	List<Resource> resources = resourceService.findByExample(resource, page);

    	model.addAttribute("resurces", resources);
        model.addAttribute("title","资源中心-猿馆");
        
        
        return "public/resourceCenter";
    }
    
    @RequestMapping("/fileUpload")
    public String fileUpload(Model model){
    	model.addAttribute("title","上传资源-猿馆");
    	
    	return "public/fileUpload";
    }
    
    @RequestMapping("/upload")
    public String upload(@Validated Resource resource,BindingResult result,Model model){
    	if(result.hasErrors()) {
    		model.addAttribute("errors", result.getAllErrors());
    		
    		return "public/resourceUploadFail";
    	}
    	
    	
    	String resourceId = resourceService.add(resource);

    	if(resourceId!=null) {
	    	model.addAttribute("resourceId", resourceId);
	    	model.addAttribute("title","上传成功-猿馆");
	        
	        return "public/resourceUploadSuccess";
    	}
    	
    	model.addAttribute("uploadError", "上传失败，数据错误");
    	model.addAttribute("title","上传失败-猿馆");
    	return "public/resourceUploadFail";
    }
}
