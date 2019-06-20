package com.controller;

import com.model.Log;
import com.pojo.Page;
import com.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    LogService logService;


    @RequestMapping("")
    public String list(Model model){
        model.addAttribute("logs",logService.findByExample(new Log(),new Page()));
        model.addAttribute("title","我的日志 - 猿馆");

        return "blog/log";
    }
}
