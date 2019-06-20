package com.controller.admin;

import com.model.Album;
import com.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/album")
public class AdminAlbumController {
    @Autowired
    AlbumService albumService;


    @RequestMapping(value="/add")
    public String add(Model model) {

        model.addAttribute("title", "上传图册 - 猿馆后台 ");
        return "admin/albumAdd";
    }
    @RequestMapping(value="/add",method= RequestMethod.POST)
    @ResponseBody
    public String add(@Valid @RequestBody Album album, BindingResult result) {
//		System.out.println("收到一个/admin/add请求，参数为："+blog.toString());

        if(result.hasErrors()) {

            return null;
        }

        return albumService.add(album);
    }

    @RequestMapping(value="/addAlbumSuccess")
    public String addBlogSuccess(String id,Model model) {
        System.out.println("收到一个/admin/addAlbumSuccess，参数为："+id);

        model.addAttribute("id", id);
        return "admin/addAlbumSuccess";
    }




    @RequestMapping(value="/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public boolean delete(@PathVariable String id) {

        return albumService.delete(id);
    }

    @RequestMapping(value="/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public boolean update(@RequestBody Album album) {

        return albumService.update(album);
    }
}
