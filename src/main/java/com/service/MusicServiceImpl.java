package com.service;

import com.dao.MusicMapper;
import com.model.Music;
import com.model.MusicExample;
import com.pojo.Page;
import com.util.MyUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class MusicServiceImpl implements MusicService {
    @Autowired
    MusicMapper musicMapper;



    @Override
    public List getMusic(int number) {
        if(number==3){
            List<List<String>> res = new ArrayList<>();
            res.add(MyUtil.randomArray(MyUtil.getFileNames("ape/music/vae/"),"ape/music/vae/"));
            res.add(MyUtil.randomArray(MyUtil.getFileNames("ape/music/gu/"),"ape/music/gu/"));
            res.add(MyUtil.randomArray(MyUtil.getFileNames("ape/music/xue/"),"ape/music/xue/"));

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

        return MyUtil.randomArray(MyUtil.getFileNames(path),path);
    }

    List<String> getUrlList(Music music) {
        List<Music> musicList = findByExample(music, null);

        String[] musics = new String[musicList.size()];
        int i=0;
        for (Music music1 : musicList) {
            musics[i] = music1.getUrl();
            i++;
        }

        return MyUtil.randomArray(musics,"");
    }

    @Override
    public List getWangyiMusic(int number) {
        Music music = new Music();
        switch (number){
            case 0:
                music.setSongSheet("vae");
                return getUrlList(music);
            case 1:
                music.setSongSheet("gu");
                return getUrlList(music);
            case 2:
                music.setSongSheet("xue");
                return getUrlList(music);
        }

        List<List<String>> res = new ArrayList<>();
        music.setSongSheet("vae");
        res.add(getUrlList(music));
        music.setSongSheet("gu");
        res.add(getUrlList(music));
        music.setSongSheet("xue");
        res.add(getUrlList(music));

        return res;
    }



    @Override
    public String add(Music music) {
        music.setCreateTime(MyUtil.nowDate());

        return musicMapper.insertSelective(music)>0 ? "1" : "0";
    }

    @Override
    public boolean delete(String id) {
        return musicMapper.deleteByPrimaryKey(id)>0;
    }

    @Override
    public boolean update(Music music) {
        return musicMapper.updateByPrimaryKeySelective(music)>0;
    }

    @Override
    public int countByExample(Music music) {
        return 0;
    }

    @Override
    public Music findById(String id) {
        return musicMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Music> findByExample(Music music, Page page) {
        MusicExample example = new MusicExample();
        MusicExample.Criteria criteria = example.createCriteria();

        if(MyUtil.notEmpty(music.getId())){
            criteria.andIdEqualTo(music.getId());
        }
        if(MyUtil.notEmpty(music.getArtist())){
            criteria.andArtistEqualTo(music.getArtist());
        }
        if(MyUtil.notEmpty(music.getName())){
            criteria.andNameLike(music.getName());
        }
        if(MyUtil.notEmpty(music.getTag())){
            criteria.andTagLike(music.getTag());
        }
        if(MyUtil.notEmpty(music.getSongSheet())){
            criteria.andSongSheetEqualTo(music.getSongSheet());
        }

        if(page!=null){
            page.setTotalRows((int)musicMapper.countByExample(example));
            if(page.getCurPage()>0){
                example.setStartRow(page.getStartRow());
                example.setPageRows(page.getPageRows());
            }
        }

        return musicMapper.selectByExample(example);
    }

}
