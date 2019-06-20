package com.controller.admin;

import com.model.Log;
import com.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/log")
public class AdminLogController {
    @Autowired
    LogService logService;



    @RequestMapping(value="/add")
    public String add(Model model) {

        model.addAttribute("title", "发布日志 - 猿馆后台 ");
        return "admin/logAdd";
    }
    @RequestMapping(value="/add",method= RequestMethod.POST)
    @ResponseBody
    public String add(@Valid @RequestBody Log log, BindingResult result) {
//		System.out.println("收到一个/admin/add请求，参数为："+blog.toString());

        if(result.hasErrors()) {

            return null;
        }

        return logService.add(log);
    }

    @RequestMapping(value="/addBSuccess")
    public String addSuccess(String id,Model model) {
        System.out.println("收到一个/admin/addSuccess请求，参数为："+id);

        model.addAttribute("id", id);
        return "admin/addSuccess";
    }




    @RequestMapping(value="/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public boolean delete(@PathVariable String id) {

        return logService.delete(id);
    }

    @RequestMapping(value="/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public boolean update(@RequestBody Log log) {

        return logService.update(log);
    }

}
