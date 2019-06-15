package com.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.service.ImgService;
import com.util.MyUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/img")
public class AdminImgController {
	
	@RequestMapping("/{type}")
	@ResponseBody
	public JSONObject upload(@PathVariable String type,@RequestParam(value = "editormd-image-file", required = true) MultipartFile imgFile) {
		JSONObject res = new JSONObject();
		
		String url = MyUtil.fileSave(imgFile, "ape\\img\\"+type);
		
		res.put("success", 1);
		res.put("message", "上传成功！");
		res.put("url", url);
		
		return res;
	}
}
