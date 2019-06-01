package com.controller;

import com.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResourceController {
    @Autowired
    ResourceService resourceService;

    @RequestMapping("/resourceCenter")
    public String resourceCenter(Model model){


        model.addAttribute("title","资源中心-猿馆");
        return "public/resourceCenter";
    }
}
