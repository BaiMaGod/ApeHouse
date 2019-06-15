package com.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.service.ImgService;
import com.util.MyUtil;

@Controller
@RequestMapping("/img")
public class AdminImgController {
	
	@RequestMapping("/{type}")
	public Map<String , Object> upload(@PathVariable String type,MultipartFile imgFile) {
		Map<String , Object> map = new HashMap<String, Object>();
		
		String url = MyUtil.fileSave(imgFile, "ape/img/"+type);
		
		map.put("success", 1);
		map.put("message", "");
		map.put("url", url);
		
		return map;
	}
}
