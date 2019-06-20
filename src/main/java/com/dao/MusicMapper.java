package com.dao;

import com.model.Music;
import com.model.MusicExample;
import java.util.List;

public interface MusicMapper {
    long countByExample(MusicExample example);

    int deleteByPrimaryKey(String id);

    int insert(Music record);

    int insertSelective(Music record);

    List<Music> selectByExample(MusicExample example);

    Music selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Music record);

    int updateByPrimaryKey(Music record);
}