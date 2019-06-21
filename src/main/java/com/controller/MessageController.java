package com.controller;


import com.model.Message;
import com.pojo.Page;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    MessageService messageService;


    @RequestMapping("")
    public String list(Model model){
        model.addAttribute("messages",messageService.findByExample(new Message(), new Page()));
        model.addAttribute("title", "留言板 - 猿馆");

        return "blog/message";
    }


    @RequestMapping("/detail")
    @ResponseBody
    public Message detail(@RequestParam String id, Model model) {
        Message message = messageService.findById(id);

        return message;
    }



    @RequestMapping("/all")
    @ResponseBody
    public List<Message> queryAll(Page page){


        return messageService.findByExample(new Message(),page);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public List<Message> query(@RequestBody Message message, Page page){


        return messageService.findByExample(message, page);
    }
}
