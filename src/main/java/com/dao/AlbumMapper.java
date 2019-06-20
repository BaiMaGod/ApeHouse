package com.dao;

import com.model.Album;
import com.model.AlbumExample;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AlbumMapper {
    long countByExample(AlbumExample example);

    int deleteByPrimaryKey(String id);

    int insert(Album record);

    int insertSelective(Album record);

    List<Album> selectByExampleWithBLOBs(AlbumExample example);

    List<Album> selectByExample(AlbumExample example);

    Album selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Album record);

    int updateByPrimaryKeyWithBLOBs(Album record);

    int updateByPrimaryKey(Album record);
}