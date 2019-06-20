package com.controller;


import com.model.Album;
import com.pojo.Page;
import com.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    AlbumService albumService;


    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("albums", albumService.findByExample(new Album(), new Page()));
        model.addAttribute("title", "所有博客 - 猿馆");


        return "album/albumlist";
    }


    @RequestMapping("/detail")
    @ResponseBody
    public Album detail(@RequestParam String id, Model model) {
        Album album = albumService.findById(id);
        model.addAttribute("title", album.getTitle()+" - 猿馆");

        return album;
    }


    @RequestMapping("/{id}")
    public String queryById(@PathVariable String id, Model model) {
        Album album = albumService.findById(id);
        model.addAttribute("album", album);
        model.addAttribute("title", album.getTitle()+" - 猿馆");
        return "album/albumdetail";
    }





    @RequestMapping("/all")
    @ResponseBody
    public List<Album> queryAll(Page page){


        return albumService.findByExample(new Album(),page);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public List<Album> query(@RequestBody Album album, Page page){


        return albumService.findByExample(album, page);
    }
}
