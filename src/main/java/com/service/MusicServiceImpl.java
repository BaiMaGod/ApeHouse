package com.service;

import com.util.MyUtil;

import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class MusicServiceImpl implements MusicService {
    @Override
    public List getMusic(int number) {
        if(number==3){
            List<List<String>> res = new ArrayList<>();
            res.add(randomMusic("ape/music/vae/"));
            res.add(randomMusic("ape/music/gu/"));
            res.add(randomMusic("ape/music/xue/"));

            return res;
        }

        String path;
        if(number==0){
            path = "ape/music/vae/";
        }else if(number==1){
            path = "ape/music/gu/";
        }else{
            path = "ape/music/xue/";
        }

        return randomMusic(path);
    }

    public List<String> randomMusic(String path){
        File file = new File(MyUtil.serverPath+path);
        if(!file.exists()) return null;

        String[] files = file.list();
        int len = files.length;
        int k;
        String temp;
        for(int i=0;i<len;i++){
            while( (k = (int)(Math.random()*len)) == i){ }
            temp = files[i];
            files[i] = files[k];
            files[k] = temp;
        }
        List<String> musics = new ArrayList<String>();
        for(int i=0;i<len;i++){
            musics.add(path+files[i]);
        }
        return musics;
    }
}
