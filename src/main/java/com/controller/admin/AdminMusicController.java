package com.controller.admin;

import com.model.Music;
import com.service.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.io.*;

@Controller
@RequestMapping("/admin/music")
public class AdminMusicController {
    @Autowired
    MusicService musicService;


    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("title","添加音乐 - 猿馆后台");

//        add("gu");
//        add("xue");
//        add("vae");


        return "admin/musicAdd";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(@Valid @RequestBody Music music, BindingResult result){
        if(result.hasErrors()){

            return null;
        }

        return musicService.add(music);
    }



    private  void add(String songSheet){
        File file = new File("D:\\H\\Music\\wangyiyun\\"+songSheet+".txt");
        try {
            InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "UTF-8");
            BufferedReader br = new BufferedReader(isr);
            String name;
            Music music= new Music();
            while((name = br.readLine())!=null && !"".equals(name)){
                music.setName(name);
                music.setId(br.readLine());
                music.setArtist(br.readLine());
                music.setUrl("https://music.163.com/song/media/outer/url?id="+music.getId()+".mp3");
                music.setSongSheet(songSheet);

                musicService.add(music);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.out.println("打开文件出错");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("文件读取失败");
        }

    }
}
