package com.controller.admin;

import com.model.Message;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/message")
public class AdminMessageController {
    @Autowired
    MessageService messageService;



    @RequestMapping(value="/add")
    public String add(Model model) {

        model.addAttribute("title", "留言 - 猿馆后台 ");
        return "admin/messageAdd";
    }
    @RequestMapping(value="/add",method= RequestMethod.POST)
    @ResponseBody
    public String add(@Valid @RequestBody Message message, BindingResult result) {
//		System.out.println("收到一个/admin/add请求，参数为："+blog.toString());

        if(result.hasErrors()) {

            return null;
        }

        return messageService.add(message);
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

        return messageService.delete(id);
    }

    @RequestMapping(value="/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public boolean update(@RequestBody Message message) {

        return messageService.update(message);
    }

}
