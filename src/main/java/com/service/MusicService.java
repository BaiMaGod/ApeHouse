package com.service;


import com.model.Music;
import com.pojo.Page;

import java.util.List;

public interface MusicService {
    List getMusic(int number);
    List getWangyiMusic(int number);

    String add(Music music);
    boolean delete(String id);
    boolean update(Music music);

    int countByExample(Music music);

    Music findById(String id);
    List<Music> findByExample(Music music, Page page);
}
