package com.service;

import com.util.MyUtil;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Service
public class MusicServiceImpl implements MusicService {
    @Override
    public List getMusic(int number) {
        if(number==3){
            List<List<String>> res = new ArrayList<>();
            res.add(randomMusic("statics/music/vae/"));
            res.add(randomMusic("statics/music/gu/"));
            res.add(randomMusic("statics/music/xue/"));

            return res;
        }

        String path;
        if(number==0){
            path = "statics/music/vae";
        }else if(number==1){
            path = "statics/music/gu";
        }else{
            path = "statics/music/xue";
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
        List<String> musics = Arrays.asList(files);
        return musics;
    }
}
